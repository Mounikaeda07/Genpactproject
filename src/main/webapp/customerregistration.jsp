<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Registration</title>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    background-color: #fff;
    padding: 20px;
    width: 300px;
}

h1 {
    color: blue;
    font-style: italic;
    text-align: center;
}

form {
    display: flex;
    flex-direction: column;
}

input, select {
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

button {
    padding: 10px;
    border-radius: 5px;
    border: none;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <div class="container">
        <h1>Customer Registration</h1>
        <form action="Admin" method="post" onsubmit="return validateForm()">
            <input type="text" id="fullName" name="full_name" placeholder="Full Name" required>
            <input type="text" id="address" name="address" placeholder="Address" required>
            <input type="text" id="mobileNo" name="mobile_no" placeholder="Mobile Number" required>
            <input type="email" id="email" name="email" placeholder="Email" required>
            <input type="text" id="accountType" name="account_type" placeholder="Account Type" required>
            <input type="number" id="balance" name="balance" placeholder="Balance" required>
            <input type="date" id="dob" name="dob" placeholder="Date of Birth" required>
            <select id="idProof" name="id_proff" required>
                <option value="Aadhar">Aadhar</option>
                <option value="PAN">PAN</option>
            </select>
            <input type="text" name="id_proff_number" placeholder="ID Proof Number" required>
            <button type="submit">Register</button>
        </form>
    </div>

    <script>
        function validateForm() {
            var fullName = document.getElementById("fullName").value;
            var address = document.getElementById("address").value;
            var mobileNo = document.getElementById("mobileNo").value;
            var email = document.getElementById("email").value;
            var accountType = document.getElementById("accountType").value;
            var balance = document.getElementById("balance").value;
            var dob = document.getElementById("dob").value;
            var idProof = document.getElementById("idProof").value;
            var idProofNumber = document.getElementsByName("id_proff_number")[0].value;

            var error = "";

            if (!fullName.trim()) {
                error += "Full Name is required.\n";
            }
            if (!address.trim()) {
                error += "Address is required.\n";
            }
            if (!mobileNo.trim() || mobileNo.length !== 10 || isNaN(mobileNo)) {
                error += "Mobile Number must be 10 digits.\n";
            }
            if (!email.trim() || !validateEmail(email)) {
                error += "Valid Email is required.\n";
            }
            if (!accountType.trim()) {
                error += "Account Type is required.\n";
            }
            if (balance.trim() === "" || balance < 1000) {
                error += "Balance should be at least 1000.\n";
            }
            if (!dob.trim()) {
                error += "Date of Birth is required.\n";
            }
            if (idProof === "Aadhar") {
                if (idProofNumber.trim().length !== 12 || isNaN(idProofNumber)) {
                    error += "Aadhar Number must be 12 digits.\n";
                }
            } else if (idProof === "PAN") {
                var panRegex = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
                if (!panRegex.test(idProofNumber)) {
                    error += "Invalid PAN Number format.\n";
                }
            }

            if (error !== "") {
                alert(error);
                return false;
            }

            return true;
        }

        function validateEmail(email) {
            var re = /\S+@\S+\.\S+/;
            return re.test(email);
        }
    </script>
</body>
</html>
