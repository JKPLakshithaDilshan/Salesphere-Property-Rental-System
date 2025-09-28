package com.salesphere.service;

import com.salesphere.model.PaymentCard;
import com.salesphere.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentCardService {

    // Add a new card
    public boolean addCard(PaymentCard card) {
        String query = "INSERT INTO PaymentCards (user_id, card_holder_name, card_number, expiry_date, cvv, card_type) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, card.getUser_id());
            stmt.setString(2, card.getCard_holder_name());
            stmt.setString(3, card.getCard_number());
            stmt.setString(4, card.getExpiry_date());
            stmt.setString(5, card.getCvv());
            stmt.setString(6, card.getCard_type());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get cards by user ID
    public List<PaymentCard> getCardsByUserId(int userId) {
        List<PaymentCard> cards = new ArrayList<>();
        String query = "SELECT * FROM PaymentCards WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                PaymentCard card = new PaymentCard();
                card.setCard_id(rs.getInt("card_id"));
                card.setUser_id(rs.getInt("user_id"));
                card.setCard_holder_name(rs.getString("card_holder_name"));
                card.setCard_number(rs.getString("card_number"));
                card.setExpiry_date(rs.getString("expiry_date"));
                card.setCvv(rs.getString("cvv"));
                card.setCard_type(rs.getString("card_type"));
                cards.add(card);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cards;
    }

    // Get single card by ID
    public PaymentCard getCard(int cardId) {
        String query = "SELECT * FROM PaymentCards WHERE card_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, cardId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                PaymentCard card = new PaymentCard();
                card.setCard_id(rs.getInt("card_id"));
                card.setUser_id(rs.getInt("user_id"));
                card.setCard_holder_name(rs.getString("card_holder_name"));
                card.setCard_number(rs.getString("card_number"));
                card.setExpiry_date(rs.getString("expiry_date"));
                card.setCvv(rs.getString("cvv"));
                card.setCard_type(rs.getString("card_type"));
                return card;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update a card
    public boolean updateCard(PaymentCard card) {
        String query = "UPDATE PaymentCards SET card_holder_name = ?, card_number = ?, expiry_date = ?, cvv = ?, card_type = ? WHERE card_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, card.getCard_holder_name());
            stmt.setString(2, card.getCard_number());
            stmt.setString(3, card.getExpiry_date());
            stmt.setString(4, card.getCvv());
            stmt.setString(5, card.getCard_type());
            stmt.setInt(6, card.getCard_id());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a card
    public boolean deleteCard(int cardId) {
        String query = "DELETE FROM PaymentCards WHERE card_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, cardId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
