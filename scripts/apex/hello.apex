// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents
/*        ClassesObjectsMethods.Book myTestBook = new ClassesObjectsMethods.Book('Test Title', 'Test Author');

        // Call the generateBookList method and capture the return value
        List<ClassesObjectsMethods.Book> result = ClassesObjectsMethods.generateBookList(myTestBook);
        
    String expectedTitle = '1984';
    String expectedAuthor = 'George Orwell';
    ClassesObjectsMethods.Book myBook = new ClassesObjectsMethods.Book(expectedTitle, expectedAuthor);

        System.Debug('myBook Title: ' + myBook.title + ', myBook Author: ' + myBook.author );

    // Check that the title and author were set correctly
    Assert.areEqual(expectedTitle, myBook.title, 'The title should be correctly set');
    Assert.areEqual(expectedAuthor, myBook.author, 'The author should be correctly set');

    // Call the getBookDetails method and verify the result
    String bookDetails = myBook.getBookDetails();

    System.Debug('expectedTitle: ' + expectedTitle + ', expectedAuthor: ' + expectedAuthor );
    System.Debug('bookDetails: ' + bookDetails);
    //  Verify the details
    //String expectedDetails = String.concat('Title: ' + expectedTitle + ', Author: ' + expectedAuthor);
    String expectedDetails = 'Title: ' + expectedTitle + ', Author: ' + expectedAuthor;
    // Assert.areEqual(expectedDetails, actualDetails, 'The method should return the correct book details');
    Assert.areEqual(expectedDetails, bookDetails, 'The book details should be correctly formatted');
*/

/*
    Class Person{
    string firstName;
    string lastName;
    string fullName; 

    Person(string input1, string input2){
        //set the firstName property of THIS instance of the Person class to input1;
        this.firstName = input1;
        //set the lastName property of THIS instance of the Person class to input2;
        this.lastName = input2;
        //set the fullName property of THIS instance of the Person class to input1 + input2;
        this.fullName = input1 + ' ' + input2; 
    }

    Person(){
        
    }
}


Person bruce = New Person(); 
Person jene = New Person('Jene', 'Fuller');

System.debug(bruce);
System.debug(jene);

*/
/*
//This is kinda-sorta true
Class Contact extends sObject{
    stringField firstName__c; 
    stringField lastName__c;
    formulaField fullName__c =  firstName__c + lastName__c;
}


////////////////////////////////////////
    String testName = 'Test Name';
        Integer testAge = 30;
        
        // Call the createPerson method and capture the return value
        ClassesObjectsMethods.Person resultPerson = ClassesObjectsMethods.createPerson(testName, testAge);

        // Use the Assert class to check that the result person's name and age matches the test name and age

        System.debug('Name: ' + resultPerson.getName());
        Assert.areEqual(testName, resultPerson.getName(), 'The person\'s name should match the test name');

        System.debug('Age: ' + resultPerson.getAge());
        Assert.areEqual(testAge, resultPerson.getAge(), 'The person\'s age should match the test age');

    // Define a list of names and an age for testing
    List<String> testNames = new List<String>{'Test Name 1', 'Test Name 2', 'Test Name 3'};
    Integer testAge = 30;
    
    // Call the createMultiplePersons method and capture the return value
    List<ClassesObjectsMethods.Person> resultPersons = ClassesObjectsMethods.createMultiplePersons(testNames, testAge);

    // Check that the number of persons returned matches the number of test names
    Assert.areEqual(testNames.size(), resultPersons.size(), 'The number of persons should match the number of test names');

    // Loop through each name in the test names
    for (Integer i = 0; i < testNames.size(); i++) {
        // Check that each person's name and age matches the test name and 
        System.debug('Name: ' + resultPersons[i].getName() + 'Age: ' + resultPersons[i].getAge());

        Assert.areEqual(testNames[i], resultPersons[i].getName(), 'The person\'s name should match the test name');
        Assert.areEqual(testAge, resultPersons[i].getAge(), 'The person\'s age should match the test age');
    }
*/
    // Create two Person objects with different ages
    ClassesObjectsMethods.Person person1 = new ClassesObjectsMethods.Person('Person1', 25);
    ClassesObjectsMethods.Person person2 = new ClassesObjectsMethods.Person('Person2', 30);
    System.debug('Test 1');
    System.debug('Person 1 Name: ' + person1.getName() + 'Age: ' + person1.getAge());
    System.debug('Person 2 Name: ' + person2.getName() + 'Age: ' + person2.getAge());

    // Call the getOlderPerson method and capture the return value
    ClassesObjectsMethods.Person resultPerson = ClassesObjectsMethods.getOlderPerson(person1, person2);
    System.debug('Old Person Name: ' + resultPerson.getName() + 'Age: ' + resultPerson.getAge());

    // Check that the returned Person object is the one with the greater age
    Assert.areEqual(person2, resultPerson, 'The returned Person should be the one with the greater age');

    // Swap the ages and retest
    person1.setAge(35);
    person2.setAge(30);
    System.debug('Test 2');
    System.debug('Person 1 Name: ' + person1.getName() + 'Age: ' + person1.getAge());
    System.debug('Person 2 Name: ' + person2.getName() + 'Age: ' + person2.getAge());

    // Call the getOlderPerson method and capture the return value
    resultPerson = ClassesObjectsMethods.getOlderPerson(person1, person2);
    System.debug('Old Person Name: ' + resultPerson.getName() + 'Age: ' + resultPerson.getAge());

    // Check that the returned Person object is the one with the greater age
    Assert.areEqual(person1, resultPerson, 'The returned Person should be the one with the greater age');

    // Set both ages to be equal and retest
    person1.setAge(40);
    person2.setAge(40);
    System.debug('Test 3');
    System.debug('Person 1 Name: ' + person1.getName() + 'Age: ' + person1.getAge());
    System.debug('Person 2 Name: ' + person2.getName() + 'Age: ' + person2.getAge());
    
    // Call the getOlderPerson method and capture the return value
    resultPerson = ClassesObjectsMethods.getOlderPerson(person1, person2);
    System.debug('Old Person Name: ' + resultPerson.getName() + 'Age: ' + resultPerson.getAge());

    // Check that the returned Person object is one of the two Persons
    Assert.isTrue(resultPerson == person1 || resultPerson == person2, 'The returned Person should be one of the two Persons');