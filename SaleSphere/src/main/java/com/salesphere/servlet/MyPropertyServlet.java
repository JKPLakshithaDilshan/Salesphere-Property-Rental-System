package com.salesphere.servlet;

import com.salesphere.model.Property;
import com.salesphere.service.PropertyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/my-property")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 1024 * 1024 * 5,             // 5MB
        maxRequestSize = 1024 * 1024 * 10)         // 10MB
public class MyPropertyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PropertyService propertyService;

    @Override
    public void init() throws ServletException {
        propertyService = new PropertyService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String role = (String) session.getAttribute("role");
        if ("Admin".equals(role)) {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Access denied. Only Admins can view feedbacks.');</script>");
            response.getWriter().println("window.location = '" + request.getContextPath() + "/admin/logout';");
            return;
        }

        int landlordId = (int) session.getAttribute("adminId");
        String action = request.getParameter("action");

        try {
            if (action == null) {
                List<Property> properties = propertyService.getPropertiesByLandlordId(landlordId);
                request.setAttribute("properties", properties);
                request.getRequestDispatcher("/admin/my-properties/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.getRequestDispatcher("/admin/my-properties/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Property property = propertyService.getPropertyById(id);
                if (property != null && property.getLandlordId() == landlordId) {
                    request.setAttribute("property", property);
                    request.getRequestDispatcher("/admin/my-properties/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized access.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                propertyService.deleteProperty(id);
                response.sendRedirect(request.getContextPath() + "/admin/my-property");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String role = (String) session.getAttribute("role");
        if ("Admin".equals(role)) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        int landlordId = (int) session.getAttribute("adminId");
        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                Property property = new Property();
                property.setLandlordId(landlordId);
                property.setTitle(request.getParameter("title"));
                property.setAddress(request.getParameter("address"));
                property.setType(request.getParameter("type"));
                property.setRent(Double.parseDouble(request.getParameter("rent")));
                property.setStatus(request.getParameter("status"));
                property.setDescription(request.getParameter("description"));

                if (propertyService.createProperty(property)) {
                    int newId = propertyService.getPropertiesByLandlordId(landlordId)
                            .stream().filter(p -> p.getTitle().equals(property.getTitle()))
                            .findFirst().get().getPropertyId();

                    Part imagePart = request.getPart("property_image");
                    if (imagePart != null && imagePart.getSize() > 0) {
                        String uploadPath = getServletContext().getRealPath("/") + "assets/properties/";
                        File dir = new File(uploadPath);
                        if (!dir.exists()) dir.mkdirs();
                        imagePart.write(uploadPath + File.separator + newId + ".jpg");
                    }

                    response.sendRedirect(request.getContextPath() + "/admin/my-property");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create property.");
                }

            } else if ("update".equals(action)) {
                int propertyId = Integer.parseInt(request.getParameter("id"));
                Property existing = propertyService.getPropertyById(propertyId);
                if (existing == null || existing.getLandlordId() != landlordId) {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized access.");
                    return;
                }

                existing.setTitle(request.getParameter("title"));
                existing.setAddress(request.getParameter("address"));
                existing.setType(request.getParameter("type"));
                existing.setRent(Double.parseDouble(request.getParameter("rent")));
                existing.setStatus(request.getParameter("status"));
                existing.setDescription(request.getParameter("description"));

                if (propertyService.updateProperty(existing)) {
                    Part imagePart = request.getPart("property_image");
                    if (imagePart != null && imagePart.getSize() > 0) {
                        String uploadPath = getServletContext().getRealPath("/") + "assets/properties/";
                        File dir = new File(uploadPath);
                        if (!dir.exists()) dir.mkdirs();
                        imagePart.write(uploadPath + File.separator + propertyId + ".jpg");
                    }

                    response.sendRedirect(request.getContextPath() + "/admin/my-property");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update property.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to process form.");
        }
    }
}
