<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            text-align: center;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .section {
            margin-bottom: 20px;
        }
        .section h2 {
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin: 5px 0;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .account-info, .transactions {
            margin: 15px 0;
        }
        .transactions table {
            width: 100%;
            border-collapse: collapse;
        }
        .transactions table, .transactions th, .transactions td {
            border: 1px solid #ddd;
        }
        .transactions th, .transactions td {
            padding: 10px;
            text-align: left;
        }
        .transactions th {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="CustomerDashboard.html">Dashboard</a>
        <a href="ViewAccount.html">View Account</a>
        <a href="Transaction.html">Make Transaction</a>
        <a href="Logout">Logout</a>
    </div>
    <div class="container">
        <div class="section">
            <h2>Welcome, <span id="customerName">[Customer Name]</span></h2>
            <a href="ViewAccount.html" class="button">View Account Details</a>
            <a href="Transaction.html" class="button">Make a Transaction</a>
            <a href="Logout" class="button">Logout</a>
        </div>

        <div class="section account-info">
            <h2>Account Information</h2>
            <p><strong>Account Number:</strong> <span id="accountNumber">[Account Number]</span></p>
            <p><strong>Account Balance:</strong> <span id="accountBalance">[Account Balance]</span></p>
            <p><strong>Email:</strong> <span id="customerEmail">[Customer Email]</span></p>
        </div>

        <div class="section transactions">
            <h2>Recent Transactions</h2>
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Amount</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody id="transactionTableBody">
                    <!-- Transaction rows will be dynamically inserted here -->
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // Example JavaScript to dynamically populate data
        document.addEventListener('DOMContentLoaded', function() {
            // Replace with actual data fetching
            const customerName = 'John Doe';
            const accountNumber = 'ACC123456789';
            const accountBalance = '$5,000.00';
            const customerEmail = 'johndoe@example.com';

            document.getElementById('customerName').textContent = customerName;
            document.getElementById('accountNumber').textContent = accountNumber;
            document.getElementById('accountBalance').textContent = accountBalance;
            document.getElementById('customerEmail').textContent = customerEmail;

            // Example transactions
            const transactions = [
                { date: '2024-07-01', description: 'Deposit', amount: '+$1,000.00', balance: '$5,000.00' },
                { date: '2024-06-20', description: 'Withdrawal', amount: '-$500.00', balance: '$4,000.00' },
                { date: '2024-06-15', description: 'Deposit', amount: '+$2,000.00', balance: '$4,500.00' }
            ];

            const transactionTableBody = document.getElementById('transactionTableBody');
            transactions.forEach(txn => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${txn.date}</td>
                    <td>${txn.description}</td>
                    <td>${txn.amount}</td>
                    <td>${txn.balance}</td>
                `;
                transactionTableBody.appendChild(row);
            });
        });
    </script>
</body>
</html>
