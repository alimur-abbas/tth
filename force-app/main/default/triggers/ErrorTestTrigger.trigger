trigger ErrorTestTrigger on Account (After insert , before update, After update) {
    for(Account acc:Trigger.new ){
        if(acc.Industry =='Energy'){
            acc.Rating ='Hot';
        }
      Account newAccount = new Account(Name='Generated from Trigger');
        insert newAccount;
    }

}