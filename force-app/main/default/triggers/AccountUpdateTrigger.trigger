trigger AccountUpdateTrigger on Account (before insert,before update) {
    for(Account acc :Trigger.new){
        if(acc.Industry=='Agriculture'){
            acc.Rating='Hot';
        }else if(acc.Industry =='Consulting'){
            acc.Rating='Warm';
        }else if(acc.Industry =='Electronics'){
            acc.Rating='Cold';
        }
        else{
            acc.Rating ='null';
        }
    }  
}