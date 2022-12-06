({
    handleClick : function(component, event, helper) {
        var selectedButtonLabel = event.getSource().get("v.label");
        var firstValue = component.get("v.firstValue");
        var secondValue = component.get("v.secondValue");
        component.set("v.isReadOnly", true);
        //alert("Button label: " + selectedButtonLabel);

        switch (selectedButtonLabel) {
            case "Add":
                var result = parseFloat(firstValue) + parseFloat(secondValue);
                component.set("v.finalValue", result);
              break;
            case "Sub":
                var result = firstValue - secondValue;
                component.set("v.finalValue", result);
              break;
            case "Mul":
                var result = firstValue * secondValue;
                component.set("v.finalValue", result);
              break;
            case "Div":
                if(secondValue != 0){
                    var result = firstValue / secondValue;
                    component.set("v.finalValue", result);
                }else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Error!!",
                        "message": "Cannot Divide with zero.",
                        "type": "Error"
                    });
                    toastEvent.fire(); 
                }   
              break;
            case "clear":
                component.set("v.firstValue", "");
                component.set("v.secondValue", "");
                component.set("v.finalValue", "");
                component.set("v.isReadOnly", false);
                break;
          }
         
    }
})