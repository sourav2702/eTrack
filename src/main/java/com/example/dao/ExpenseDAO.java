package com.example.dao;

import com.example.model.Expense;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDAO {
    private String jdbcUrl;
    private String jdbcUsername;
    private String jdbcPassword;

    public ExpenseDAO() {
        this.jdbcUrl = "jdbc:mysql://localhost:3306/expense_manager";
        this.jdbcUsername = "root";
        this.jdbcPassword = "2024";
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Failed to load JDBC driver", e);
        }
        
    }

    public void addExpense(Expense expense) throws SQLException {
        String query = "INSERT INTO expenses (product_name, price, purchase_date) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, expense.getProductName());
            preparedStatement.setFloat(2, expense.getPrice());
            preparedStatement.setDate(3, new java.sql.Date(expense.getPurchaseDate().getTime()));
            preparedStatement.executeUpdate();
        }
    }

    public Expense getExpenseById(int id) throws SQLException {
        String query = "SELECT * FROM expenses WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Expense expense = new Expense();
                    expense.setId(resultSet.getInt("id"));
                    expense.setProductName(resultSet.getString("product_name"));
                    expense.setPrice(resultSet.getFloat("price"));
                    expense.setPurchaseDate(resultSet.getDate("purchase_date"));
                    return expense;
                }
            }
        }
        return null;
    }

    public void updateExpense(Expense expense) throws SQLException {
        String query = "UPDATE expenses SET product_name = ?, price = ?, purchase_date = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, expense.getProductName());
            preparedStatement.setFloat(2, expense.getPrice());
            preparedStatement.setDate(3, new java.sql.Date(expense.getPurchaseDate().getTime()));
            preparedStatement.setInt(4, expense.getId());
            preparedStatement.executeUpdate();
        }
    }

    public void deleteExpense(int id) throws SQLException {
        String query = "DELETE FROM expenses WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }

    public Expense[] getAllExpenses() throws SQLException {
        List<Expense> expenseList = new ArrayList<>();
        String query = "SELECT * FROM expenses";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Expense expense = new Expense();
                expense.setId(resultSet.getInt("id"));
                expense.setProductName(resultSet.getString("product_name"));
                expense.setPrice(resultSet.getFloat("price"));
                expense.setPurchaseDate(resultSet.getDate("purchase_date"));
                expenseList.add(expense);
            }
        }
        Expense[] expensesArray = new Expense[expenseList.size()];
        expensesArray = expenseList.toArray(expensesArray);
        // printExpenses(expensesArray);
        return expensesArray;
    }
}