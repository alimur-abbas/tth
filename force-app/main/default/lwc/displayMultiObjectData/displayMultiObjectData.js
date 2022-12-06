import { LightningElement,wire,track } from 'lwc';
import getDataWrapper from '@salesforce/apex/CreateData.getData';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import Contact_NAME_FIELD from '@salesforce/schema/Contact.Name';

export default class DisplayMultiObjectData extends LightningElement {
    //keyField=1;
  
    @wire(getDataWrapper) details;
    
    
    cols=[
        {label:' Account Name',fieldName:'accountName',type:'text'},
        {label:' Contact Name',fieldName:'contactName',type:'text'}
    ];

    get responseReceived () {
        if(this.details){
            return true;
        }else{
            return false;
        }
    
}
}
// connectedCallback(){
//         alert(JSON.stringify(this.details.data));   
//     }

    