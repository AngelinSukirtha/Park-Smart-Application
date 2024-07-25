document.addEventListener('DOMContentLoaded', function() {
	if (registrationError === "User with these details already exists.") {
		Swal.fire({
			title: registrationError,
			confirmButtonColor: '#0056b3',
			confirmButtonText: 'Ok',
		});
	}
});

document.addEventListener('DOMContentLoaded', function() {
	const form = document.querySelector('form');

	const inputs = form.querySelectorAll('input[type="text"], input[type="email"], input[type="password"]');
	inputs.forEach(input => {
		input.addEventListener('blur', () => validateInput(input));
		input.addEventListener('keyup', () => validateInput(input));
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
			case 'userName':
				isValid = /^[A-Za-z]{5,}$/.test(value);
				updateError(input, isValid, 'Username should have at least 5 characters and only letters.');
				break;
			case 'userPassword':
				isValid = /^[A-Za-z0-9]{8,}$/.test(value);
				updateError(input, isValid, 'Password must be at least 8 characters long and include letters and numbers.');
				break;
			case 'phoneNumber':
				isValid = /^[6-9]\d{9}$/.test(value);
				updateError(input, isValid, 'Phone number should start with digits 6-9 and have 10 digits in total.');
				break;
			case 'email':
				isValid = /^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,}$/.test(value);
				updateError(input, isValid, 'Enter a valid email address.');
				break;
			default:
				break;
		}

		return isValid;
	}

	function updateError(input, isValid, errorMessage) {
		const errorElement = input.nextElementSibling;
		errorElement.innerText = isValid ? '' : errorMessage;
		errorElement.style.color = 'red';
	}
});

