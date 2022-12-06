public class Fitness {
    
    public Integer CalculatePace(Integer distance, Integer timeInMinutes){
        return Integer.valueOf(distance/(timeInMinutes/60));
    }
    
    
    public Integer bmiCalculator(Integer weight,Integer height){
        return Integer.valueOf(weight/(height*height));
    }
    
}