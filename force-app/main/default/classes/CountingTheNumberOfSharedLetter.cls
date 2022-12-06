public class CountingTheNumberOfSharedLetter {
    public void letterShared(String firstWord , String secondWord){
        Integer count =0;
        Integer individualValue;
        //System.debug(firstWord.charAt(0));
        // System.debug(individualValue);
        Integer len = firstWord.length();
        for(Integer i=0;i<len;i++){
            individualValue = firstWord.charAt(i);//is there any function to convert ascii value to character
            for(Integer j =0; j<secondWord.length();j++){
                if(individualValue==secondWord.charAt(j)){
                    count++;
                }
            }
           
        }
        System.debug(count);
    }

}