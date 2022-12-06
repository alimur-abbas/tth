import { LightningElement,track } from 'lwc';
import getContacts from '@salesforce/apex/SearchContact.getContacts';

export default class SearchContact extends LightningElement {
    @track conList=[];
    handleSearchContactChange (event) {
        getContacts({searchKey: event.target.value})
            .then(result => {
                this.conList = result;
                console.log(result);
            })
            .catch(error => {
                console.log(error);
            });
    }
}