import { LightningElement, track } from 'lwc';

export default class BadgesAssignmentInLwc extends LightningElement {
    @track crickterName=[];
    connectedCallback(){
    this.crickterName.push('Sachin');
    this.crickterName.push('Rohit');
    this.crickterName.push('Kohli');
    this.crickterName.push('Hardik');
    this.crickterName.push('pant');
    this.crickterName.push('Surya');
    this.crickterName.push('Bumrah');
    this.crickterName.push('Shami');
    this.crickterName.push('Jadeja');
    }
}