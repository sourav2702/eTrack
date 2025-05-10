<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Expense</title>
        <style>
            body {
                background: url('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Arial', sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100dvh;
                margin: 0;
                color: #333;
            }

            .container {
                backdrop-filter: blur(10px) saturate(180%);
                -webkit-backdrop-filter: blur(10px) saturate(180%);
                background-color: rgba(255, 255, 255, 0.75);
                border-radius: 16px;
                border: 1px solid rgba(0, 0, 0, 0.1);
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                padding: 40px;
                text-align: center;
                max-width: 400px;
                width: 100%;
            }

            h1 {
                font-size: 2.5em;
                margin-bottom: 20px;
                color: #007BFF;
            }

            form {
                margin-top: 20px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                color: #333;
                text-align: left;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 8px;
                border: 1px solid #ccc;
                background: white;
                outline: none !important;
                text-align: center !important;
            }

            input[type="submit"] {
                display: block;
                width: 100%;
                /* padding: 10px; */
                margin-top: 10px;
                background-color: #007BFF;
                color: #fff;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 1.2rem;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
                transform: translateY(-3px);
            }

            a {
                display: block;
                margin: 15px 0;
                padding: 10px 20px;
                text-decoration: none;
                color: #fff;
                background-color: #007BFF;
                border-radius: 8px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            a:hover {
                background-color: #0056b3;
                transform: translateY(-3px);
            }

            @media screen and (max-width: 700px) {
                .container {
                    width: 70vw !important;
                }

                input {
                    width: 90%;
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>Add Expense</h1>
            <form action="add-expense" method="post">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" required><br>
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" required><br>
                <label for="purchaseDate">Purchase Date</label>
                <input type="date" id="purchaseDate" name="purchaseDate" required><br>
                <input type="submit" value="Add Expense">
            </form>
            <a href="./index.jsp">Back | Home</a>
        </div>
    </body>

    </html>