import { LightningElement ,api,wire} from 'lwc';
import getConRecords from '@salesforce/apex/DemoSessonClass.getContacts';


export default class DemoSession extends LightningElement {
@api recordId;
// @track contacts;
@wire(getConRecords) contacts;
// @track contact2=[];
connectedCallback(){
    console.log('abc: '+JSON.stringify(this.contacts));
}
// renderedCallback(){
//     console.log('render: '+JSON.stringify(this.contacts));
//     this.contact2=this.contacts.data;
// }
numbers=[1,2,3,4,5];
getContacts(event){
    console.log('Data'+ JSON.stringify(this.contacts));
}

}