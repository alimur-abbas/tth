import { LightningElement,track } from 'lwc';

export default class CheckBoxInLwc extends LightningElement {
     value="Checkbox is checked";
      
            
    

    handleChange(e) {
        this.value = e.target.checked ? 'Checkbox is checked' : 'Checkbox is unchecked';
    }
}