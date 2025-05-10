<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.example.model.Expense" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>View Expenses</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <link rel="stylesheet" href="input.css">
            <link rel="stylesheet" href="button.css">
            <link rel="stylesheet" href="logout.css">
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

                .accordion-body {
                    text-align: left;
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

                .accordion {
                    max-height: 50dvh;
                    overflow: scroll;
                }

                .accordion::-webkit-scrollbar {
                    display: none !important;
                }

                @media screen and (max-width: 700px) {
                    .container {
                        width: 85vw !important;
                    }

                    .accordion {
                        max-height: 40dvh;
                        overflow: scroll;
                    }
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

                a:hover {
                    /* background-color: #0056b3; */
                    background-color: #ffcc00;
                    transform: translateY(-3px);
                }

                .accordion-item {
                    backdrop-filter: blur(10px) saturate(180%);
                    -webkit-backdrop-filter: blur(10px) saturate(180%);
                    background-color: rgba(255, 215, 0, 0.12);
                    /* Soft golden glass effect */
                    border-radius: 12px;
                    border: 1px solid rgba(255, 215, 0, 0.4);
                    /* Light golden border */
                    box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
                    /* Yellow glow effect */
                    margin-bottom: 10px;
                    overflow: hidden;
                }

                .accordion-button {
                    backdrop-filter: blur(8px) saturate(150%);
                    -webkit-backdrop-filter: blur(8px) saturate(150%);
                    background-color: rgba(255, 215, 0, 0.15);
                    /* Subtle golden overlay */
                    color: #fff;
                    font-weight: bold;
                    transition: all 0.3s ease-in-out;
                    border: none;
                    box-shadow: inset 0 0 10px rgba(255, 215, 0, 0.25);
                    /* Inner glow */
                }

                .accordion-button:hover {
                    background-color: rgba(255, 215, 0, 0.3);
                    /* More intense golden glow */
                    box-shadow: 0 0 10px rgba(255, 215, 0, 0.6);
                }

                .accordion-body {
                    color: #fff;
                    background-color: rgba(0, 0, 0, 0.3);
                    backdrop-filter: blur(12px);
                    border-radius: 0 0 12px 12px;
                    padding: 15px;
                    border-top: 1px solid rgba(255, 215, 0, 0.3);
                    /* Golden divider */
                    box-shadow: inset 0 0 8px rgba(255, 215, 0, 0.4);
                }
            </style>
        </head>

        <body>
            <div class="container box">
                <h1 style="font-weight: bolder; text-align: center;">View Expenses</h1>
                <div class="accordion" id="accordionExample">
                    <% Expense[] expenses=(Expense[]) request.getAttribute("expenses"); if (expenses !=null) { for (int
                        i=0; i < expenses.length; i++) { Expense expense=expenses[i]; String collapseId="collapse" + i;
                        %>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading<%= i %>">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#<%= collapseId %>" aria-expanded="true"
                                    aria-controls="<%= collapseId %>" style="font-weight: bolder;">
                                    ID: <%= expense.getId() %>
                                </button>
                            </h2>
                            <div id="<%= collapseId %>" class="accordion-collapse collapse"
                                aria-labelledby="heading<%= i %>" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    Product Name: <%= expense.getProductName() %><br>
                                        Price: <%= expense.getPrice() %><br>
                                            Purchase Date: <%= expense.getPurchaseDate() %><br>
                                </div>
                            </div>
                        </div>
                        <br>
                        <% } } %>
                </div>
                <a href="./index.jsp" style="font-weight: bolder;">Back | Home</a>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
        </body>

        </html>