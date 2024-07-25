document.addEventListener('DOMContentLoaded', function() {
	if (paymentSuccessMessage === "Payment successful!") {
		Swal.fire({
			icon: 'success',
			title: paymentSuccessMessage,
			confirmButtonColor: '#0056b3',
			confirmButtonText: 'Ok'
		});
	}
});
