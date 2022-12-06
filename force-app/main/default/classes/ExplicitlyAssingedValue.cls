public class ExplicitlyAssingedValue {
    Integer firstValue = 10;
    Integer secondValue = 20;
    Integer thirdValue = 30;
    public void increaseValueAsASked(){
        firstValue = firstValue*10;
        secondValue = secondValue*10;
        thirdValue = thirdValue*10;
        System.debug(firstValue);
        System.debug(secondValue);
        System.debug(thirdValue);
    }

}