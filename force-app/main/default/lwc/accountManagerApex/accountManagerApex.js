import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountControllerForLwc.accInfo';

export default class AccountManagerApex extends LightningElement {
    @wire(getAccounts) accounts;
    get responseReceived(){
        if(this.accounts){
            return true;
        }
        return false;
    }
}