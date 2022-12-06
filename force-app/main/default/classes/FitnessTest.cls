@isTest
public class FitnessTest {
    @isTest
     public static void bmiCalculatorTest(){
        Fitness f1 = new Fitness();
        System.assertEquals(3, f1.bmiCalculator(12, 2), 'Test-Failed');
    }
    @isTest
    public static void CalculatePaceTest(){
        Fitness f1 = new Fitness();
        System.assertEquals(3, f1.CalculatePace(12, 240), 'Test-Failed');
    }

}