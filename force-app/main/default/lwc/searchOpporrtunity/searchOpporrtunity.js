import { LightningElement,track } from 'lwc';
import getOpps from '@salesforce/apex/SearchOpportunity.getOpps';

export default class SearchOpporrtunity extends LightningElement {
    @track opps;
    searchKey;
    // handleKeyChange(event) {
    //     this.searchKey = event.target.value;
    // }
    handleSearch() {
        this.searchKey = this.template.querySelector('lightning-input').value;
        getOpps({ amount: this.searchKey })
            .then(result => {
                this.opps = result;
            })
            .catch(error => {
               // this.error = error;
               console.log(error.body.message);
            });
    }
}