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

@WebServlet("/view-expenses")
public class ViewExpensesServlet extends HttpServlet {

    private ExpenseDAO expenseDAO;

    @Override
    public void init() throws ServletException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/expense_manager";
        String jdbcUsername = "root";
        String jdbcPassword = "2023";
        String jdbcDriverClassName = "com.mysql.jdbc.driver";


        if (jdbcUrl == null || jdbcUsername == null || jdbcPassword == null || jdbcDriverClassName == null) {
            throw new ServletException("Database connection parameters are missing");
        }

        expenseDAO = new ExpenseDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Expense[] expenses = expenseDAO.getAllExpenses();
            request.setAttribute("expenses", expenses);
            request.getRequestDispatcher("/view-expenses.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving expenses", e);
        }
    }
}
