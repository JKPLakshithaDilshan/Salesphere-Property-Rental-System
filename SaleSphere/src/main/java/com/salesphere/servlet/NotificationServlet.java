package com.salesphere.servlet;

import com.salesphere.model.Notification;
import com.salesphere.service.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/notifications")
public class NotificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private NotificationService notificationService;

    @Override
    public void init() throws ServletException {
        notificationService = new NotificationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp");
            return;
        }

        String mode = request.getParameter("mode");
        if (mode == null) mode = "list";

        if ("edit".equals(mode)) {
            int notificationId = Integer.parseInt(request.getParameter("id"));
            Notification notification = notificationService.getNotificationById(notificationId);
            request.setAttribute("currentNotification", notification);
        }

        request.setAttribute("mode", mode);
        request.setAttribute("notifications", notificationService.getAllNotifications());

        request.getRequestDispatcher("/admin/adminNotifications.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp");
            return;
        }

        String action = request.getParameter("action");
        String message = null;
        boolean isError = false;

        try {
            switch (action) {
                case "create":
                    Notification newNotification = new Notification();
                    newNotification.setTitle(request.getParameter("title"));
                    newNotification.setMessage(request.getParameter("message"));
                    newNotification.setTargetAudience(request.getParameter("targetAudience"));
                    newNotification.setCreatedBy(((com.salesphere.model.Admin) session.getAttribute("admin")).getAdminId());
                    newNotification.setActive(true);

                    if (notificationService.createNotification(newNotification)) {
                        message = "Notification published successfully!";
                    } else {
                        message = "Failed to publish notification.";
                        isError = true;
                    }
                    break;

                case "update":
                    int updateId = Integer.parseInt(request.getParameter("id"));
                    Notification updateNotification = notificationService.getNotificationById(updateId);
                    
                    String updatedTitle = request.getParameter("title");
                    if (!updatedTitle.endsWith(" (Edited)")) {
                        updatedTitle += " (Edited)";
                    }
                    updateNotification.setTitle(updatedTitle);
                    
                    updateNotification.setMessage(request.getParameter("message"));
                    updateNotification.setTargetAudience(request.getParameter("targetAudience"));
                    updateNotification.setActive(Boolean.parseBoolean(request.getParameter("is_active")));

                    if (notificationService.updateNotification(updateNotification)) {
                        message = "Notification updated successfully!";
                    } else {
                        message = "Failed to update notification.";
                        isError = true;
                    }
                    break;

                case "deactivate":
                    int deactivateId = Integer.parseInt(request.getParameter("id"));
                    if (notificationService.deactivateNotification(deactivateId)) {
                        message = "Notification deactivated.";
                    } else {
                        message = "Failed to deactivate notification.";
                        isError = true;
                    }
                    break;
                    
                case "delete":
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    if (notificationService.deleteNotification(deleteId)) {
                        message = "Notification deleted successfully.";
                    } else {
                        message = "Failed to delete notification.";
                        isError = true;
                    }
                    break;
  

                default:
                    message = "Invalid action.";
                    isError = true;
                    break;
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            isError = true;
        }

        if (isError) {
            session.setAttribute("error", message);
        } else {
            session.setAttribute("success", message);
        }
        response.sendRedirect(request.getContextPath() + "/notifications");
    }
}
