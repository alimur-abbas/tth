public class CarWorkshop {
    public void numberOfCarPossible(Integer wheels, Integer bodies , Integer persons){
        wheels = wheels/4;
        persons = persons/2;
        if(wheels<=bodies && wheels<=persons){
            System.debug('Numbers of car that can be made with available parts are '+ wheels);//we can also use Math.min().
        } else if(bodies<=persons){
             System.debug('Numbers of car that can be made with available parts are '+ bodies);
        } else{
             System.debug('Numbers of car that can be made with available parts are '+ persons);
        }
        
    }

}