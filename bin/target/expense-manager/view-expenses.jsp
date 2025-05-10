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

                .accordion-body {
                    text-align: left;
                }

                .box {
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

                .accordion{
                    max-height: 50dvh;
                    overflow: scroll;
                }

                .accordion::-webkit-scrollbar{
                    display: none !important;
                }

                @media screen and (max-width: 700px) {
                    .container {
                        width: 85vw !important;
                    }

                    .accordion{
                        max-height: 40dvh;
                        overflow: scroll;
                    }
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