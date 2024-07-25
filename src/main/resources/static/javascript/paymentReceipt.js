function generatePaymentReceipt(userName, email, phoneNumber, spotNumbers, transactionTime, price) {
	const { jsPDF } = window.jspdf;
	const doc = new jsPDF();
	doc.setFont("helvetica");
	doc.setFontSize(22);

	doc.setTextColor(33, 150, 243);
	doc.text("Park Smart Booking Receipt", 105, 20, { align: 'center' });

	doc.setFontSize(14);
	doc.setTextColor(0);
	doc.text("Name: " + userName, 20, 40);
	doc.text("Email: " + email, 20, 50);
	doc.text("Phone Number: " + phoneNumber, 20, 60);

	doc.setFontSize(14);
	doc.text("Booking Details: ", 20, 80);
	doc.text("Booked Spots: " + spotNumbers, 20, 90);
	doc.text("Booking Date: " + transactionTime, 20, 100);
	doc.text("Price: Rs. " + price, 20, 110);

	doc.setFontSize(14);
	doc.text("Thank you for booking your parking spot with us!!", 20, 130);

	doc.save(userName + "_ParkSmart_Receipt.pdf");
}/**
 * 
 */