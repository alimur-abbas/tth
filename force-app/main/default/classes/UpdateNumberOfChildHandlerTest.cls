@isTest
public with sharing class UpdateNumberOfChildHandlerTest {
@TestSetup
static void makeData(){
    List<Merchandaise__c> merchList = new List<Merchandaise__c>();
    Merchandaise__c merch = new Merchandaise__c(Name = 'Test Merch', Price__c = 100, Quantity__c = 10);
    Merchandaise__c merch1 = new Merchandaise__c(Name = 'Test Merch 1', Price__c = 100, Quantity__c = 10);
    merchList.add(merch);
    merchList.add(merch1);
    insert merchList;
    Invoice__c inv = new Invoice__c(Name__c = 'Test Invoice',  Priority__c = 'low', Status__c = 'open');
    insert inv;
    List<Line_Item__c> lineItemList = new List<Line_Item__c>();
    for(Integer i = 0; i < 1000; i++){
        lineItemList.add(new Line_Item__c(Merchandaise__c = merch.Id, Invoice__c =inv.id, Quantity__c = 1));
    }
    if(lineItemList.size() > 0){
       
        insert lineItemList;
      
    }
}
@isTest
public static void afterInsertHandlerTest(){
    Test.startTest();
    List<Merchandaise__c> merchList = [SELECT Id, Name, Price__c, Quantity__c, Number_of_Childs__c FROM Merchandaise__c];
    if (merchList.size()==2){
        System.assertEquals(1000, merchList[0].Number_of_Childs__c);
        System.assertEquals(null, merchList[1].Number_of_Childs__c);
    }
    Test.stopTest();
    
}
@isTest
public static void afterUpdateHandlerTest(){
    Test.startTest();
    List<Line_Item__c> lineItemList = [SELECT Id, Merchandaise__c, Invoice__c, Quantity__c FROM Line_Item__c];
    Merchandaise__c merch = [SELECT Id, Name, Price__c, Quantity__c, Number_of_Childs__c FROM Merchandaise__c WHERE Name = 'Test Merch 1'];
    // for(Line_Item__c lineItem : lineItemList){
    //     lineItem.Merchandaise__c = merch.Id;
    // }
    lineItemList[0].Merchandaise__c = merch.Id;
    lineItemList[1].Merchandaise__c = merch.Id;
    lineItemList[2].Merchandaise__c = merch.Id;
    lineItemList[3].Merchandaise__c = merch.Id;
    lineItemList[4].Merchandaise__c = merch.Id;
   
    update lineItemList;
    //update merchList;
    List<Merchandaise__c> merchList = [SELECT Id, Name, Price__c, Quantity__c, Number_of_Childs__c FROM Merchandaise__c];
    System.assertEquals(194, merchList[0].Number_of_Childs__c);
    System.assertEquals(5, merchList[1].Number_of_Childs__c);

    Test.stopTest();
}
@isTest
public static void afterDeleteHandlerTest(){
    Test.startTest();
    List<Line_Item__c> lineItemList = [SELECT Id, Merchandaise__c, Invoice__c, Quantity__c FROM Line_Item__c];
    List<Line_Item__c> listToBeDeleted = new List<Line_Item__c>();
    for(Integer i = 0; i < 5; i++){
        listToBeDeleted.add(lineItemList[i]);
    }
    delete listToBeDeleted;
    List<Merchandaise__c> merchList = [SELECT Id, Name, Price__c, Quantity__c, Number_of_Childs__c FROM Merchandaise__c];
    System.assertEquals(194, merchList[0].Number_of_Childs__c);
    System.assertEquals(null, merchList[1].Number_of_Childs__c);
    Test.stopTest();
}
}