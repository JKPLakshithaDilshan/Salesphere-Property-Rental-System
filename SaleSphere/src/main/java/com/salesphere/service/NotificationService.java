package com.salesphere.service;

import com.salesphere.model.Notification;
import com.salesphere.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationService {

    // Create a new notification
    public boolean createNotification(Notification notification) {
        String query = "INSERT INTO Notifications (title, message, target_audience, created_by) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, notification.getTitle());
            stmt.setString(2, notification.getMessage());
            stmt.setString(3, notification.getTargetAudience());
            stmt.setInt(4, notification.getCreatedBy());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all active notifications for a specific audience
    public List<Notification> getNotificationsForAudience(String audience) {
        List<Notification> notifications = new ArrayList<>();
        String query = "SELECT * FROM Notifications WHERE is_active = TRUE AND (target_audience = ? OR target_audience = 'All') ORDER BY created_at DESC";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, audience);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                notifications.add(mapResultSetToNotification(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    // Get a notification by ID
    public Notification getNotificationById(int id) {
        String query = "SELECT * FROM Notifications WHERE notification_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToNotification(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update a notification
    public boolean updateNotification(Notification notification) {
        String query = "UPDATE Notifications SET title = ?, message = ?, target_audience = ?, is_active = ? WHERE notification_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, notification.getTitle());
            stmt.setString(2, notification.getMessage());
            stmt.setString(3, notification.getTargetAudience());
            stmt.setBoolean(4, notification.isActive());
            stmt.setInt(5, notification.getNotificationId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a notification (soft delete by deactivating)
    public boolean deactivateNotification(int id) {
        String query = "UPDATE Notifications SET is_active = FALSE WHERE notification_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Helper method to map ResultSet to Notification object
    private Notification mapResultSetToNotification(ResultSet rs) throws SQLException {
        Notification notification = new Notification();
        notification.setNotificationId(rs.getInt("notification_id"));
        notification.setTitle(rs.getString("title"));
        notification.setMessage(rs.getString("message"));
        notification.setTargetAudience(rs.getString("target_audience"));
        notification.setCreatedBy(rs.getInt("created_by"));
        notification.setCreatedAt(rs.getString("created_at"));
        notification.setActive(rs.getBoolean("is_active"));
        return notification;
    }
    
    public List<Notification> getAllNotifications() {
        List<Notification> notifications = new ArrayList<>();
        String query = "SELECT * FROM Notifications ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Notification notification = new Notification();
                notification.setNotificationId(rs.getInt("notification_id"));
                notification.setTitle(rs.getString("title"));
                notification.setMessage(rs.getString("message"));
                notification.setTargetAudience(rs.getString("target_audience"));
                notification.setCreatedBy(rs.getInt("created_by"));
                notification.setCreatedAt(rs.getString("created_at"));
                notification.setActive(rs.getBoolean("is_active"));

                notifications.add(notification);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return notifications;
    }

    
    public List<Notification> getUserNotifications() {
        List<Notification> list = new ArrayList<>();
        String query = "SELECT * FROM Notifications WHERE is_active = TRUE AND (target_audience = 'All' OR target_audience = 'Users') ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Notification n = new Notification();
                n.setNotificationId(rs.getInt("notification_id"));
                n.setTitle(rs.getString("title"));
                n.setMessage(rs.getString("message"));
                n.setTargetAudience(rs.getString("target_audience"));
                n.setCreatedBy(rs.getInt("created_by"));
                n.setCreatedAt(rs.getString("created_at"));
                n.setActive(rs.getBoolean("is_active"));
                list.add(n);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    //delete notifcation
    public boolean deleteNotification(int id) {
        String query = "DELETE FROM Notifications WHERE notification_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
}
