document.addEventListener('DOMContentLoaded', function() {
	const form = document.querySelector('form');

	const cardNumberInput = document.getElementById('cardNumber');
	const expiryDateInput = document.getElementById('expiryDate');
	const cvvInput = document.getElementById('cvv');

	cardNumberInput.addEventListener('blur', () => validateInput(cardNumberInput));
	cardNumberInput.addEventListener('input', () => validateInput(cardNumberInput));

	expiryDateInput.addEventListener('blur', () => validateInput(expiryDateInput));
	expiryDateInput.addEventListener('input', () => validateInput(expiryDateInput));

	cvvInput.addEventListener('blur', () => validateInput(cvvInput));
	cvvInput.addEventListener('input', () => validateInput(cvvInput));

	form.addEventListener('submit', function(event) {
		event.preventDefault();

		const isValidCardNumber = validateInput(cardNumberInput);
		const isValidExpiryDate = validateInput(expiryDateInput);
		const isValidCVV = validateInput(cvvInput);

		if (isValidCardNumber && isValidExpiryDate && isValidCVV) {
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
		let errorMessage = '';

		switch (id) {
			case 'cardNumber':
				isValid = /^\d{16}$/.test(value);
				errorMessage = 'Please enter a valid 16-digit card number.';
				break;
			case 'expiryDate':
				isValid = /^\d{2}\/\d{2}$/.test(value);
				errorMessage = 'Please enter a valid expiry date in MM/YY format.';
				break;
			case 'cvv':
				isValid = /^\d{3}$/.test(value);
				errorMessage = 'Please enter a valid 3-digit CVV.';
				break;
			default:
				break;
		}

		updateError(input, isValid, errorMessage);
		return isValid;
	}

	function updateError(input, isValid, errorMessage) {
		const errorElement = input.nextElementSibling;
		errorElement.innerText = isValid ? '' : errorMessage;
		errorElement.style.color = isValid ? '' : 'red';
	}
});
