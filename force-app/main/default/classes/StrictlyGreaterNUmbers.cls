public class StrictlyGreaterNUmbers {
    public void adjacentNumberAreLower(List<Integer> values){
        for (Integer i =1;i<values.size()-1;i++){
           // System.debug(values.get(i-1));
            if(values.get(i-1)<values.get(i) && values.get(i)>values.get(i+1)){
                //System.debug('Ali');
                System.debug(values.get(i));
            }
        }
    }

}