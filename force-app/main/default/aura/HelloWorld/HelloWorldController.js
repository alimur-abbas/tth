({
	capitalize : function(component, event, helper) {
		let  greeting = component.get("v.greeting").toUpperCase();
		console.log(greeting);
        component.set("v.greeting", greeting);
	}
})