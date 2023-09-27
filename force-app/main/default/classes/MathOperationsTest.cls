@isTest
public class MathOperationsTest {
    @isTest
    static void testAddNumbers() {
        // Create an instance of the MathOperations class
        MathOperations mathOps = new MathOperations();

        // Test case 1: Valid input
        Integer result1 = mathOps.addNumbers(3, 4);
        System.assertEquals(7, result1, 'Expected result: 7');

        // Test case 2: Null input
        Integer result2 = mathOps.addNumbers(null, 4);
        System.assertEquals(null, result2, 'Expected result: null');
    }
}