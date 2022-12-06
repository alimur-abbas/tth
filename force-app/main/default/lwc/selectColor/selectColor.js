import { LightningElement,track } from 'lwc';

export default class SelectColor extends LightningElement {
    @track valueOfColor = '';
    options = [
        { label: '', value: '' },
        { label: 'Red', value: 'red' },
        { label: 'Green', value: 'green' },
        { label: 'Blue', value: 'blue' },
        { label: 'Yellow', value: 'yellow' },
        { label: 'Black', value: 'Balck' }
    ];
    handleChange(event) {
        this.valueOfColor = event.detail.value;
        
    }
}