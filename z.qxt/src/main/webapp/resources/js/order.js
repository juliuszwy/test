function chooseItems(source, target) {
	var choiceOptions = source.options;
	var selectedOptions = target.options;
	for (i = 0; i < (choiceOptions.length); i++) {
		var temp = choiceOptions.item(i);
		if (temp.selected == true) {
			var oOption = document.createElement("OPTION");
			selectedOptions[selectedOptions.length] = new Option(temp.text,
					temp.value);
		}
	}

	for (j = (choiceOptions.length - 1); j >= 0; j--) {
		var temp = choiceOptions.item(j);
		if (temp.selected == true) {
			choiceOptions[j] = null;
		}
	}
	$("#total option").unbind();
	$("#avail option").unbind();
	$("#total option").bind('dblclick', function(){	
		chooseItems(conditionForm.choices, conditionForm.selectcolumns);
	});	
	$("#avail option").bind('dblclick', function(){	
		chooseItems(conditionForm.selectcolumns, conditionForm.choices);
	});	

}

function adjustUp(source) {
	var itemOptions = conditionForm.sdkSort.options;
	var selectedOption;
	var index;
	for (var i = 0; i < itemOptions.length; i++) {
		var temp = itemOptions.item(i);
		if (temp.selected == true) {
			index = i;
			selectedOption = itemOptions[index];
			var lastOption = itemOptions[index - 1];
			var temp = new Option(selectedOption.text, selectedOption.value);

			selectedOption.text = lastOption.text;
			selectedOption.value = lastOption.value;
			selectedOption.selected = false;

			lastOption.text = temp.text;
			lastOption.value = temp.value;
			lastOption.selected = true;
		}
	}

}

function adjustDown(source) {
	var itemOptions = conditionForm.sdkSort.options;
	var selectedOption;
	var index;

	for (var i = itemOptions.length - 1; i >= 0; i--) {
		var temp = itemOptions.item(i);
		if (temp.selected == true) {
			index = i;
			selectedOption = itemOptions[index];
			var nextOption = itemOptions[index + 1];
			var temp = new Option(selectedOption.text, selectedOption.value);

			selectedOption.text = nextOption.text;
			selectedOption.value = nextOption.value;
			selectedOption.selected = false;

			nextOption.text = temp.text;
			nextOption.value = temp.value;
			nextOption.selected = true;
		}
	}

}

function checkForm(form1) {
	var columnsOptions = form1.selectcolumns.options;

	for (var i = 0; i < columnsOptions.length; i++) {
		columnsOptions[i].selected = true;
	}

	return true;
}
