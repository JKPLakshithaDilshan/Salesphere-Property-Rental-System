package com.salesphere.servlet;

import com.salesphere.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/debug-reviews")
public class DebugServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Debug Reviews</title></head><body>");
        out.println("<h1>Database Debug Information</h1>");

        try (Connection connection = DBConnection.getConnection()) {

            // Check users table
            out.println("<h2>Users Table:</h2>");
            out.println("<table border='1'><tr><th>user_id</th><th>full_name</th><th>email</th></tr>");

            String userQuery = "SELECT user_id, full_name, email FROM users";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(userQuery)) {
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("user_id") + "</td>");
                    out.println("<td>" + rs.getString("full_name") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("</tr>");
                }
            }
            out.println("</table>");

            // Check reviews table
            out.println("<h2>Reviews Table:</h2>");
            out.println("<table border='1'><tr><th>review_id</th><th>property_id</th><th>tenant_id</th><th>rating</th><th>comment</th><th>reviewed_at</th></tr>");

            String reviewQuery = "SELECT * FROM reviews ORDER BY review_id";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(reviewQuery)) {
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("review_id") + "</td>");
                    out.println("<td>" + rs.getInt("property_id") + "</td>");
                    out.println("<td>" + rs.getInt("tenant_id") + "</td>");
                    out.println("<td>" + rs.getInt("rating") + "</td>");
                    out.println("<td>" + rs.getString("comment") + "</td>");
                    out.println("<td>" + rs.getString("reviewed_at") + "</td>");
                    out.println("</tr>");
                }
            }
            out.println("</table>");

            // Check reviews_view
            out.println("<h2>Reviews View:</h2>");
            out.println("<table border='1'><tr><th>review_id</th><th>tenant_name</th><th>property_title</th><th>rating</th><th>comment</th><th>reviewed_at</th></tr>");

            String viewQuery = "SELECT * FROM reviews_view ORDER BY review_id";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(viewQuery)) {
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("review_id") + "</td>");
                    out.println("<td>" + rs.getString("tenant_name") + "</td>");
                    out.println("<td>" + rs.getString("property_title") + "</td>");
                    out.println("<td>" + rs.getInt("rating") + "</td>");
                    out.println("<td>" + rs.getString("comment") + "</td>");
                    out.println("<td>" + rs.getString("reviewed_at") + "</td>");
                    out.println("</tr>");
                }
            }
            out.println("</table>");

            // Find Nimali's user_id
            out.println("<h2>Nimali's User Information:</h2>");
            String nimaliQuery = "SELECT user_id, full_name, email FROM users WHERE email = 'nimali@example.com'";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(nimaliQuery)) {
                if (rs.next()) {
                    int nimaliId = rs.getInt("user_id");
                    out.println("<p><strong>Nimali's user_id:</strong> " + nimaliId + "</p>");

                    // Check Nimali's reviews
                    out.println("<h3>Nimali's Reviews:</h3>");
                    String nimaliReviewsQuery = "SELECT * FROM reviews WHERE tenant_id = " + nimaliId;
                    try (Statement stmt2 = connection.createStatement();
                         ResultSet rs2 = stmt2.executeQuery(nimaliReviewsQuery)) {

                        out.println("<table border='1'><tr><th>review_id</th><th>property_id</th><th>rating</th><th>comment</th></tr>");
                        boolean hasReviews = false;
                        while (rs2.next()) {
                            hasReviews = true;
                            out.println("<tr>");
                            out.println("<td>" + rs2.getInt("review_id") + "</td>");
                            out.println("<td>" + rs2.getInt("property_id") + "</td>");
                            out.println("<td>" + rs2.getInt("rating") + "</td>");
                            out.println("<td>" + rs2.getString("comment") + "</td>");
                            out.println("</tr>");
                        }
                        out.println("</table>");

                        if (!hasReviews) {
                            out.println("<p><em>No reviews found for Nimali (user_id: " + nimaliId + ")</em></p>");
                        }
                    }
                } else {
                    out.println("<p><em>User with email 'nimali@example.com' not found!</em></p>");
                }
            }

        } catch (SQLException e) {
            out.println("<h2>Error:</h2>");
            out.println("<p>" + e.getMessage() + "</p>");
            e.printStackTrace();
        }

        out.println("</body></html>");
    }
}