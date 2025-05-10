<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Expenses Tracker</title>
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1669881336715-5a51a78d5434') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100dvh;
            margin: 0;
            color: #fff;
        }

        .container {
            backdrop-filter: blur(10px) saturate(180%);
            -webkit-backdrop-filter: blur(10px) saturate(180%);
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 16px;
            border: 1px solid rgba(255, 215, 0, 0.5);
            box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
            padding: 40px;
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #ffd700; /* Gold color */
        }

        a {
            display: block;
            margin: 15px 0;
            padding: 12px 24px;
            text-decoration: none;
            color: #000;
            background-color: #ffcc00; /* Gold button */
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-size: 1.2rem;
            font-weight: bold;
        }

        a:hover {
            background-color: #e6b800; /* Darker gold */
            transform: translateY(-3px);
        }

        @media screen and (max-width: 700px) {
            .container {
                width: 80vw;
            }

            a {
                font-size: 1rem;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Monthly Expenses Tracker</h1>
        <a href="./add-expense.jsp">Add Expenses</a>
        <a href="./update-expense.jsp">Update Expenses</a>
        <a href="./remove-expense.jsp">Remove Expenses</a>
        <a href="view-expenses">View Expenses</a>
    </div>
</body>

</html>
