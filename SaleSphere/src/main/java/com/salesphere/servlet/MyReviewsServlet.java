package com.salesphere.servlet;

import com.salesphere.model.Review;
import com.salesphere.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/reviews")
public class MyReviewsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Get current user's tenant ID
            int tenantId = (int) session.getAttribute("userId");

            // Get all reviews by this tenant
            List<Review> reviews = reviewService.getReviewsByTenantId(tenantId);

            // Set attributes for JSP
            request.setAttribute("reviews", reviews);
            request.setAttribute("isLoggedIn", true);
            request.setAttribute("name", session.getAttribute("name"));

            // Forward to my-reviews.jsp
            request.getRequestDispatcher("/client/my-reviews.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load your reviews. Please try again.");
            request.getRequestDispatcher("/client/my-reviews.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            try {
                int reviewId = Integer.parseInt(request.getParameter("reviewId"));
                int tenantId = (int) session.getAttribute("userId");

                // Verify ownership before deletion
                Review existingReview = reviewService.getReviewById(reviewId);
                if (existingReview != null && existingReview.getTenantId() == tenantId) {
                    boolean success = reviewService.deleteReview(reviewId);

                    if (success) {
                        request.setAttribute("success", "Review deleted successfully.");
                    } else {
                        request.setAttribute("error", "Failed to delete review. Please try again.");
                    }
                } else {
                    request.setAttribute("error", "You are not authorized to delete this review.");
                }

            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid review ID.");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred while deleting the review.");
            }
        }

        // Redirect to GET to prevent resubmission
        response.sendRedirect(request.getContextPath() + "/reviews");
    }
}