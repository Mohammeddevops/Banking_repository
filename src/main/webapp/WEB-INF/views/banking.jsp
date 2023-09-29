<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Application</title>
    <style>
        /* Add your custom CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .actions {
            display: flex;
            justify-content: space-between;
        }

        .actions a {
            padding: 10px 20px;
            text-decoration: none;
            color: #007bff;
            cursor: pointer;
        }

        .actions .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .actions .btn-primary:hover {
            background-color: #0056b3;
        }

        .modal-container {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .close-modal {
            text-align: right;
            cursor: pointer;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Banking Application</h1>

        <table>
            <thead>
                <tr>
                    <th>Account Number</th>
                    <th>Customer Name</th>
                    <th>Customer Address</th>
                    <th>Contact Number</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1001</td>
                    <td>John Doe</td>
                    <td>123 Main St</td>
                    <td>555-1234</td>
                    <td class="actions">
                        <a href="#" class="view-btn">View</a>
                        <a href="#" class="edit-btn">Edit</a>
                        <a href="#" class="delete-btn">Delete</a>
                    </td>
                </tr>
                <!-- Add more rows with dynamic data here -->
            </tbody>
        </table>

        <div class="actions">
            <button class="btn-primary" id="create-account-btn">Create New Account</button>
        </div>
    </div>

    <!-- Account Details Modal -->
    <div class="modal-container" id="account-modal">
        <div class="modal-content">
            <span class="close-modal" id="close-modal">&times;</span>
            <h2>Account Details</h2>
            <form id="account-form">
                <div class="form-group">
                    <label for="accountNumber">Account Number:</label>
                    <input type="text" id="accountNumber" name="accountNumber" readonly>
                </div>
                <div class="form-group">
                    <label for="customerName">Customer Name:</label>
                    <input type="text" id="customerName" name="customerName">
                </div>
                <div class="form-group">
                    <label for="customerAddress">Customer Address:</label>
                    <input type="text" id="customerAddress" name="customerAddress">
                </div>
                <div class="form-group">
                    <label for="contactNumber">Contact Number:</label>
                    <input type="text" id="contactNumber" name="contactNumber">
                </div>
                <div class="form-group">
                    <button type="button" id="save-account-btn">Save</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // JavaScript for handling actions and modal
        const accountModal = document.getElementById('account-modal');
        const createAccountBtn = document.getElementById('create-account-btn');
        const closeModal = document.getElementById('close-modal');
        const accountForm = document.getElementById('account-form');
        const saveAccountBtn = document.getElementById('save-account-btn');

        createAccountBtn.addEventListener('click', () => {
            accountForm.reset();
            accountModal.style.display = 'block';
        });

        closeModal.addEventListener('click', () => {
            accountModal.style.display = 'none';
        });

        window.addEventListener('click', (e) => {
            if (e.target === accountModal) {
                accountModal.style.display = 'none';
            }
        });

        // Sample data for editing
        const sampleData = {
            accountNumber: '1001',
            customerName: 'John Doe',
            customerAddress: '123 Main St',
            contactNumber: '555-1234',
        };

        const editBtns = document.querySelectorAll('.edit-btn');
        editBtns.forEach((editBtn) => {
            editBtn.addEventListener('click', () => {
                // Pre-fill the form with sample data for editing
                document.getElementById('accountNumber').value = sampleData.accountNumber;
                document.getElementById('customerName').value = sampleData.customerName;
                document.getElementById('customerAddress').value = sampleData.customerAddress;
                document.getElementById('contactNumber').value = sampleData.contactNumber;

                accountModal.style.display = 'block';
            });
        });

        // Sample data for viewing
        const viewBtns = document.querySelectorAll('.view-btn');
        viewBtns.forEach((viewBtn) => {
            viewBtn.addEventListener('click', () => {
                // Display a message or redirect to a details page for viewing
                alert(`Viewing Account ${sampleData.accountNumber}`);
            });
        });

        // Sample data for deleting
        const deleteBtns = document.querySelectorAll('.delete-btn');
        deleteBtns.forEach((deleteBtn) => {
            deleteBtn.addEventListener('click', () => {
                // Implement logic for deleting the account
                const confirmDelete = confirm('Are you sure you want to delete this account?');
                if (confirmDelete) {
                    alert(`Account ${sampleData.accountNumber} deleted successfully`);
                    // Implement the deletion logic here
                }
            });
        });

        // Save account changes
        saveAccountBtn.addEventListener('click', () => {
            // Implement logic to save changes made in the modal form
            const updatedData = {
                accountNumber: document.getElementById('accountNumber').value,
                customerName: document.getElementById('customerName').value,
                customerAddress: document.getElementById('customerAddress').value,
                contactNumber: document.getElementById('contactNumber').value,
            };
            alert(`Changes saved for Account ${updatedData.accountNumber}`);
            accountModal.style.display = 'none';
        });
    </script>
</body>
</html>
