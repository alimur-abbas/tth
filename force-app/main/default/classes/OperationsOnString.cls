public class OperationsOnString {
    Public boolean checkString(String strValue){
        if(String.isBlank(strValue)){
            return null;
        }
        else if(strValue.contains('Test')){
            return True;
        }
        else if(strValue=='Salesforce'){
            return True;
        } 
        else{
            return false;
        }
    }

}