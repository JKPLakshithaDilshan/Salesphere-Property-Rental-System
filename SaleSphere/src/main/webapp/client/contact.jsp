<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Us - RentSphere</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap');

    body {
      font-family: 'Inter', sans-serif;
    }

    /* Floating particles background */
    .particles-container {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      pointer-events: none;
    }

    .particle {
      position: absolute;
      width: 3px;
      height: 3px;
      background: rgba(45, 212, 191, 0.3);
      border-radius: 50%;
      animation: float 20s infinite linear;
    }

    @keyframes float {
      0% {
        transform: translateY(100vh) rotate(0deg);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      90% {
        opacity: 1;
      }
      100% {
        transform: translateY(-10vh) rotate(360deg);
        opacity: 0;
      }
    }

    /* Gradient text animation */
    .gradient-text {
      background: linear-gradient(-45deg, #2dd4bf, #06b6d4, #8b5cf6, #ec4899);
      background-size: 400% 400%;
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      animation: gradientShift 4s ease-in-out infinite;
    }

    @keyframes gradientShift {
      0%, 100% {
        background-position: 0% 50%;
      }
      50% {
        background-position: 100% 50%;
      }
    }

    /* Glassmorphism cards */
    .glass-card {
      background: rgba(30, 41, 59, 0.7);
      backdrop-filter: blur(20px);
      border: 1px solid rgba(45, 212, 191, 0.2);
      box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
      transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    }

    .glass-card:hover {
      transform: translateY(-10px) scale(1.02);
      border-color: rgba(45, 212, 191, 0.5);
      box-shadow: 0 20px 60px 0 rgba(45, 212, 191, 0.2);
    }

    /* Pulse animation for icons */
    .icon-pulse {
      animation: pulse-glow 2s infinite;
    }

    @keyframes pulse-glow {
      0%, 100% {
        transform: scale(1);
        filter: drop-shadow(0 0 10px rgba(45, 212, 191, 0.5));
      }
      50% {
        transform: scale(1.1);
        filter: drop-shadow(0 0 20px rgba(45, 212, 191, 0.8));
      }
    }

    /* Stagger animation for cards */
    .stagger-item {
      opacity: 0;
      transform: translateY(50px);
      animation: staggerIn 0.8s ease-out forwards;
    }

    .stagger-item:nth-child(1) { animation-delay: 0.1s; }
    .stagger-item:nth-child(2) { animation-delay: 0.2s; }
    .stagger-item:nth-child(3) { animation-delay: 0.3s; }

    @keyframes staggerIn {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Magnetic button effect */
    .magnetic-btn {
      position: relative;
      transition: all 0.3s cubic-bezier(0.23, 1, 0.32, 1);
      overflow: hidden;
    }

    .magnetic-btn::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(45, 212, 191, 0.4), transparent);
      transition: left 0.5s;
    }

    .magnetic-btn:hover::before {
      left: 100%;
    }

    /* Timeline animation */
    .timeline-item {
      opacity: 0;
      transform: translateX(-50px);
      animation: slideIn 0.6s ease-out forwards;
    }

    .timeline-item:nth-child(1) { animation-delay: 0.2s; }
    .timeline-item:nth-child(2) { animation-delay: 0.4s; }
    .timeline-item:nth-child(3) { animation-delay: 0.6s; }

    @keyframes slideIn {
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    /* Map container hover effect */
    .map-container {
      position: relative;
      overflow: hidden;
      border-radius: 1rem;
      transition: all 0.4s ease;
    }

    .map-container:hover {
      transform: scale(1.02);
      box-shadow: 0 25px 50px -12px rgba(45, 212, 191, 0.25);
    }

    .map-overlay {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(45deg, rgba(45, 212, 191, 0.1), rgba(139, 92, 246, 0.1));
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    .map-container:hover .map-overlay {
      opacity: 1;
    }

    /* Hero text reveal animation */
    .hero-text {
      overflow: hidden;
    }

    .hero-text-inner {
      transform: translateY(100%);
      animation: textReveal 1s ease-out forwards;
    }

    @keyframes textReveal {
      to {
        transform: translateY(0);
      }
    }

    /* Floating elements */
    .float-1 {
      animation: float1 6s ease-in-out infinite;
    }

    .float-2 {
      animation: float2 8s ease-in-out infinite;
    }

    .float-3 {
      animation: float3 10s ease-in-out infinite;
    }

    @keyframes float1 {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      50% { transform: translateY(-20px) rotate(180deg); }
    }

    @keyframes float2 {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      50% { transform: translateY(-30px) rotate(-180deg); }
    }

    @keyframes float3 {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      50% { transform: translateY(-25px) rotate(360deg); }
    }

    /* Ripple effect */
    .ripple {
      position: relative;
      overflow: hidden;
    }

    .ripple::after {
      content: '';
      position: absolute;
      top: 50%;
      left: 50%;
      width: 5px;
      height: 5px;
      background: rgba(45, 212, 191, 0.5);
      opacity: 0;
      border-radius: 100%;
      transform: scale(1, 1) translate(-50%);
      transform-origin: 50% 50%;
    }

    .ripple:focus:not(:active)::after {
      animation: rippleEffect 1s ease-out;
    }

    @keyframes rippleEffect {
      0% {
        transform: scale(0, 0);
        opacity: 1;
      }
      20% {
        transform: scale(25, 25);
        opacity: 1;
      }
      100% {
        opacity: 0;
        transform: scale(40, 40);
      }
    }
  </style>
</head>
<body class="bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 text-gray-100 font-sans overflow-x-hidden">

  <!-- Floating Particles Background -->
  <div class="particles-container" id="particles"></div>

  <!-- Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="./partials/sessionheader.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="./partials/header.jsp" />
    </c:otherwise>
  </c:choose>

  <main>

    <!-- Hero Section -->
    <section class="relative py-32 bg-gradient-to-br from-slate-800 via-slate-700 to-slate-800 overflow-hidden">
      <!-- Floating decorative elements -->
      <div class="absolute top-20 left-10 w-20 h-20 bg-teal-400/10 rounded-full float-1"></div>
      <div class="absolute top-40 right-20 w-16 h-16 bg-purple-400/10 rounded-full float-2"></div>
      <div class="absolute bottom-20 left-1/4 w-12 h-12 bg-pink-400/10 rounded-full float-3"></div>

      <div class="container mx-auto px-6 text-center relative z-10">
        <div class="hero-text">
          <h1 class="hero-text-inner text-6xl md:text-7xl font-black gradient-text mb-8">
            Contact SaleSphere
          </h1>
        </div>
        <div class="hero-text" style="animation-delay: 0.3s;">
          <p class="hero-text-inner text-xl md:text-2xl text-gray-300 max-w-3xl mx-auto leading-relaxed">
            Experience next-level support with our innovative approach to property inquiries, bookings, and customer care.
          </p>
        </div>

        <!-- Animated CTA Button -->
        <div class="mt-12" style="animation: fadeInUp 1s ease-out 0.6s both;">
          <button onclick="scrollToContact()" class="magnetic-btn ripple bg-gradient-to-r from-teal-500 to-cyan-500 hover:from-teal-400 hover:to-cyan-400 text-white font-bold py-4 px-8 rounded-full text-lg shadow-lg hover:shadow-teal-500/25 transform hover:scale-105 transition-all duration-300">
            <i class="fas fa-rocket mr-2"></i>
            Get In Touch
          </button>
        </div>
      </div>
    </section>

    <!-- Contact Info Section -->
    <section id="contact-info" class="py-20 bg-gradient-to-b from-slate-900 to-slate-800 relative">
      <div class="container mx-auto px-6">
        <div class="text-center mb-16">
          <h2 class="text-4xl md:text-5xl font-bold gradient-text mb-4">Connect With Us</h2>
          <p class="text-xl text-gray-400 max-w-2xl mx-auto">Multiple ways to reach our dedicated team</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <!-- Location Card -->
          <div class="glass-card stagger-item p-8 rounded-2xl group">
            <div class="text-5xl text-teal-400 mb-6 icon-pulse">
              <i class="fas fa-map-marker-alt"></i>
            </div>
            <h3 class="text-2xl font-bold text-white mb-4 group-hover:text-teal-400 transition-colors">
              Address
            </h3>
            <p class="text-slate-300 text-lg leading-relaxed">
              456 Rental Ave<br>
              Colombo, Sri Lanka<br>
              <span class="text-teal-400 font-semibold">Central Business District</span>
            </p>
            <div class="mt-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
              <div class="h-1 w-full bg-gradient-to-r from-teal-400 to-cyan-400 rounded-full"></div>
            </div>
          </div>

          <!-- Phone Card -->
          <div class="glass-card stagger-item p-8 rounded-2xl group">
            <div class="text-5xl text-teal-400 mb-6 icon-pulse" style="animation-delay: 0.5s;">
              <i class="fas fa-phone-alt"></i>
            </div>
            <h3 class="text-2xl font-bold text-white mb-4 group-hover:text-teal-400 transition-colors">
              Phone
            </h3>
            <p class="text-slate-300 text-lg leading-relaxed">
              <span class="block mb-2">
                <i class="fas fa-headset text-teal-400 mr-2"></i>
                General: <span class="font-semibold">+94 76 479 2982</span>
              </span>
              <span class="block">
                <i class="fas fa-life-ring text-teal-400 mr-2"></i>
                Support: <span class="font-semibold">+94 76 479 2982</span>
              </span>
            </p>
            <div class="mt-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
              <div class="h-1 w-full bg-gradient-to-r from-teal-400 to-cyan-400 rounded-full"></div>
            </div>
          </div>

          <!-- Email Card -->
          <div class="glass-card stagger-item p-8 rounded-2xl group">
            <div class="text-5xl text-teal-400 mb-6 icon-pulse" style="animation-delay: 1s;">
              <i class="fas fa-envelope"></i>
            </div>
            <h3 class="text-2xl font-bold text-white mb-4 group-hover:text-teal-400 transition-colors">
              Email
            </h3>
            <p class="text-slate-300 text-lg leading-relaxed">
              <span class="block mb-2">
                <i class="fas fa-question-circle text-teal-400 mr-2"></i>
                Help: <span class="font-semibold">lakshithadilshan.info@gmail.com</span>
              </span>
              <span class="block">
                <i class="fas fa-info-circle text-teal-400 mr-2"></i>
                Info: <span class="font-semibold">lakshithadilshan.info@gmail.com</span>
              </span>
            </p>
            <div class="mt-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
              <div class="h-1 w-full bg-gradient-to-r from-teal-400 to-cyan-400 rounded-full"></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Working Hours -->
    <section class="py-20 bg-gradient-to-br from-slate-800 to-slate-900 relative">
      <div class="container mx-auto px-6">
        <div class="text-center mb-16">
          <h2 class="text-4xl md:text-5xl font-bold gradient-text mb-4">Office Hours</h2>
          <p class="text-xl text-gray-400">When we're available to assist you</p>
        </div>

        <div class="max-w-4xl mx-auto">
          <div class="glass-card p-10 rounded-3xl">
            <div class="space-y-8">
              <div class="timeline-item flex items-center justify-between border-b border-slate-600/50 pb-6 group">
                <div class="flex items-center space-x-4">
                  <div class="w-16 h-16 bg-gradient-to-br from-teal-400 to-cyan-400 rounded-full flex items-center justify-center group-hover:scale-110 transition-transform">
                    <i class="fas fa-headset text-white text-xl"></i>
                  </div>
                  <div>
                    <span class="text-xl font-bold text-white group-hover:text-teal-400 transition-colors">Customer Support</span>
                    <p class="text-gray-400 text-sm">Live chat & phone support</p>
                  </div><%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
                  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                  <!DOCTYPE html>
                  <html lang="en" class="dark">
                  <head>
                    <meta charset="UTF-8" />
                    <title>About Us - SaleSphere</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
                    <link href="./css/output.css" rel="stylesheet" />
                  </head>
                  <body class="bg-slate-900 text-gray-100 font-sans">

                  <!-- Header -->
                  <c:choose>
                    <c:when test="${isLoggedIn}">
                      <jsp:include page="./partials/sessionheader.jsp" />
                    </c:when>
                    <c:otherwise>
                      <jsp:include page="./partials/header.jsp" />
                    </c:otherwise>
                  </c:choose>

                  <!-- Main Content -->
                  <main class="bg-slate-900 overflow-x-hidden">

                    <!-- Animated Background Particles -->
                    <div id="particles-container" class="fixed inset-0 pointer-events-none z-0"></div>

                    <!-- Hero Section -->
                    <section class="relative py-32 gradient-bg overflow-hidden">
                      <div class="container mx-auto px-6 relative z-10 text-center">
                        <h1 class="text-5xl md:text-6xl font-extrabold mb-6 text-white leading-tight animate-fade-in">
                          Empowering Your Property Journey
                        </h1>
                        <p class="text-lg md:text-xl text-gray-300 max-w-3xl mx-auto mb-10 animate-fade-in-delay">
                          At SaleSphere, we simplify property sales and rentals with cutting-edge technology,
                          connecting buyers, sellers, and renters seamlessly.
                        </p>

                        <!-- ✅ Fixed: Centered Button -->
                        <div class="mt-10 flex justify-center">
                          <a href="contact.jsp"
                             class="px-8 py-4 bg-blue-600 hover:bg-blue-500 text-white rounded-full text-lg shadow-lg transform hover:scale-105 transition duration-300">
                            Get In Touch
                          </a>
                        </div>
                      </div>
                      <div class="absolute inset-0 bg-gradient-to-b from-blue-500/10 to-transparent"></div>
                    </section>

                    <!-- History Section -->
                    <section class="py-24 bg-slate-900 relative">
                      <div class="container mx-auto px-6">
                        <div class="grid md:grid-cols-2 gap-16 items-center">
                          <div class="relative">
                            <img src="./img/history.jpg"
                                 alt="Our History"
                                 class="rounded-2xl shadow-2xl transform hover:scale-105 transition duration-500" />
                          </div>
                          <div>
                            <h2 class="text-4xl font-bold text-white mb-6">Our Story</h2>
                            <p class="text-lg text-gray-300 mb-6 leading-relaxed">
                              Founded in 2020, SaleSphere emerged with a vision to revolutionize the real estate industry.
                              Our platform bridges the gap between traditional property sales and modern technology,
                              making real estate transactions transparent, efficient, and user-friendly.
                            </p>
                            <p class="text-lg text-gray-300 leading-relaxed">
                              Today, we proudly serve thousands of customers, helping them buy, sell, and rent properties with confidence.
                            </p>
                          </div>
                        </div>
                      </div>
                    </section>

                    <!-- Values Section -->
                    <section class="py-24 gradient-bg relative overflow-hidden">
                      <div class="container mx-auto px-6 text-center">
                        <h2 class="text-4xl font-bold text-white mb-16">Our Core Values</h2>
                        <div class="grid md:grid-cols-3 gap-12">

                          <!-- Value 1 -->
                          <div class="bg-slate-800/60 backdrop-blur-lg p-10 rounded-2xl shadow-lg hover:shadow-2xl transition transform hover:-translate-y-2">
                            <i class="fas fa-handshake text-5xl text-blue-500 mb-6"></i>
                            <h3 class="text-2xl font-semibold mb-4 text-white">Integrity</h3>
                            <p class="text-gray-400 leading-relaxed">
                              We prioritize honesty and transparency, ensuring trust in every transaction.
                            </p>
                          </div>

                          <!-- Value 2 -->
                          <div class="bg-slate-800/60 backdrop-blur-lg p-10 rounded-2xl shadow-lg hover:shadow-2xl transition transform hover:-translate-y-2">
                            <i class="fas fa-lightbulb text-5xl text-blue-500 mb-6"></i>
                            <h3 class="text-2xl font-semibold mb-4 text-white">Innovation</h3>
                            <p class="text-gray-400 leading-relaxed">
                              Leveraging the latest technology, we deliver smarter, faster, and simpler property solutions.
                            </p>
                          </div>

                          <!-- Value 3 -->
                          <div class="bg-slate-800/60 backdrop-blur-lg p-10 rounded-2xl shadow-lg hover:shadow-2xl transition transform hover:-translate-y-2">
                            <i class="fas fa-users text-5xl text-blue-500 mb-6"></i>
                            <h3 class="text-2xl font-semibold mb-4 text-white">Customer Focus</h3>
                            <p class="text-gray-400 leading-relaxed">
                              Your needs are at the heart of what we do. We’re committed to providing exceptional experiences.
                            </p>
                          </div>

                        </div>
                      </div>
                    </section>

                  </main>

                  <!-- Footer -->
                  <%@ include file="./partials/footer.jsp" %>

                  <!-- Scripts -->
                  <script>
                    // Particle animation
                    const particlesContainer = document.getElementById("particles-container");
                    for (let i = 0; i < 60; i++) {
                      const particle = document.createElement("div");
                      particle.className = "particle";
                      particle.style.left = Math.random() * 100 + "vw";
                      particle.style.top = Math.random() * 100 + "vh";
                      particle.style.width = particle.style.height = Math.random() * 4 + "px";
                      particle.style.background = "rgba(59,130,246,0.6)";
                      particle.style.position = "absolute";
                      particle.style.borderRadius = "50%";
                      particle.style.animation = `float ${Math.random() * 10 + 10}s linear infinite`;
                      particlesContainer.appendChild(particle);
                    }
                  </script>
                  </body>
                  </html>

                </div>
                <div class="text-right">
                  <span class="text-lg font-semibold text-teal-400">9:00 AM - 6:00 PM</span>
                  <p class="text-gray-400 text-sm">Monday - Friday</p>
                </div>
              </div>

              <div class="timeline-item flex items-center justify-between border-b border-slate-600/50 pb-6 group">
                <div class="flex items-center space-x-4">
                  <div class="w-16 h-16 bg-gradient-to-br from-purple-400 to-pink-400 rounded-full flex items-center justify-center group-hover:scale-110 transition-transform">
                    <i class="fas fa-home text-white text-xl"></i>
                  </div>
                  <div>
                    <span class="text-xl font-bold text-white group-hover:text-purple-400 transition-colors">Property Viewing</span>
                    <p class="text-gray-400 text-sm">Schedule your visits</p>
                  </div>
                </div>
                <div class="text-right">
                  <span class="text-lg font-semibold text-purple-400">10:00 AM - 5:00 PM</span>
                  <p class="text-gray-400 text-sm">Weekdays only</p>
                </div>
              </div>

              <div class="timeline-item flex items-center justify-between group">
                <div class="flex items-center space-x-4">
                  <div class="w-16 h-16 bg-gradient-to-br from-cyan-400 to-blue-400 rounded-full flex items-center justify-center group-hover:scale-110 transition-transform">
                    <i class="fas fa-envelope text-white text-xl"></i>
                  </div>
                  <div>
                    <span class="text-xl font-bold text-white group-hover:text-cyan-400 transition-colors">Email Support</span>
                    <p class="text-gray-400 text-sm">We respond quickly</p>
                  </div>
                </div>
                <div class="text-right">
                  <span class="text-lg font-semibold text-cyan-400">24/7 Response</span>
                  <p class="text-gray-400 text-sm">Always available</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Map Section -->
    <section class="py-20 bg-gradient-to-t from-slate-900 to-slate-800">
      <div class="container mx-auto px-6">
        <div class="text-center mb-16">
          <h2 class="text-4xl md:text-5xl font-bold gradient-text mb-4">Find Us</h2>
          <p class="text-xl text-gray-400">Located in the heart of Colombo</p>
        </div>

        <div class="max-w-6xl mx-auto">
          <div class="map-container glass-card p-4 rounded-3xl">
            <div class="map-overlay"></div>
            <div class="relative w-full h-96 md:h-[500px] rounded-2xl overflow-hidden">
              <!-- Alternative Map Display -->
              <div class="w-full h-full bg-gradient-to-br from-slate-700 to-slate-600 flex items-center justify-center relative">
                <div class="absolute inset-0 opacity-20">
                  <div class="w-full h-full bg-[url('data:image/svg+xml,%3Csvg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg"%3E%3Cg fill="none" fill-rule="evenodd"%3E%3Cg fill="%232dd4bf" fill-opacity="0.1"%3E%3Cpath d="M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z"/%3E%3C/g%3E%3C/g%3E%3C/svg%3E')] opacity-30"></div>
                </div>

                <!-- Map Content -->
                <div class="relative z-10 text-center">
                  <div class="w-20 h-20 bg-gradient-to-br from-teal-400 to-cyan-400 rounded-full flex items-center justify-center mx-auto mb-4 animate-pulse">
                    <i class="fas fa-map-marker-alt text-white text-2xl"></i>
                  </div>
                  <h3 class="text-2xl font-bold text-white mb-2">RentSphere Office</h3>
                  <p class="text-teal-400 font-semibold text-lg mb-4">456 Rental Ave, Colombo</p>
                  <p class="text-gray-300 text-sm max-w-md">
                    Located in the central business district with easy access to public transportation
                  </p>
                </div>

                <!-- Decorative elements -->
                <div class="absolute top-6 left-6 w-3 h-3 bg-teal-400 rounded-full animate-ping"></div>
                <div class="absolute top-12 right-8 w-2 h-2 bg-cyan-400 rounded-full animate-ping" style="animation-delay: 0.5s;"></div>
                <div class="absolute bottom-8 left-12 w-4 h-4 bg-purple-400 rounded-full animate-ping" style="animation-delay: 1s;"></div>
                <div class="absolute bottom-16 right-6 w-2 h-2 bg-pink-400 rounded-full animate-ping" style="animation-delay: 1.5s;"></div>
              </div>

              <!-- Try to load actual map as fallback -->
              <iframe
                width="100%"
                height="100%"
                src="https://www.openstreetmap.org/export/embed.html?bbox=79.854%2C6.920%2C79.858%2C6.924&layer=mapnik&marker=6.922%2C79.856"
                class="absolute inset-0 rounded-2xl opacity-0 transition-opacity duration-1000"
                style="border: none;"
                onload="this.style.opacity='1'; this.previousElementSibling.style.display='none';"
                onerror="console.log('Map fallback active');">
              </iframe>
            </div>
          </div>

          <div class="mt-8 text-center">
            <a href="https://www.openstreetmap.org/?mlat=6.922&mlon=79.856#map=17/6.922/79.856"
               target="_blank"
               class="magnetic-btn ripple inline-flex items-center space-x-2 text-teal-400 hover:text-white bg-transparent hover:bg-teal-500 border-2 border-teal-400 hover:border-teal-500 font-bold py-3 px-6 rounded-full transition-all duration-300 transform hover:scale-105">
              <i class="fas fa-external-link-alt"></i>
              <span>View Larger Map</span>
            </a>
            <p class="mt-4 text-gray-300 text-lg">
              Conveniently located in central Colombo near all major transport lines.
            </p>
          </div>
        </div>
      </div>
    </section>

  </main>

  <!-- Footer -->
  <%@ include file="./partials/footer.jsp" %>

  <script>
    // Create floating particles
    function createParticles() {
      const container = document.getElementById('particles');
      const particleCount = 50;

      for (let i = 0; i < particleCount; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        particle.style.left = Math.random() * 100 + '%';
        particle.style.animationDelay = Math.random() * 20 + 's';
        particle.style.animationDuration = (Math.random() * 10 + 15) + 's';
        container.appendChild(particle);
      }
    }

    // Magnetic button effect
    document.querySelectorAll('.magnetic-btn').forEach(btn => {
      btn.addEventListener('mousemove', (e) => {
        const rect = btn.getBoundingClientRect();
        const x = e.clientX - rect.left - rect.width / 2;
        const y = e.clientY - rect.top - rect.height / 2;

        btn.style.transform = `translate(${x * 0.1}px, ${y * 0.1}px) scale(1.05)`;
      });

      btn.addEventListener('mouseleave', () => {
        btn.style.transform = 'translate(0, 0) scale(1)';
      });
    });

    // Initialize animations when page loads
    document.addEventListener('DOMContentLoaded', () => {
      createParticles();

      // Trigger stagger animations
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.style.animationPlayState = 'running';
          }
        });
      });

      document.querySelectorAll('.stagger-item, .timeline-item').forEach(item => {
        observer.observe(item);
      });
    });

    // Add ripple effect to clickable elements
    document.querySelectorAll('.ripple').forEach(element => {
      element.addEventListener('click', function(e) {
        const ripple = document.createElement('span');
        const rect = this.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        const x = e.clientX - rect.left - size / 2;
        const y = e.clientY - rect.top - size / 2;

        ripple.style.width = ripple.style.height = size + 'px';
        ripple.style.left = x + 'px';
        ripple.style.top = y + 'px';
        ripple.classList.add('ripple-effect');

        this.appendChild(ripple);

        setTimeout(() => {
          ripple.remove();
        }, 1000);
      });
    });
  </script>

  <style>
    .ripple-effect {
      position: absolute;
      border-radius: 50%;
      background: rgba(45, 212, 191, 0.6);
      transform: scale(0);
      animation: ripple-animation 1s linear;
      pointer-events: none;
    }

    @keyframes ripple-animation {
      to {
        transform: scale(4);
        opacity: 0;
      }
    }

    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</body>
</html>