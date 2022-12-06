public with sharing class AssngmentOnDay20 {
    public AssngmentOnDay20() {
        
    }
    
    public Map<Merchandaise__c,List<Line_Item__c>> getMerchandiseList() {
        Map<Merchandaise__c,List<Line_Item__c>> merchMap = new Map<Merchandaise__c,List<Line_Item__c>>();
        //List<Merchandaise__c> merchList = [SELECT Id, Name, (SELECT Id, Name, Quantity__c, Unit_Price__c, Line_Item_Total__c FROM Line_Items__r) FROM Merchandaise__c];
        for (Merchandaise__c merch : [SELECT Id, Name, (SELECT Id, Name, Quantity__c, Unit_Price__c, Line_Item_Total__c FROM Line_Items__r) FROM Merchandaise__c]) {
            merchMap.put(merch, merch.Line_Items__r);
            
        }
        //System.debug(merchMap);
        return merchMap;
    }
    public void updateInvoiceStatus(){
        List<Invoice__c> invoiceList = [SELECT Id, Name, Status__c ,Invoice_Total__c FROM Invoice__c Where Invoice_Total__c>100];
        for (Invoice__c invoice : invoiceList) {
            //if(invoice.Invoice_Total__c>100)
                invoice.Status__c = 'Closed';
        }
       //System.debug(invoiceList);
        update invoiceList;
    }
    public void updateUnitPrice(){
        List<Merchandaise__c> lineItemListGet = [SELECT Name,Price__c,(select Id,Name , Unit_Price__c from Line_Items__r) from Merchandaise__c];
       // system.debug('my aggr results=>'+lineItemListGet);
        List<Line_Item__c> LineItemListSet = new  List<Line_Item__c>();
        for (Merchandaise__c lineItem : lineItemListGet) {
            //System.debug('1');
            if(lineItem.Price__c>100 && lineItem.Line_Items__r.size()>=5){
                //System.debug('2');
                for(Line_Item__c lineItemChild: lineItem.Line_Items__r) {
                    //System.debug('3');
                    lineItemChild.Unit_Price__c= 20;
                    LineItemListSet.add(lineItemChild);
                }
            }
                
        }
       // System.debug(LineItemListSet);
        update LineItemListSet;
    }
    public void orderCompletedUpdate(){
        Map<id,invoice__c> mapToBeUpdated = new map<id,invoice__c>();
        for(Line_Item__c lineItem :[SELECT id  FROM Line_Item__c WHERE Merchandaise__r.Order_Completed__c=true]){
            lineItem.Invoice__r.Order_Completed__c=true;
            mapToBeUpdated.put(lineItem.invoice__r.id,lineItem.invoice__r);
        }
        update mapToBeUpdated.values();
    
}
}