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

@WebServlet("/remove-expense")
public class RemoveExpenseServlet extends HttpServlet {

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
        request.getRequestDispatcher("/remove-expense.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idString = request.getParameter("id");

        int id = Integer.parseInt(idString);

        try {
            Expense existingExpense = expenseDAO.getExpenseById(id);
            if (existingExpense == null) {
                request.setAttribute("errorMessage", "Expense ID not found.");
                request.getRequestDispatcher("/remove-expense.jsp").forward(request, response);
            } else {
                expenseDAO.deleteExpense(id);
                response.sendRedirect("view-expenses");
            }
        } catch (SQLException e) {
            throw new ServletException("Error removing expense", e);
        }
    }
}
