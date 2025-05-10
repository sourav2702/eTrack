<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="input.css">
        <link rel="stylesheet" href="button.css">
        <link rel="stylesheet" href="logout.css">
        <title>Remove Expense</title>
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
                color: #333;
            }

            .container {
                position: absolute;
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
                color: #ffe600;
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
                /* margin-bottom: 10px; */
                border-radius: 8px;
                border: 1px solid #ccc;
                background: white;
                outline: none !important;
                text-align: center !important;
            }

            #id {
                text-align: left !important;
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

            #id::-webkit-inner-spin-button {
                display: none !important;
            }

            a {
                display: block;
                margin: 15px 0;
                padding: 12px 24px;
                text-decoration: none;
                color: #000;
                background-color: #ffcc00;
                /* Gold button */
                border-radius: 8px;
                transition: background-color 0.3s ease, transform 0.3s ease;
                font-size: 1.2rem;
                font-weight: bold;
                width: max-content;
            }

            a:hover{
                background-color: #ffcc00;
            }

            .button {
                transform: scale(1);
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>Remove Expense</h1>
            <form action="remove-expense" method="post" id="form">
                <!-- <label for="id">Expense ID:</label> -->
                <div class="form-control">
                    <input class="input input-alt" placeholder="Product ID" required="" type="number" id="id" name="id"
                        required>
                    <span class="input-border input-border-alt"></span>
                </div>
                <br>
                <!-- <input type="number" id="id" name="id" required><br> -->
                <!-- <input type="submit" value="Remove Expense" style="font-weight: bolder;"> -->
                <button class="button">
                    <div class="outline"></div>
                    <div class="state state--default">
                        <div class="icon">
                            <svg width="1em" height="1em" viewBox="0 0 24 24" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <g style="filter: url(#shadow)">
                                    <path
                                        d="M14.2199 21.63C13.0399 21.63 11.3699 20.8 10.0499 16.83L9.32988 14.67L7.16988 13.95C3.20988 12.63 2.37988 10.96 2.37988 9.78001C2.37988 8.61001 3.20988 6.93001 7.16988 5.60001L15.6599 2.77001C17.7799 2.06001 19.5499 2.27001 20.6399 3.35001C21.7299 4.43001 21.9399 6.21001 21.2299 8.33001L18.3999 16.82C17.0699 20.8 15.3999 21.63 14.2199 21.63ZM7.63988 7.03001C4.85988 7.96001 3.86988 9.06001 3.86988 9.78001C3.86988 10.5 4.85988 11.6 7.63988 12.52L10.1599 13.36C10.3799 13.43 10.5599 13.61 10.6299 13.83L11.4699 16.35C12.3899 19.13 13.4999 20.12 14.2199 20.12C14.9399 20.12 16.0399 19.13 16.9699 16.35L19.7999 7.86001C20.3099 6.32001 20.2199 5.06001 19.5699 4.41001C18.9199 3.76001 17.6599 3.68001 16.1299 4.19001L7.63988 7.03001Z"
                                        fill="currentColor"></path>
                                    <path
                                        d="M10.11 14.4C9.92005 14.4 9.73005 14.33 9.58005 14.18C9.29005 13.89 9.29005 13.41 9.58005 13.12L13.16 9.53C13.45 9.24 13.93 9.24 14.22 9.53C14.51 9.82 14.51 10.3 14.22 10.59L10.64 14.18C10.5 14.33 10.3 14.4 10.11 14.4Z"
                                        fill="currentColor"></path>
                                </g>
                                <defs>
                                    <filter id="shadow">
                                        <fedropshadow dx="0" dy="1" stdDeviation="0.6" flood-opacity="0.5">
                                        </fedropshadow>
                                    </filter>
                                </defs>
                            </svg>
                        </div>
                        <p>
                            <span style="--i:0">D</span>
                            <span style="--i:1">e</span>
                            <span style="--i:2">l</span>
                            <span style="--i:3">&nbsp;</span>
                            <span style="--i:4">E</span>
                            <span style="--i:5">x</span>
                            <span style="--i:6">p</span>
                            <span style="--i:7">e</span>
                            <span style="--i:8">n</span>
                            <span style="--i:9">s</span>
                            <span style="--i:10">e</span>


                            <!-- <span style="--i:6">s</span>
                            <span style="--i:7">s</span>
                            <span style="--i:8">a</span>
                            <span style="--i:9">g</span>
                            <span style="--i:10">e</span> -->
                        </p>
                    </div>
                    <div class="state state--sent" id="submitButton">
                        <div class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" height="1em"
                                width="1em" stroke-width="0.5px" stroke="black">
                                <g style="filter: url(#shadow)">
                                    <path fill="currentColor"
                                        d="M12 22.75C6.07 22.75 1.25 17.93 1.25 12C1.25 6.07 6.07 1.25 12 1.25C17.93 1.25 22.75 6.07 22.75 12C22.75 17.93 17.93 22.75 12 22.75ZM12 2.75C6.9 2.75 2.75 6.9 2.75 12C2.75 17.1 6.9 21.25 12 21.25C17.1 21.25 21.25 17.1 21.25 12C21.25 6.9 17.1 2.75 12 2.75Z">
                                    </path>
                                    <path fill="currentColor"
                                        d="M10.5795 15.5801C10.3795 15.5801 10.1895 15.5001 10.0495 15.3601L7.21945 12.5301C6.92945 12.2401 6.92945 11.7601 7.21945 11.4701C7.50945 11.1801 7.98945 11.1801 8.27945 11.4701L10.5795 13.7701L15.7195 8.6301C16.0095 8.3401 16.4895 8.3401 16.7795 8.6301C17.0695 8.9201 17.0695 9.4001 16.7795 9.6901L11.1095 15.3601C10.9695 15.5001 10.7795 15.5801 10.5795 15.5801Z">
                                    </path>
                                </g>
                            </svg>
                        </div>
                        <p>
                            <span style="--i:5">D</span>
                            <span style="--i:6">o</span>
                            <span style="--i:7">n</span>
                            <span style="--i:8">e</span>
                        </p>
                    </div>
                </button>
            </form>
            <a href="./index.jsp" style="font-weight: bolder;">Back | Home</a>
            <c:if test="${not empty errorMessage}">
                <p style="color: red;">${errorMessage}</p>
            </c:if>
        </div>
        <script defer>
            document.getElementById("form").addEventListener("submit", (e) => {
                e.preventDefault();
                setTimeout(() => {
                    document.getElementById("form").submit();
                }, 2100);

            })
        </script>
    </body>

    </html>