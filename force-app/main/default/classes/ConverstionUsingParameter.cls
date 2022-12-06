public class ConverstionUsingParameter {
    public void convertionToFeetAndInches(Integer firstValue,Integer secondValue){
        Integer SumOfValues = firstValue+secondValue;
        System.debug('Number of Feets '+sumOfValues/12);
        System.debug('Extra Inches '+Math.mod(sumOfValues,12));
        
    }
    public void convertionToKmAndMeters(Integer firstValue,Integer secondValue){
        Integer SumOfValues = firstValue+secondValue;
        System.debug('Number of Km '+sumOfValues/1000);
        System.debug('Extra Meters '+Math.mod(sumOfValues,1000));
        
    }
    
}