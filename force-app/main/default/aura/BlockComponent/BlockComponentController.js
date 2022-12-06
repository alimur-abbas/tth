({
    blockClickHandler : function(component, event, helper) {
        let currentValue = component.get("v.isOpen");
        component.set("v.isOpen", !currentValue);
        //get the label value of the block
        let label = component.get("v.label");
        //fire the block click event
        let compEvent = component.getEvent("onclick");
        compEvent.setParams({
            value: label
    });
        compEvent.fire();
},
scriptsLoaded : function(component, event, helper) {
    let divElement =component.getElement(".board-block");
    fitText(divElement);
}
})