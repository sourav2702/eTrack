package com.example.servlet;

import com.example.dao.ExpenseDAO;
import com.example.model.Expense;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/add-expense")
public class AddExpenseServlet extends HttpServlet {

    private ExpenseDAO expenseDAO;

    @Override
    public void init() throws ServletException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/expense_manager";
        String jdbcUsername = "root";
        String jdbcPassword = "2024";
        String jdbcDriverClassName = "com.mysql.cj.jdbc.driver";

        if (jdbcUrl == null || jdbcUsername == null || jdbcPassword == null || jdbcDriverClassName == null) {
            throw new ServletException("Database connection parameters are missing");
        }

        expenseDAO = new ExpenseDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/add-expense.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String priceString = request.getParameter("price");
        String purchaseDateString = request.getParameter("purchaseDate");

        float price = Float.parseFloat(priceString);
        Date purchaseDate;
        try {
            purchaseDate = new SimpleDateFormat("yyyy-MM-dd").parse(purchaseDateString);
        } catch (ParseException e) {
            throw new ServletException("Invalid date format", e);
        }

        Expense expense = new Expense();
        expense.setProductName(productName);
        expense.setPrice(price);
        expense.setPurchaseDate(purchaseDate);

        try {
            expenseDAO.addExpense(expense);
        } catch (SQLException e) {
            throw new ServletException("Error adding expense", e);
        }

        response.sendRedirect("view-expenses");
    }
}
