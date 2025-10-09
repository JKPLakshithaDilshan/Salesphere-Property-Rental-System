package com.salesphere.servlet;

import com.salesphere.model.PaymentCard;
import com.salesphere.service.PaymentCardService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PaymentCardService cardService;

    @Override
    public void init() throws ServletException {
        cardService = new PaymentCardService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/client/login.jsp");
            return;
        }

        try {
            // Get payment details
            int cardId = Integer.parseInt(request.getParameter("cardId"));
            String amount = request.getParameter("amount");
            int userId = (int) session.getAttribute("userId");

            // Verify card belongs to user
            PaymentCard card = cardService.getCard(cardId);
            if (card == null || card.getUser_id() != userId) {
                response.sendRedirect(request.getContextPath() + "/paymentcard");
                return;
            }

            // Here you would typically:
            // 1. Process payment with payment gateway
            // 2. Store transaction record in database
            // 3. Update booking/order status

            // For now, we'll simulate successful payment
            session.setAttribute("paymentSuccess", true);
            session.setAttribute("transactionAmount", amount);
            session.setAttribute("paymentCardLast4",
                    card.getCard_number().substring(card.getCard_number().length() - 4));

            // Redirect to success page
            response.sendRedirect(request.getContextPath() + "/client/PaymentSuccessful.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // Handle error - redirect to cards page with error message
            session.setAttribute("paymentError", "Payment processing failed. Please try again.");
            response.sendRedirect(request.getContextPath() + "/paymentcard");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to payment cards page
        response.sendRedirect(request.getContextPath() + "/PaymentSuccessful.jsp");
    }
}