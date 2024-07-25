document.addEventListener('DOMContentLoaded', function() {
	const form = document.querySelector('form');

	const inputs = form.querySelectorAll('input[type="text"], input[type="datetime-local"]');

	inputs.forEach(input => {
		input.addEventListener('blur', () => validateInput(input));
		input.addEventListener('input', () => validateInput(input));
	});

	form.addEventListener("submit", function(event) {
		event.preventDefault();
		let isValid = true;

		inputs.forEach(input => {
			isValid = validateInput(input) && isValid;
		});

		if (isValid) {
			form.submit();
		} else {
			Swal.fire({
				icon: 'error',
				title: 'Validation Error',
				text: 'Please check the form for errors.',
				confirmButtonText: 'OK',
				confirmButtonColor: '#3c445c',
			});
		}
	});

	function validateInput(input) {
		const value = input.value.trim();
		const id = input.id;
		let isValid = true;

		switch (id) {
			case 'numberPlate':
				isValid = value.length > 0;
				updateError(input, isValid, 'Please enter a valid number plate.');
				break;
			case 'startDateTime':
			case 'endDateTime':
				isValid = isValidDateTime(value);
				updateError(input, isValid, 'Please enter a valid date and time.');
				break;
			default:
				break;
		}

		return isValid;
	}

	function isValidDateTime(dateTimeString) {
		const dateTimeRegex = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}$/;
		return dateTimeRegex.test(dateTimeString);
	}

	function updateError(input, isValid, errorMessage) {
		const errorElement = input.nextElementSibling;
		errorElement.innerText = isValid ? '' : errorMessage;
		errorElement.style.color = 'red';
	}
});
