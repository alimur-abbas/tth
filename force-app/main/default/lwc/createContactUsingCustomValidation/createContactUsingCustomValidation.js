import { LightningElement,api } from 'lwc';

export default class CreateContactUsingCustomValidation extends LightningElement {
    @api recordId;
    // phoneNo;
    // showToast() {
    //     const event = new ShowToastEvent({
    //         title: 'Error',
    //         message:'Phone Number must be of length 10.',
    //         variant: 'error'
                
    //     });
    //     this.dispatchEvent(event);
    // }
    
    // handleSubmit(event){
    //     this.phoneNo=this.template.querySelector('.phone').value;
    //     if(this.phoneNo.length < 10){
    //         this.showToast();
    //     }
    // }
    // handleSuccess(event){
    //     this.showToast();
    //  }
}