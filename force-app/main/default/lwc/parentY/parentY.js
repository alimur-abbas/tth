/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-15-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

import { LightningElement,track,api } from 'lwc';

export default class ParentY extends LightningElement {
    @track trackParam = 'trackParam';
    @api apiParam = 'apiParam';
    nonReactiveParam = 'nonreactiveParam';


    change(){
        this.trackParam = 'trackParamChanged';
        this.apiParam = 'apiParamChanged';
        this.nonReactiveParam = 'nonreactiveParamChanged';
    }
}