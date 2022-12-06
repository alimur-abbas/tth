public with sharing class CreateData {
    @AuraEnabled(cacheable=true)
    public static List<WrapperCls> getData(){
        List<WrapperCls> Wrapper = new List<WrapperCls>();
        List<Contact> contacts = [SELECT Id, Name, Account.Name, Account.Id FROM Contact LIMIT 10];
        for(Contact c : contacts){
            WrapperCls w = new WrapperCls();
            w.contactName = c.Name;
            w.accountName = c.Account.Name;
            Wrapper.add(w);
        }
        return Wrapper;
        
    }

}
    

