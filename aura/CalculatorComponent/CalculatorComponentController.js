({
	calculate : function(component, event, helper) {
        var fstNumber1 = component.find("fnumberId").get("v.value");
        alert(fstNumber1);
		var fstNumber = component.get("v.fNumber");
        var secondNumber = component.get("v.sNumber");
        var calResult = (fstNumber + secondNumber);
        component.set("v.Result",calResult);       
	}
})