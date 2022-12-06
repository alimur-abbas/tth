/**
 * @description       : 
 * @author            : Mr Md Alimur Rehman Abbas
 * @group             : 
 * @last modified on  : 11-16-2022
 * @last modified by  : Mr Md Alimur Rehman Abbas
**/
public class StringManipulation {
    public string toUpperCaseUserDefined(String inputValue){
        return inputValue.toUpperCase();
    }
    public void containsValue(String inputValue){
        if(inputValue.contains('value')){
            System.debug('Invalid String');
        }
    }
    public void contatinationOnInput(String inputValue){
        System.debug(inputValue+' Works For Absyz');
    }

}