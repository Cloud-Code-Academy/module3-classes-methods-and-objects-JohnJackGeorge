/**
 * The ClassesObjectsMethods class serves as an exploration into Object Oriented Programming in Apex.
 * It covers fundamental aspects such as class instantiation, method creation, encapsulation, and object interaction.
 *
 * This class introduces developers to the concept of creating and manipulating objects in Apex. It discusses
 * how to define classes, create methods, and use objects. This class uses two example classes - Person and Book.
 * 
 * Topics covered in this class include:
 * - Understanding how to define a class in Apex.
 * - Understanding how to create methods in Apex.
 * - Understanding how to instantiate objects of a class.
 * - Understanding encapsulation and the importance of getter and setter methods.
 *
 * Users of this class can expect to gain a strong understanding of Object Oriented Programming in Apex and
 * be prepared for more advanced topics in Salesforce development.
 * 
 * The Person class is a simple representation of a person with properties like name and age, and a method
 * that allows the person to introduce themselves.
 * 
 * The Book class is a simple representation of a book with properties like title and author, and methods
 * to read and close the book.
 * 
 * Resources:
 * String class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_string.htm
 * Date class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_date.htm
 * Math class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_math.htm
 * Classes: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_understanding.htm
 *
 * @author John George
 */

public with sharing class ClassesObjectsMethods {

    /**
     * Question 1
     * It initializes a String to "Hello, Salesforce!" and demonstrates usage of
     * the length, substring, and toLowerCase methods of the String class.
     * Example: practiceStringMethods() should return a list like ["17", "Hello", "hello, salesforce!"].
     * @return A list containing the length of the string, a substring of the string, and the string in lower case.
     */
    public static List<String> practiceStringMethods() {
        // Initialize a String with 'Hello, Salesforce!'
        String helloStr = 'Hello, Salesforce!';
        // Get the length of the String      
        Integer intStrLength = helloStr.length();
        String strLength = String.valueOf(intStrLength);

        // Get a substring of the String of the first 5 characters
        String firstFiveChars = helloStr.substring(0, 5);
        // Convert the String to lower case
        String lowerCaseStr = helloStr.toLowerCase();            
        
        // Return the list with the string data
        // In the first position add the string length
        // In the second position add the substring
        // In the third position add the string in lower case
        List<String> returnStr = new List<String>{strLength, firstFiveChars, lowerCaseStr};

        return returnStr;
    }

    /**
     * Question 2
     * Check if the input string starts with 'Sales', ends with 'Force', and contains 'Awesome'.
     * Example: checkStringContent('Salesforce is Awesome!') should return a list like [true, false, true].
     * @param input The input string.
     * @return A list of boolean values indicating whether the string starts with 'Sales', ends with 'Force', or contains 'Awesome'.
     */
    public static List<Boolean> checkStringContent(String input) {
        // Initialize a list to store the results
        List<Boolean> booleanList = new List<Boolean>();
        // Check if the string starts with 'Sales'
        if (input.startsWith('Sales')) {
            booleanList.add(true);
        } else {
            booleanList.add(false);
        }
        // Check if the string ends with 'Force'
        if (input.endsWith('Force')) {
            booleanList.add(true);
        } else {
            booleanList.add(false);
        }
        // Check if the string contains 'Awesome'
        if (input.contains('Awesome')) {
            booleanList.add(true);
        } else {
            booleanList.add(false);
        }

        return booleanList; 
    }

    /**
     * Question 3
     * Take a sentence then remove any duplicate words, and return the sentence with only unique words.
     * Example: removeDuplicateWords('Hello Hello Salesforce Salesforce') should return 'Hello Salesforce'.
     * @param sentence The input sentence.
     * @return A string consisting of only unique words from the input sentence.
     */
    public static String removeDuplicateWords(String sentence) {
        // Split the sentence into words
        List<String> wordList = sentence.split(' ', 0);
        // Create a set to store the unique words
        Set<String> wordsSet = new Set<String>();
        // Add each word to the set
        for (Integer i = 0; i < wordList.size(); i++) {
            wordsSet.add(wordList.get(i));
        }
        // Join the unique words back into a sentence
        String newSentence = String.join(new List<String>(wordsSet),' ');
        // Return the sentence with unique words
        return newSentence; 
    }

    /**
     * Question 4
     * This method takes a string as a parameter, and calculates the number of vowels in the string.
     * For simplicity, we will consider only five vowels: 'a', 'e', 'i', 'o', 'u', and we will ignore case.
     * Example: countVowels("Hello World!") should return 3
     * @param s The string in which to count vowels.
     * @return The number of vowels in the string.
     */
    public static Integer countVowels(String str) {
        // Initialize the result Integer
        String validCharString = 'aeiou';
        Integer totalVowels = 0;

        for (integer i=0; i < str.length(); i++){
            if(validCharString.contains((str.mid(i,1)).toLowerCase())) {
                totalVowels++;
            }
        }        
        System.debug('totalVowels=' + totalVowels); 
        return totalVowels;
    }
    
    /**
     * Question 5
     * Given a list of scientist names, combine their names together with a comma if it contains the letter 'g'.
     * The final string should not end with a comma.
     * Example: findTheScientist() should return "Alan Turing,Grace Hopper,Guido van Rossum,Stephen Hawking"
     * @return A string containing the names of scientists that contain the letter 'g'.
     */
    public static String findTheScientist() {
        // The list of scientists' names
        List<String> scientistNames = new List<String>{'Tim Berners-Lee', 'Alan Turing', 'Grace Hopper', 'Donald Knuth', 'Guido van Rossum', 'Ken Thompson', 'Stephen Hawking'};

        // The variable to store the concatenated string
        String scientistString = '';

        // Loop through the list of scientists' names
        for (String name : scientistNames) {
            // Add the name to the result string, followed by a comma
            if (name.contains('g') || name.contains('G')) {
                scientistString += name + ',';
            }
        }
        // Remove the last comma from the result string
        if(scientistString.endsWith(',')) {
            scientistString = scientistString.substring(0, scientistString.length() - 1);
        }
        return scientistString;
    }

    /**
     * Question 6
     * This method calculates the absolute value of the difference between of two input numbers 
     *   that are raised to the 2nd power.
     * Example: calculateDifferenceOfSquares(3, 4) should return 7.
     * @param a The first number.
     * @param b The second number.
     * @return The absolute value of the difference
     */
    public static Double calculateDifferenceOfSquares(Double a, Double b) {
        // Square the input numbers using the Math.pow() function
        Double aSquared = a * a;
        Double bSquared = b * b;
        Integer result;

        // Calculate the absolute difference using Math.abs() function
        result = Integer.valueOf(Math.abs(aSquared - bSquared));
        // Return the result
        return result; 
    }

    /**
     * Question 7
     * Generate a random number between 50 and 100
     * Example: generateRandomNumber() should return a number like 75.
     * @return A integer between 50 and 100.
     */
    public static Integer generateRandomNumber() {
        Integer result;
        // Use Math class to generate number between 50 and 100
        result = Integer.valueOf(Math.random() * (100 - 50 + 1)) + 50;
        // Return the random integer
        return result; 
    }

    /**
     * Question 8
     * Format the current date in the current user locale format.
     * Example: getCurrentDate() should return a string like "3/21/2001" for US locale users. Locale/String may differ depending on your location.
     * @return The current date in the current user locale format.
     */
    public static String getCurrentDate() {
        // Get the todays date
        Date today = Date.today();
        // Format the current date
        //String userLocale = UserInfo.getLocale();
        String formattedDate = today.format();
        // Return the result
        return formattedDate; 

    }

    /**
     * Question 9
     * Given a date time return the day of the week in number format
     * @param dt the current date and time
     * @return The number of the day of the week for the given date.
     */
    public static String getDayOfWeek(DateTime dt) {
        // Define a map of day of the week as a key and day number as the value
        // Monday = 1, Tuesday = 2, etc.
        Map<String,Integer> dayMap = new Map<String, Integer>();  
        dayMap.put('Monday',1);
        dayMap.put('Tuesday',2);
        dayMap.put('Wednesday',3);
        dayMap.put('Thursday',4);
        dayMap.put('Friday',5);
        dayMap.put('Saturday',6);
        dayMap.put('Sunday',7);

        // Get the day name using .format('EEEE');
        String dayOfWeek = dt.format('EEEE'); 
        // Get the day number from the map using the day name
        Integer dayNbr = dayMap.get(dayOfWeek);
        // Return the result as a string
        return String.valueOf(dayNbr);  
    }

    /**
     * Question 10
     * Calculate the difference between the years of two dates
     * For example, if the first date is 2023-01-01 and the second date is 2025-12-31, the method should return 2
     * If either of the dates is null, return null.
     * @param d1 The first date.
     * @param d2 The second date.
     * @return The a positive number years between the two dates, or null if either date is null.
     */
    public static Integer calculateYearDifference(Date d1, Date d2) {
        Integer yearsDifference;
        Integer absyearsDifference;

        if (d1 == null || d2 == null) {
            return null;
        } else {
            // Subtract the difference in years
            yearsDifference = d1.year() - d2.year();
            absyearsDifference = Math.abs(yearsDifference);
        }

        return absyearsDifference;
    }

    /**
     * Question 11
     * The Book class represents a book in a library. 
     * Each Book object has a title and an author, and methods to return these details.
     * This class can be used in the context of a library management system, bookstore, etc.
     * where you need to manipulate and manage book information.
     */
    public class Book {
        // Declare three public instance variables - title, author, pages
        
        public String title;   // title
        public String author;    // author        
        public Integer pages;  // pages
    
        // Book constructor to initialize the title and author
        public Book(String bookTitle, String bookAuthor) {
            // Initialize the title and author
            title = bookTitle;
            author = bookAuthor;
        }
        
        // Method that returns the details of the book
        public String getBookDetails() {
            // return A string containing the details of the book in the format "Title: <title>, Author: <author>"
            return 'Title: ' + title + ', Author: ' + author;  
        }
    }   

    /**
     * Question 12
     * Create a Book object and returns the details of the book.
     * For example, createAndGetBookDetails() should return a string like "Title: A Brief History of Time, Author: Stephen Hawking".
     * @return A string containing the details of the book.
     */
    public static String createAndGetBookDetails() {
        // Create a Book object with title "A Brief History of Time" and author "Stephen Hawking"
        String expectedTitle = 'A Brief History of Time';
        String expectedAuthor = 'Stephen Hawking';
        ClassesObjectsMethods.Book myBook = new ClassesObjectsMethods.Book(expectedTitle, expectedAuthor);

        // Call the getBookDetails method on the book object to get the details of the book
        String actualDetails = myBook.getBookDetails();

        // Return the details of the book
        return actualDetails;
    }

    /**
     * Question 13
     * Create and update two Book objects and returns the books.
     * For example, generateBookList(Book) should return a list like ["Title: Harry Potter and the Chamber of Secrets, Author: J.K. Rowling", 
     *          "Title: A Brief History of Time, Author: Stephen Hawking"].
     * Update Book 1 values: title = "Harry Potter and the Chamber of Secrets", author = "J.K. Rowling", pages = 352
     * Book 2 values: title = "A Brief History of Time", author = "Stephen Hawking"
     * @param myBook1 The first book object.
     * @return return a list of books.
     */
    public static List<Book> generateBookList(Book myBook1) {
        String expectedTitle = 'A Brief History of Time';
        String expectedAuthor = 'Stephen Hawking';
        // Create a list of books
        List<Book> bookList = new List<Book>();

        // Create a Book object with title "Harry Potter and the Chamber of Secrets" and author "J.K. Rowling"
        ClassesObjectsMethods.Book myBookNew = new ClassesObjectsMethods.Book(expectedTitle, expectedAuthor);

        // Update the title and author of myBook1
        myBookNew.title = 'Harry Potter and the Chamber of Secrets';
        myBookNew.author = 'J.K. Rowling';
        // Update the pages for myBookNew to 352
        myBookNew.pages = 352;

        // Create a new Book object with title "A Brief History of Time" and author "Stephen Hawking"
        ClassesObjectsMethods.Book myBook2 = new ClassesObjectsMethods.Book('A Brief History of Time', 'Stephen Hawking');

        // Update the pages for A Brief History of Time to 256
        myBook2.pages = 256;

        // Add the book to the list
        booklist.add(myBookNew);
        booklist.add(myBook2);

        return bookList; 
    }


    /**
     * Question 14
     * The Person class represents a person.
     * Each Person object has a name and an age, and methods to return these details.
     * This class can be used in the context of a school, college, etc.
     * where you need to manipulate and manage person information.
     */
    public class Person {
        // Declare private two instance variables - (TEXT) name and (Number) age
        private String name;   // name
        private Integer age;    // age   
                
        // Constructor to initialize the name and age
        
        public Person(String personName, Integer personAge) {
            // Initialize the title and author
            name = personName;
            age = personAge;
        }
        
        // Method introduceYourself that returns the details of the person        
        // Return a string in the format "Hello, my name is <name> and I am <age> years old."
        // For example, introduceYourself() should return a string like "Hello, my name is John Doe and I am 28 years old."
        
        public String introduceYourself() {
            return 'Hello, my name is ' + name + ' and I am ' + age + ' years old.';
        }
        
        // Getter method that returns the name of the person
        public String getName() {
            return name;
        }
        // Getter method that returns the age of the person
        public Integer getAge() {
            return age;
        }
        // Setter method that sets the name of the person
        public void setName(String newName) {
            name = newName;
        }
        // Setter method that sets the age of the person
        public void setAge(Integer newAge) {
            age = newAge;
        }
    }

    /**
     * Question 15
     * Create a Person object and returns the details of the person.
     * For example, personDetails() should return a list like ["Hello, my name is John Doe and I am 28 years old.", "John Doe", "28"].
     * @return A string containing the details of the person.
     */

    public static List<String> personDetails() {
        
        // Create a new instance of Person class
        // Name the person 'John Doe' and set the age to 28
        String expectedPersonName = 'John Doe';
        Integer expectedPersonAge = 28;

        ClassesObjectsMethods.Person myNewPerson = new ClassesObjectsMethods.Person(expectedPersonName, expectedPersonAge);

        // Create a list of books
        List<String> personList = new List<String>();

        // Add the details of the person using the introduceYourself method
        String intro = myNewPerson.introduceYourself();
        personList.add(intro);

        // Get the name of the person using the getter method and add it to the list
        String name = myNewPerson.getName();
        personList.add(name);

        // Get the age of the person using the getter method and add it to the list
        Integer age = myNewPerson.getAge();
        personList.add(String.valueOf(age));
        return personList; 
    }

    /**
     * Question 16
     * Create a Person object with the provided name and age.
     * @param name The name of the person.
     * @param age The age of the person.
     * @return A new instance of the Person class.
     */
    public static Person createPerson(String name, Integer age) {
        // Create a new instance of the Person class using the provided name and age
        String newPersonName = name;
        Integer newPersonAge = age;

        ClassesObjectsMethods.Person myNewPerson = new ClassesObjectsMethods.Person(newPersonName, newPersonAge);
        
        // Return the new instance of the Person class
        return myNewPerson; 
    }

    /**
     * Question 17
     * Create a method that constructs multiple Person objects.
     * You are to create a new Person object for each name in the provided List<String> of names,
     * using the same age for all Person objects. The method should return a List<Person> of all the Person objects created. 
     * @param names A list of names.
     * @param age The age to be set for all the Person objects.
     * @return A list of new Person objects.
     */
    public static List<Person> createMultiplePersons(List<String> names, Integer age) {

        // Create a new list to store the Person objects
        List<Person> persons = new List<Person>();

        // Loop through each name in the provided list of names
        for (String name : names) {
            // Create a new Person object for each name
            ClassesObjectsMethods.Person myNewPerson = new ClassesObjectsMethods.Person(name, age);

            // Add the new Person object to the list of Person objects
            persons.add(myNewPerson);
        }
        // Return the list of Person objects
        return persons; 
    }

    /**
     * Question 18
     * Compare two Person objects based on their ages.
     * If the first Person is older, the method should return the first Person. If the second Person is older, it should return the second Person.
     * If they are the same age, return either.
     *
     * @param person1 The first Person object.
     * @param person2 The second Person object.
     * @return The Person object of the older person.
     */
    public static Person getOlderPerson(Person person1, Person person2) {
        if (person1.age >= person2.age) {
            return person1;
        } else {
            return person2;
        }
    }
}