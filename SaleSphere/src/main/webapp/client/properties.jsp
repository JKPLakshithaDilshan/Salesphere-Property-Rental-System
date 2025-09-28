<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Properties - RentSphere</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap');

    body { font-family: 'Inter', sans-serif; }

    .gradient-bg {
      background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
    }

    .glass-effect {
      backdrop-filter: blur(20px);
      background: rgba(30, 41, 59, 0.8);
      border: 1px solid rgba(148, 163, 184, 0.1);
    }

    .property-card {
      background: linear-gradient(145deg, rgba(30, 41, 59, 0.9), rgba(15, 23, 42, 0.8));
      backdrop-filter: blur(10px);
      border: 1px solid rgba(148, 163, 184, 0.1);
      transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
      position: relative;
      overflow: hidden;
    }

    .property-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(20, 184, 166, 0.1), transparent);
      transition: left 0.6s;
    }

    .property-card:hover::before {
      left: 100%;
    }

    .property-card:hover {
      transform: translateY(-8px) scale(1.02);
      box-shadow: 0 25px 50px -12px rgba(20, 184, 166, 0.25);
      border-color: rgba(20, 184, 166, 0.3);
    }

    .btn-primary {
      background: linear-gradient(135deg, #14b8a6, #0d9488);
      box-shadow: 0 4px 15px rgba(20, 184, 166, 0.4);
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .btn-primary::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
      transition: left 0.6s;
    }

    .btn-primary:hover::before {
      left: 100%;
    }

    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(20, 184, 166, 0.6);
    }

    .status-available {
      background: linear-gradient(135deg, #10b981, #059669);
      box-shadow: 0 0 20px rgba(16, 185, 129, 0.3);
    }

    .status-booked {
      background: linear-gradient(135deg, #f59e0b, #d97706);
      box-shadow: 0 0 20px rgba(245, 158, 11, 0.3);
    }

    .status-unavailable {
      background: linear-gradient(135deg, #ef4444, #dc2626);
      box-shadow: 0 0 20px rgba(239, 68, 68, 0.3);
    }

    .property-image {
      transition: all 0.4s ease;
      position: relative;
    }

    .property-image::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(180deg, transparent 0%, rgba(0,0,0,0.3) 100%);
    }

    .property-card:hover .property-image {
      transform: scale(1.1);
    }

    .animate-float {
      animation: float 6s ease-in-out infinite;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px); }
      50% { transform: translateY(-20px); }
    }

    .glow-text {
      text-shadow: 0 0 20px rgba(20, 184, 166, 0.5);
    }

    .hero-gradient {
      background: linear-gradient(135deg, #0f172a 0%, #1e293b 25%, #334155 50%, #1e293b 75%, #0f172a 100%);
      background-size: 400% 400%;
      animation: gradientShift 15s ease infinite;
    }

    @keyframes gradientShift {
      0%, 100% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
    }

    .price-highlight {
      background: linear-gradient(135deg, #14b8a6, #06b6d4);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      font-weight: 800;
    }
  </style>
</head>
<body class="gradient-bg text-white font-sans overflow-x-hidden">

<!-- Header -->
<c:choose>
  <c:when test="${isLoggedIn}">
    <jsp:include page="./partials/sessionheader.jsp" />
  </c:when>
  <c:otherwise>
    <jsp:include page="./partials/header.jsp" />
  </c:otherwise>
</c:choose>

<!-- Hero Section -->
<section class="hero-gradient relative py-24 overflow-hidden">
  <div class="absolute inset-0">
    <div class="absolute inset-0 bg-gradient-to-r from-teal-500/10 to-blue-500/10 animate-pulse"></div>
  </div>

  <div class="container mx-auto px-6 relative z-10">
    <div class="text-center animate-float">
      <h1 class="text-6xl md:text-7xl font-black mb-6 glow-text">
        Available <span class="price-highlight">Properties</span>
      </h1>
      <p class="text-xl text-slate-300 max-w-2xl mx-auto">
        Discover your perfect home with our premium collection of modern properties
      </p>
      <div class="mt-8 flex justify-center">
        <div class="w-24 h-1 bg-gradient-to-r from-teal-400 to-blue-500 rounded-full"></div>
      </div>
    </div>
  </div>

  <!-- Floating Elements -->
  <div class="absolute top-20 left-10 w-20 h-20 bg-teal-400/10 rounded-full blur-xl animate-pulse"></div>
  <div class="absolute bottom-20 right-20 w-32 h-32 bg-blue-400/10 rounded-full blur-2xl animate-pulse"></div>
  <div class="absolute top-1/2 right-10 w-16 h-16 bg-purple-400/10 rounded-full blur-lg animate-bounce"></div>
</section>

<!-- Main Content -->
<main class="py-20 relative">
  <div class="container mx-auto px-6">

    <c:if test="${empty properties}">
      <div class="text-center py-20">
        <div class="glass-effect rounded-3xl p-12 max-w-md mx-auto">
          <i class="fas fa-home text-6xl text-teal-400 mb-6"></i>
          <h3 class="text-2xl font-bold mb-4">No Properties Available</h3>
          <p class="text-slate-400">Check back soon for new listings!</p>
        </div>
      </div>
    </c:if>

    <!-- Property Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <c:forEach var="property" items="${properties}" varStatus="status">
        <div class="property-card rounded-3xl overflow-hidden group" style="animation-delay: ${status.index * 0.1}s">

          <!-- Property Image -->
          <div class="relative overflow-hidden h-64">
            <img src="${pageContext.request.contextPath}/assets/properties/${property.propertyId}.jpg"
                 alt="${property.title}"
                 class="property-image w-full h-full object-cover">

            <!-- Status Badge -->
            <div class="absolute top-4 left-4 z-20">
              <span class="px-4 py-2 rounded-full text-sm font-semibold text-white
                <c:choose>
                  <c:when test='${property.status eq "Available"}'>status-available</c:when>
                  <c:when test='${property.status eq "Booked"}'>status-booked</c:when>
                  <c:otherwise>status-unavailable</c:otherwise>
                </c:choose>
              ">
                <i class="fas fa-circle mr-2"></i>${property.status}
              </span>
            </div>

            <!-- Property ID -->
            <div class="absolute top-4 right-4 z-20">
              <span class="glass-effect px-3 py-1 rounded-full text-xs font-mono text-teal-400">
                #${property.propertyId}
              </span>
            </div>
          </div>

          <!-- Property Details -->
          <div class="p-8 relative z-10">
            <h3 class="text-2xl font-bold text-white mb-3 group-hover:text-teal-400 transition-colors duration-300">
                ${property.title}
            </h3>

            <div class="flex items-center text-slate-300 mb-2">
              <i class="fas fa-map-marker-alt text-teal-400 mr-3"></i>
              <span>${property.address}</span>
            </div>

            <div class="flex items-center text-slate-400 text-sm mb-6">
              <i class="fas fa-user text-teal-400 mr-3"></i>
              <span>Owned by: <strong class="text-white">${property.landlordName}</strong></span>
            </div>

            <!-- Price and Book Button -->
            <div class="flex justify-between items-center mb-6">
              <div class="text-3xl font-black price-highlight">
                Rs. ${property.rent}<span class="text-sm text-slate-400 font-normal">/month</span>
              </div>

              <a href="${pageContext.request.contextPath}/book-property?id=${property.propertyId}"
                 class="btn-primary text-white px-6 py-3 rounded-xl font-semibold book-now-btn flex items-center space-x-2 transform transition-all duration-300"
                 data-status="${property.status}">
                <i class="fas fa-calendar-check"></i>
                <span>Book Now</span>
              </a>
            </div>

            <!-- Property Tags -->
            <div class="flex flex-wrap gap-2">
              <span class="glass-effect px-4 py-2 rounded-full text-sm font-medium">
                <i class="fas fa-building mr-2 text-teal-400"></i>${property.type}
              </span>
              <span class="glass-effect px-4 py-2 rounded-full text-sm font-medium text-slate-300">
                <i class="fas fa-envelope mr-2 text-blue-400"></i>${property.landlordEmail}
              </span>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</main>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>

<!-- Enhanced Booking Validation -->
<script>
  document.addEventListener("DOMContentLoaded", () => {
    const bookButtons = document.querySelectorAll(".book-now-btn");

    // Add scroll animations
    const observerOptions = {
      threshold: 0.1,
      rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.style.opacity = '1';
          entry.target.style.transform = 'translateY(0)';
        }
      });
    }, observerOptions);

    // Animate property cards on scroll
    document.querySelectorAll('.property-card').forEach((card, index) => {
      card.style.opacity = '0';
      card.style.transform = 'translateY(50px)';
      card.style.transition = `opacity 0.6s ease ${index * 0.1}s, transform 0.6s ease ${index * 0.1}s`;
      observer.observe(card);
    });

    // Enhanced booking validation with modern alerts
    bookButtons.forEach(button => {
      button.addEventListener("click", (event) => {
        const status = button.getAttribute("data-status");

        if (status !== "Available") {
          event.preventDefault();

          // Create modern alert
          const alertDiv = document.createElement('div');
          alertDiv.className = 'fixed top-4 right-4 z-50 glass-effect border border-red-400/30 rounded-xl p-4 max-w-sm transform translate-x-full transition-transform duration-300';
          alertDiv.innerHTML = `
            <div class="flex items-center space-x-3">
              <i class="fas fa-exclamation-triangle text-red-400 text-xl"></i>
              <div>
                <h4 class="font-semibold text-white">Booking Unavailable</h4>
                <p class="text-sm text-slate-300">This property is currently ${status.toLowerCase()}.</p>
              </div>
              <button onclick="this.parentElement.parentElement.remove()" class="text-slate-400 hover:text-white">
                <i class="fas fa-times"></i>
              </button>
            </div>
          `;

          document.body.appendChild(alertDiv);

          // Animate in
          setTimeout(() => {
            alertDiv.style.transform = 'translateX(0)';
          }, 100);

          // Auto remove after 5 seconds
          setTimeout(() => {
            if (alertDiv.parentElement) {
              alertDiv.style.transform = 'translateX(full)';
              setTimeout(() => alertDiv.remove(), 300);
            }
          }, 5000);
        }
      });
    });

    // Add smooth scrolling
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
          target.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
          });
        }
      });
    });
  });
</script>

</body>
</html>