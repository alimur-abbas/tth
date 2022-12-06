import { LightningElement } from 'lwc';

export default class ProgresBarExample extends LightningElement {
    barValue = 0;
    change(){
        if(this.barValue === 100){
            this.barValue = 0;
        }
        this.barValue = this.barValue + 25;
    }
}