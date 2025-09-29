package com.salesphere.service;

import com.salesphere.model.Property;
import com.salesphere.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PropertyService {

    // Create Property
    public boolean createProperty(Property property) {
        String query = "INSERT INTO properties (landlord_id, title, address, type, rent, status, description) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, property.getLandlordId());
            stmt.setString(2, property.getTitle());
            stmt.setString(3, property.getAddress());
            stmt.setString(4, property.getType());
            stmt.setDouble(5, property.getRent());
            stmt.setString(6, property.getStatus());
            stmt.setString(7, property.getDescription());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Property by ID
    public Property getPropertyById(int propertyId) {
        String query = "SELECT * FROM properties WHERE property_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, propertyId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Property property = new Property();
                property.setPropertyId(rs.getInt("property_id"));
                property.setLandlordId(rs.getInt("landlord_id"));
                property.setTitle(rs.getString("title"));
                property.setAddress(rs.getString("address"));
                property.setType(rs.getString("type"));
                property.setRent(rs.getDouble("rent"));
                property.setStatus(rs.getString("status"));
                property.setDescription(rs.getString("description"));
                property.setCreatedAt(rs.getString("created_at"));
                return property;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Properties (view)
    public List<Property> getAllProperties() {
        List<Property> properties = new ArrayList<>();
        String query = "SELECT * FROM properties_view ORDER BY property_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Property property = new Property();
                property.setPropertyId(rs.getInt("property_id"));
                property.setTitle(rs.getString("title"));
                property.setAddress(rs.getString("address"));
                property.setType(rs.getString("type"));
                property.setRent(rs.getDouble("rent"));
                property.setStatus(rs.getString("status"));
                property.setLandlordName(rs.getString("landlord_name"));
                property.setLandlordEmail(rs.getString("landlord_email"));
                properties.add(property);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return properties;
    }

    // NEW: Search and Filter Properties
    public List<Property> searchAndFilterProperties(String searchTerm, String statusFilter) {
        List<Property> properties = new ArrayList<>();
        StringBuilder query = new StringBuilder(
                "SELECT * FROM properties_view WHERE 1=1"
        );

        List<String> params = new ArrayList<>();

        // Add search condition
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            query.append(" AND (LOWER(title) LIKE ? OR LOWER(address) LIKE ? OR " +
                    "LOWER(landlord_name) LIKE ? OR LOWER(type) LIKE ?)");
            String searchPattern = "%" + searchTerm.toLowerCase() + "%";
            params.add(searchPattern);
            params.add(searchPattern);
            params.add(searchPattern);
            params.add(searchPattern);
        }

        // Add status filter
        if (statusFilter != null && !statusFilter.trim().isEmpty() && !"all".equalsIgnoreCase(statusFilter)) {
            query.append(" AND status = ?");
            params.add(statusFilter);
        }

        query.append(" ORDER BY property_id");

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query.toString())) {

            // Set parameters
            for (int i = 0; i < params.size(); i++) {
                stmt.setString(i + 1, params.get(i));
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Property property = new Property();
                property.setPropertyId(rs.getInt("property_id"));
                property.setTitle(rs.getString("title"));
                property.setAddress(rs.getString("address"));
                property.setType(rs.getString("type"));
                property.setRent(rs.getDouble("rent"));
                property.setStatus(rs.getString("status"));
                property.setLandlordName(rs.getString("landlord_name"));
                property.setLandlordEmail(rs.getString("landlord_email"));
                properties.add(property);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return properties;
    }

    // Get Properties by Landlord ID (view)
    public List<Property> getPropertiesByLandlordId(int landlordId) {
        List<Property> properties = new ArrayList<>();
        String query = "SELECT p.*, a.full_name AS landlord_name, a.email AS landlord_email " +
                "FROM properties p " +
                "JOIN admins a ON p.landlord_id = a.admin_id " +
                "WHERE p.landlord_id = ? " +
                "ORDER BY p.property_id";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, landlordId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Property property = new Property();
                property.setPropertyId(rs.getInt("property_id"));
                property.setTitle(rs.getString("title"));
                property.setAddress(rs.getString("address"));
                property.setType(rs.getString("type"));
                property.setRent(rs.getDouble("rent"));
                property.setStatus(rs.getString("status"));
                property.setDescription(rs.getString("description"));
                property.setLandlordName(rs.getString("landlord_name"));
                property.setLandlordEmail(rs.getString("landlord_email"));
                property.setCreatedAt(rs.getString("created_at"));
                properties.add(property);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return properties;
    }

    // Update Property
    public boolean updateProperty(Property property) {
        String query = "UPDATE properties SET title = ?, address = ?, type = ?, rent = ?, status = ?, description = ? WHERE property_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, property.getTitle());
            stmt.setString(2, property.getAddress());
            stmt.setString(3, property.getType());
            stmt.setDouble(4, property.getRent());
            stmt.setString(5, property.getStatus());
            stmt.setString(6, property.getDescription());
            stmt.setInt(7, property.getPropertyId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Property
    public boolean deleteProperty(int propertyId) {
        String query = "DELETE FROM properties WHERE property_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, propertyId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}