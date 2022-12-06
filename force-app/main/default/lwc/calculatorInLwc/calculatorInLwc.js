import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CalculatorInLwc extends LightningElement {
    @track firstNumber;
    @track secondNumber;
    @track resultArray=[];

    showToast() {
        const event = new ShowToastEvent({
            title: 'Error',
            message:'Cannot Divide with zero.',
            variant: 'error'
                
        });
        this.dispatchEvent(event);
    }


    handleClick(event){
        let label = event.target.label;
        // console.log(this.firstNumber);
        // console.log(this.secondNumber);
        this.template.querySelectorAll('lightning-input').forEach(element => {
            //alert(element.label);
            if(element.label === 'First Number'){
                this.firstNumber = element.value;
            }else{
                this.secondNumber = element.value;
            }
            });
       // alert(label);
       switch (label) {
        case "Add":
            //alert("Add");
            var result = parseFloat(this.firstNumber) + parseFloat(this.secondNumber);
           var value = this.firstNumber + " + " + this.secondNumber + " = " + result;
           //alert(value);
           this.resultArray.push(value);
           break;
        case "Sub":
            //alert("Sub");
            var result = this.firstNumber - this.secondNumber;
            // console.log(this.firstNumber);
            // console.log(this.secondNumber);
            // console.log(result);
            var value = this.firstNumber + " - " + this. secondNumber + " = " + result;
           // console.log(value);
            this.resultArray.push(value);
            //console.log(this.resultArray);
          break;
        case "Mul":
            var result = this.firstNumber * this.secondNumber;
            var value = this.firstNumber + " * " + this.secondNumber + " = " + result;
            this.resultArray.push(value);
          break;
        case "Div":
            if(this.secondNumber != 0){
                var result = this.firstNumber / this.secondNumber;
                var value = this.firstNumber + " / " + this.secondNumber + " = " + result;
                this.resultArray.push(value);
            }else{
                this.showToast();
            }


                // var toastEvent = $A.get("e.force:showToast");
                // toastEvent.setParams({
                //     "title": "Error!!",
                //     "message": "Cannot Divide with zero.",
                //     "type": "Error"
                // });
                // toastEvent.fire(); 
              
          break;
        case "clear":
            this.firstNumber = "";
            this.secondNumber = "";
            this.resultArray = [];
            break;
      }
    }
     
    }
