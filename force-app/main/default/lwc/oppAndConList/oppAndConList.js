import { LightningElement, wire ,api, track} from 'lwc';
import opps from '@salesforce/apex/GetOpportunityListFromAccountId.getOppList';
import cons from '@salesforce/apex/GetContactAccountAndOpportunityDetail.getContactList';


export default class OppAndConList extends LightningElement {
    @api recordId;
    @wire(opps,{accountId:'$recordId'}) oppsList;
    @wire (cons,{id:'$recordId'}) consList;
    @track error;
    colsForOpp=[
        { label: 'Opp Name', fieldName: 'Name' },
        { label: 'Id', fieldName: 'Id'}
    ];
    colsForCon=[
        { label: 'Con Name', fieldName: 'Name' },
        { label: 'Id', fieldName: 'Id' }
    ];

    // @wire(opps, { accountId: '$recordId' })
    // oppsList;
//     @wire(opps, { recordId: '$recordId' })
//     wiredAccount({ error, data }) {
//         if (data) {
//             this.oppsList = data;
//             this.error = undefined;
//         } else if (error) {
//             this.error = error;
//             this.oppsList = undefined;
//         }
//     }

//     connectedCallback(){
//     // opps({accountId:this.recordId })
//     // .then(result=>{
//     //     console.log('result : '+JSON.stringify(result));
//     //     this.oppsList=result;
//     // });
//     cons({id:this.recordId })
//     .then(result=>{
//         console.log('result : '+JSON.stringify(result));
//         this.consList=result;
//     });
//     console.log('oppsList : '+JSON.stringify(this.oppsList));
//     console.log('oppsList : '+JSON.stringify(this.consList));
//    }
}