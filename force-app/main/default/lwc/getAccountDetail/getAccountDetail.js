import { LightningElement,api,wire } from 'lwc';
import { getRecord,getFieldValue} from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import BILLING_CITY_FIELD from '@salesforce/schema/Account.BillingCity';
import BILLING_STATE_FIELD from '@salesforce/schema/Account.BillingState';
import BILLING_COUNTRY_FIELD from '@salesforce/schema/Account.BillingCountry';
import BILLING_POSTAL_CODE_FIELD from '@salesforce/schema/Account.BillingPostalCode';
// import BILLING_ADDRESS_FIELD from '@salesforce/schema/Account.BillingAddress';




export default class GetAccountDetail extends LightningElement {
    @api recordId;
    Fields = [  NAME_FIELD,
                PHONE_FIELD,
                INDUSTRY_FIELD,
                TYPE_FIELD,
                ANNUAL_REVENUE_FIELD,
                BILLING_CITY_FIELD,
                BILLING_STATE_FIELD,
                BILLING_COUNTRY_FIELD,
                BILLING_POSTAL_CODE_FIELD
            ];

    //  @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD,
    //     PHONE_FIELD,
    //     INDUSTRY_FIELD,
    //     TYPE_FIELD,
    //     ANNUAL_REVENUE_FIELD,
    //     BILLING_CITY_FIELD,
    //     BILLING_STATE_FIELD,
    //     BILLING_COUNTRY_FIELD,
    //     BILLING_POSTAL_CODE_FIELD] }) records;
    @wire(getRecord, { recordId: '$recordId', fields: '$Fields' }) records;
    
    get name() {
       return getFieldValue(this.records.data, NAME_FIELD);
      // return this.records.data.fields.Name.value;
    }
    get phone() {
        return getFieldValue(this.records.data, PHONE_FIELD);
    }
    get industry() {
        return getFieldValue(this.records.data, INDUSTRY_FIELD);
    }
    get type() {
        return getFieldValue(this.records.data, TYPE_FIELD);
    }
    get annualRevenue() {
        return getFieldValue(this.records.data, ANNUAL_REVENUE_FIELD);
    }
    get billingCity() {
        return getFieldValue(this.records.data, BILLING_CITY_FIELD);
    }
    get billingState() {
        return getFieldValue(this.records.data, BILLING_STATE_FIELD);
    }
    get billingCountry() {
        return getFieldValue(this.records.data, BILLING_COUNTRY_FIELD);
    }
    get billingPostalCode() {
        return getFieldValue(this.records.data, BILLING_POSTAL_CODE_FIELD);
    }


    // get billingAddress() {
    //     return getFieldValue(this.records.data, BILLING_ADDRESS_FIELD);
    // }
    getAccount(){
        console.log('Data'+ JSON.stringify(this.records));
    }

}