<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>User Profile | RentSphere</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

    body {
      font-family: 'Inter', sans-serif;
    }

    .gradient-bg {
      background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
      min-height: 100vh;
    }

    .glass-card {
      background: rgba(30, 41, 59, 0.8);
      backdrop-filter: blur(12px);
      border: 1px solid rgba(148, 163, 184, 0.1);
      transition: all 0.3s ease;
    }

    .glass-card:hover {
      transform: translateY(-2px);
      border-color: rgba(20, 184, 166, 0.3);
      box-shadow: 0 8px 32px rgba(20, 184, 166, 0.1);
    }

    .profile-card {
      background: linear-gradient(145deg, rgba(30, 41, 59, 0.95), rgba(15, 23, 42, 0.9));
      backdrop-filter: blur(16px);
      border: 1px solid rgba(148, 163, 184, 0.15);
    }

    .info-card {
      background: linear-gradient(135deg, rgba(51, 65, 85, 0.9), rgba(30, 41, 59, 0.8));
      border: 1px solid rgba(148, 163, 184, 0.1);
      transition: all 0.3s ease;
    }

    .info-card:hover {
      transform: translateY(-3px);
      border-color: rgba(20, 184, 166, 0.2);
      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
    }

    .welcome-gradient {
      background: linear-gradient(135deg, #14b8a6, #06b6d4);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .icon-glow {
      color: #14b8a6;
      filter: drop-shadow(0 0 8px rgba(20, 184, 166, 0.5));
    }

    .profile-avatar {
      width: 100px;
      height: 100px;
      background: linear-gradient(135deg, #14b8a6, #06b6d4);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2.5rem;
      color: white;
      font-weight: 700;
      box-shadow: 0 0 24px rgba(20, 184, 166, 0.4);
    }

    .btn-action {
      background: linear-gradient(135deg, rgba(20, 184, 166, 0.8), rgba(6, 182, 212, 0.8));
      backdrop-filter: blur(8px);
      border: 1px solid rgba(20, 184, 166, 0.3);
      transition: all 0.3s ease;
    }

    .btn-action:hover {
      background: linear-gradient(135deg, rgba(20, 184, 166, 1), rgba(6, 182, 212, 1));
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(20, 184, 166, 0.3);
    }

    .fade-in {
      opacity: 0;
      transform: translateY(20px);
      animation: fadeInUp 0.6s ease-out forwards;
    }

    .delay-100 { animation-delay: 0.1s; }
    .delay-200 { animation-delay: 0.2s; }
    .delay-300 { animation-delay: 0.3s; }
    .delay-400 { animation-delay: 0.4s; }
    .delay-500 { animation-delay: 0.5s; }
    .delay-600 { animation-delay: 0.6s; }

    @keyframes fadeInUp {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body class="gradient-bg text-white">

<!-- Header -->
<c:choose>
  <c:when test="${isLoggedIn}">
    <jsp:include page="./partials/sessionheader.jsp" />
  </c:when>
  <c:otherwise>
    <jsp:include page="./partials/header.jsp" />
  </c:otherwise>
</c:choose>

<!-- Layout -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 flex flex-col lg:flex-row gap-8">

  <!-- Sidebar -->
  <div class="fade-in delay-100">
    <%@ include file="./partials/sidebar.jsp" %>
  </div>

  <!-- Main Profile Content -->
  <main class="flex-1 profile-card rounded-2xl shadow-2xl p-6 lg:p-8 fade-in delay-200">

    <!-- Profile Header -->
    <div class="flex flex-col md:flex-row items-center md:items-start gap-6 mb-8 pb-8 border-b border-slate-700">
      <div class="profile-avatar fade-in delay-300">
        <c:choose>
          <c:when test="${not empty user.fullName}">
            ${user.fullName.substring(0,1).toUpperCase()}
          </c:when>
          <c:otherwise>U</c:otherwise>
        </c:choose>
      </div>

      <div class="text-center md:text-left flex-1 fade-in delay-400">
        <h1 class="text-3xl lg:text-4xl font-bold mb-3">
          Welcome, <span class="welcome-gradient"><c:out value="${user.fullName}" default="User" /></span>
        </h1>
        <p class="text-slate-300 text-lg">
          Manage your profile information and account settings
        </p>
      </div>
    </div>

    <!-- Profile Information Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">

      <div class="info-card rounded-xl p-5 shadow-lg fade-in delay-300">
        <div class="flex items-center mb-3">
          <i class="fas fa-user text-xl icon-glow mr-3"></i>
          <h3 class="text-sm font-semibold text-slate-300 uppercase tracking-wider">
            Full Name
          </h3>
        </div>
        <p class="text-lg text-white font-semibold"><c:out value="${user.fullName}" default="Not provided" /></p>
      </div>

      <div class="info-card rounded-xl p-5 shadow-lg fade-in delay-400">
        <div class="flex items-center mb-3">
          <i class="fas fa-envelope text-xl icon-glow mr-3"></i>
          <h3 class="text-sm font-semibold text-slate-300 uppercase tracking-wider">
            Email Address
          </h3>
        </div>
        <p class="text-lg text-white font-semibold break-all"><c:out value="${user.email}" default="Not provided" /></p>
      </div>

      <div class="info-card rounded-xl p-5 shadow-lg fade-in delay-500">
        <div class="flex items-center mb-3">
          <i class="fas fa-id-card text-xl icon-glow mr-3"></i>
          <h3 class="text-sm font-semibold text-slate-300 uppercase tracking-wider">
            NIC Number
          </h3>
        </div>
        <p class="text-lg text-white font-semibold font-mono"><c:out value="${user.nicNumber}" default="Not provided" /></p>
      </div>

      <div class="info-card rounded-xl p-5 shadow-lg fade-in delay-600">
        <div class="flex items-center mb-3">
          <i class="fas fa-phone text-xl icon-glow mr-3"></i>
          <h3 class="text-sm font-semibold text-slate-300 uppercase tracking-wider">
            Phone Number
          </h3>
        </div>
        <p class="text-lg text-white font-semibold font-mono"><c:out value="${user.phone}" default="Not provided" /></p>
      </div>

      <div class="info-card rounded-xl p-5 shadow-lg md:col-span-2 fade-in delay-600">
        <div class="flex items-center mb-3">
          <i class="fas fa-map-marker-alt text-xl icon-glow mr-3"></i>
          <h3 class="text-sm font-semibold text-slate-300 uppercase tracking-wider">
            Address
          </h3>
        </div>
        <p class="text-lg text-white font-semibold leading-relaxed"><c:out value="${user.address}" default="Not provided" /></p>
      </div>
    </div>
  </main>
</div>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>

</body>
</html>