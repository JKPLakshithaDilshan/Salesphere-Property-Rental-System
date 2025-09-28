<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>RentSphere | Find Your Perfect Home</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
     <style>
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
        
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: scale(1.1);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
        }
        
        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }
        
        .hero-slide {
            animation: slideIn 1s ease-out;
        }
        
        .animate-fadeInUp {
            animation: fadeInUp 0.8s ease-out;
        }
        
        .animate-fadeInUp-delay {
            animation: fadeInUp 0.8s ease-out 0.3s both;
        }
        
        .animate-fadeInUp-delay-2 {
            animation: fadeInUp 0.8s ease-out 0.6s both;
        }
        
        .animate-float {
            animation: float 3s ease-in-out infinite;
        }
        
        .animate-pulse-custom {
            animation: pulse 2s ease-in-out infinite;
        }
        
        .gradient-overlay {
            background: linear-gradient(135deg, rgba(0,0,0,0.7) 0%, rgba(20,184,166,0.3) 100%);
        }
        
        .glass-effect {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .slide-indicators {
            display: flex;
            gap: 12px;
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 20;
        }
        
        .slide-indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .slide-indicator.active {
            background: #14b8a6;
            transform: scale(1.2);
        }
        
        .nav-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 20;
        }
        
        .nav-arrow:hover {
            background: rgba(20, 184, 166, 0.8);
            transform: translateY(-50%) scale(1.1);
        }
        
        .nav-arrow.prev {
            left: 30px;
        }
        
        .nav-arrow.next {
            right: 30px;
        }
    </style>
     <style>
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes scaleIn {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-8px);
            }
        }
        
        @keyframes glow {
            0%, 100% {
                box-shadow: 0 0 20px rgba(20, 184, 166, 0.3);
            }
            50% {
                box-shadow: 0 0 30px rgba(20, 184, 166, 0.6);
            }
        }
        
        @keyframes shimmer {
            0% {
                background-position: -1000px 0;
            }
            100% {
                background-position: 1000px 0;
            }
        }
        
        .feature-card {
            background: linear-gradient(145deg, rgba(30, 41, 59, 0.8), rgba(15, 23, 42, 0.9));
            backdrop-filter: blur(20px);
            border: 1px solid rgba(148, 163, 184, 0.1);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }
        
        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(20, 184, 166, 0.1), transparent);
            transition: left 0.8s ease;
        }
        
        .feature-card:hover::before {
            left: 100%;
        }
        
        .feature-card:hover {
            transform: translateY(-12px) scale(1.02);
            box-shadow: 
                0 25px 50px rgba(0, 0, 0, 0.3),
                0 0 40px rgba(20, 184, 166, 0.2);
            border-color: rgba(20, 184, 166, 0.3);
        }
        
        .icon-container {
            background: linear-gradient(135deg, rgba(20, 184, 166, 0.1), rgba(59, 130, 246, 0.1));
            border: 2px solid rgba(20, 184, 166, 0.2);
            transition: all 0.4s ease;
        }
        
        .feature-card:hover .icon-container {
            animation: glow 2s ease-in-out infinite;
            transform: scale(1.1) rotate(5deg);
        }
        
        .animate-on-scroll {
            opacity: 0;
            transform: translateY(50px);
            transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .animate-on-scroll.visible {
            opacity: 1;
            transform: translateY(0);
        }
        
        .section-title {
            background: linear-gradient(135deg, #ffffff, #14b8a6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .gradient-bg {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            position: relative;
        }
        
        .gradient-bg::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 30% 50%, rgba(20, 184, 166, 0.05) 0%, transparent 50%),
                        radial-gradient(circle at 70% 50%, rgba(59, 130, 246, 0.05) 0%, transparent 50%);
        }
        
        .stats-badge {
            background: linear-gradient(135deg, rgba(20, 184, 166, 0.1), rgba(59, 130, 246, 0.1));
            backdrop-filter: blur(10px);
            border: 1px solid rgba(20, 184, 166, 0.2);
        }
        
        .pulse-animation {
            animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
        }
        
        @keyframes pulse {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0.7;
            }
        }
        
        .feature-number {
            background: linear-gradient(135deg, #14b8a6, #06b6d4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 800;
        }
    </style>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        * {
            font-family: 'Inter', sans-serif;
        }

        /* Custom animations */
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

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes glow {
            0%, 100% {
                box-shadow: 0 0 20px rgba(45, 212, 191, 0.3);
            }
            50% {
                box-shadow: 0 0 30px rgba(45, 212, 191, 0.6);
            }
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        @keyframes shimmer {
            0% {
                background-position: -200% 0;
            }
            100% {
                background-position: 200% 0;
            }
        }

        .animate-fade-in-up {
            animation: fadeInUp 0.8s ease-out forwards;
        }

        .animate-slide-in {
            animation: slideIn 0.6s ease-out forwards;
        }

        .animate-glow {
            animation: glow 2s ease-in-out infinite;
        }

        .animate-float {
            animation: float 3s ease-in-out infinite;
        }

        .shimmer-effect {
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
            background-size: 200% 100%;
            animation: shimmer 2s infinite;
        }

        .card-hover {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            cursor: pointer;
        }

        .card-hover:hover {
            transform: translateY(-12px) scale(1.02);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
        }

        .card-hover:hover .overlay {
            opacity: 1;
        }

        .overlay {
            background: linear-gradient(135deg, rgba(45, 212, 191, 0.9), rgba(56, 189, 248, 0.9));
            opacity: 0;
            transition: all 0.4s ease;
        }

        .gradient-text {
            background: linear-gradient(135deg, #2dd4bf, #38bdf8, #8b5cf6);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: gradient 3s ease infinite;
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .section-enter {
            opacity: 0;
            transform: translateY(50px);
        }

        .section-enter-active {
            opacity: 1;
            transform: translateY(0);
            transition: all 1s ease-out;
        }

        .stagger-1 { animation-delay: 0.1s; }
        .stagger-2 { animation-delay: 0.2s; }
        .stagger-3 { animation-delay: 0.3s; }
        .stagger-4 { animation-delay: 0.4s; }

        /* Particle background */
        .particles {
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
            width: 4px;
            height: 4px;
            background: rgba(45, 212, 191, 0.5);
            border-radius: 50%;
            animation: particleFloat 15s infinite linear;
        }

        @keyframes particleFloat {
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
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }

        .pulse-ring {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 60px;
            height: 60px;
            border: 2px solid rgba(45, 212, 191, 0.3);
            border-radius: 50%;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                transform: translate(-50%, -50%) scale(0.8);
                opacity: 1;
            }
            100% {
                transform: translate(-50%, -50%) scale(2);
                opacity: 0;
            }
        }
    </style>
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

<main>

 <body class="bg-gray-900">
    <!-- Hero Section -->
    <section class="relative h-screen overflow-hidden">
        <!-- Slideshow Container -->
        <div class="absolute inset-0">
            <!-- Slide 1 -->
            <div class="hero-slide absolute inset-0 opacity-100 transition-opacity duration-1000" id="slide1">
                <img src="https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg" alt="Modern House 1" class="w-full h-full object-cover" />
            </div>
            <!-- Slide 2 -->
            <div class="hero-slide absolute inset-0 opacity-0 transition-opacity duration-1000" id="slide2">
                <img src="https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg" alt="Modern House 2" class="w-full h-full object-cover" />
            </div>
            <!-- Slide 3 -->
            <div class="hero-slide absolute inset-0 opacity-0 transition-opacity duration-1000" id="slide3">
                <img src="https://images.pexels.com/photos/2581922/pexels-photo-2581922.jpeg" alt="Modern House 3" class="w-full h-full object-cover" />
            </div>
            <!-- Slide 4 -->
            <div class="hero-slide absolute inset-0 opacity-0 transition-opacity duration-1000" id="slide4">
                <img src="https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg" alt="Modern House 4" class="w-full h-full object-cover" />
            </div>
            
            <!-- Gradient Overlay -->
            <div class="absolute inset-0 gradient-overlay"></div>
        </div>
        
        <!-- Navigation Arrows -->
        <div class="nav-arrow prev" onclick="changeSlide(-1)">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="m15 18-6-6 6-6"/>
            </svg>
        </div>
        <div class="nav-arrow next" onclick="changeSlide(1)">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="m9 18 6-6-6-6"/>
            </svg>
        </div>
        
        <!-- Content Container - Centered -->
        <div class="relative container mx-auto px-6 h-full flex items-center justify-center">
            <div class="text-white max-w-4xl text-center">
                <!-- Animated Floating Elements -->
                <div class="absolute -top-10 -left-10 w-20 h-20 bg-teal-400 rounded-full opacity-20 animate-float"></div>
                <div class="absolute -bottom-10 -right-10 w-16 h-16 bg-teal-300 rounded-full opacity-30 animate-float" style="animation-delay: 1s;"></div>
                
                <!-- Main Content with Glass Effect -->
                <div class="glass-effect p-8 rounded-2xl">
                    <h1 class="text-6xl md:text-7xl font-bold mb-6 text-teal-400 animate-fadeInUp">
                        Find Your Perfect Rental
                    </h1>
                    <p class="text-xl md:text-2xl mb-10 text-gray-200 animate-fadeInUp-delay leading-relaxed">
                        Smart, secure, and stress-free property rentals with <span class="text-teal-300 font-semibold">SaleSphere</span>
                    </p>
                    <div class="animate-fadeInUp-delay-2">
                        <a href="#properties" class="inline-block bg-gradient-to-r from-teal-500 to-teal-600 hover:from-teal-600 hover:to-teal-700 text-white px-10 py-4 rounded-xl font-semibold transition-all duration-300 transform hover:scale-105 hover:shadow-2xl animate-pulse-custom">
                            Browse Properties
                            <svg class="inline-block ml-2 w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"></path>
                            </svg>
                        </a>
                    </div>
                </div>
                
                <!-- Feature Pills -->
                <div class="flex flex-wrap justify-center gap-4 mt-8 animate-fadeInUp-delay-2">
                    <div class="glass-effect px-6 py-3 rounded-full">
                        <span class="text-sm font-medium text-white">✨ Premium Properties</span>
                    </div>
                    <div class="glass-effect px-6 py-3 rounded-full">
                        <span class="text-sm font-medium text-white">🔒 Secure Booking</span>
                    </div>
                    <div class="glass-effect px-6 py-3 rounded-full">
                        <span class="text-sm font-medium text-white">📱 Smart Features</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Slide Indicators -->
        <div class="slide-indicators">
            <div class="slide-indicator active" onclick="goToSlide(0)"></div>
            <div class="slide-indicator" onclick="goToSlide(1)"></div>
            <div class="slide-indicator" onclick="goToSlide(2)"></div>
            <div class="slide-indicator" onclick="goToSlide(3)"></div>
        </div>
        
        <!-- Scroll Down Indicator -->
        <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
            <div class="w-6 h-10 border-2 border-white rounded-full flex justify-center">
                <div class="w-1 h-3 bg-white rounded-full mt-2 animate-pulse"></div>
            </div>
        </div>
    </section>

    <script>
        let currentSlide = 0;
        const slides = ['slide1', 'slide2', 'slide3', 'slide4'];
        const indicators = document.querySelectorAll('.slide-indicator');
        
        function showSlide(index) {
            // Hide all slides
            slides.forEach((slideId, i) => {
                const slide = document.getElementById(slideId);
                slide.style.opacity = i === index ? '1' : '0';
            });
            
            // Update indicators
            indicators.forEach((indicator, i) => {
                indicator.classList.toggle('active', i === index);
            });
            
            currentSlide = index;
        }
        
        function changeSlide(direction) {
            currentSlide += direction;
            if (currentSlide >= slides.length) currentSlide = 0;
            if (currentSlide < 0) currentSlide = slides.length - 1;
            showSlide(currentSlide);
        }
        
        function goToSlide(index) {
            showSlide(index);
        }
        
        // Auto-play slideshow
        let autoplay = setInterval(() => {
            changeSlide(1);
        }, 5000);
        
        // Pause autoplay on hover
        document.querySelector('section').addEventListener('mouseenter', () => {
            clearInterval(autoplay);
        });
        
        // Resume autoplay when not hovering
        document.querySelector('section').addEventListener('mouseleave', () => {
            autoplay = setInterval(() => {
                changeSlide(1);
            }, 5000);
        });
        
        // Add parallax scrolling effect
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const parallaxElements = document.querySelectorAll('.hero-slide img');
            parallaxElements.forEach(element => {
                element.style.transform = `translateY(${scrolled * 0.5}px)`;
            });
        });
        
        // Add smooth reveal on page load
        window.addEventListener('load', () => {
            document.querySelector('section').style.opacity = '1';
        });
    </script>
<body class="bg-gray-900">
    <!-- Features Section -->
    <section class="py-20 gradient-bg relative">
        <div class="container mx-auto px-6 relative z-10">
            <!-- Section Header -->
            <div class="text-center mb-16 animate-on-scroll">
                <h2 class="text-5xl font-bold mb-4 section-title">
                    Why Choose SaleSphere?
                </h2>
                <p class="text-xl text-slate-400 max-w-2xl mx-auto leading-relaxed">
                    Experience the future of property rentals with our cutting-edge features designed for your peace of mind
                </p>
                <!-- Decorative line -->
                <div class="w-24 h-1 bg-gradient-to-r from-teal-400 to-blue-400 mx-auto mt-6 rounded-full"></div>
            </div>
            
            <!-- Stats Row -->
            <div class="flex justify-center mb-16 animate-on-scroll">
                <div class="flex flex-wrap gap-8 justify-center">
                    <div class="stats-badge px-6 py-3 rounded-full">
                        <span class="feature-number text-2xl">10K+</span>
                        <span class="text-slate-300 ml-2">Properties</span>
                    </div>
                    <div class="stats-badge px-6 py-3 rounded-full">
                        <span class="feature-number text-2xl">50K+</span>
                        <span class="text-slate-300 ml-2">Happy Clients</span>
                    </div>
                    <div class="stats-badge px-6 py-3 rounded-full">
                        <span class="feature-number text-2xl">99.9%</span>
                        <span class="text-slate-300 ml-2">Uptime</span>
                    </div>
                </div>
            </div>
            
            <!-- Features Grid -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <!-- Feature 1 -->
                <div class="feature-card p-8 rounded-2xl animate-on-scroll" style="animation-delay: 0.1s;">
                    <div class="icon-container w-20 h-20 rounded-2xl flex items-center justify-center mx-auto mb-6 relative">
                        <i class="fas fa-home text-4xl text-teal-400"></i>
                        <div class="absolute inset-0 rounded-2xl bg-gradient-to-br from-teal-400/20 to-transparent"></div>
                    </div>
                    <h3 class="text-2xl font-bold mb-4 text-white">Verified Listings</h3>
                    <p class="text-slate-300 leading-relaxed mb-6">
                        Only trusted and landlord-approved properties with comprehensive background checks and quality assurance
                    </p>
                    <div class="flex items-center text-teal-400 font-semibold">
                        <span>Learn More</span>
                        <i class="fas fa-arrow-right ml-2 transition-transform group-hover:translate-x-1"></i>
                    </div>
                </div>
                
                <!-- Feature 2 -->
                <div class="feature-card p-8 rounded-2xl animate-on-scroll" style="animation-delay: 0.3s;">
                    <div class="icon-container w-20 h-20 rounded-2xl flex items-center justify-center mx-auto mb-6 relative">
                        <i class="fas fa-user-shield text-4xl text-blue-400"></i>
                        <div class="absolute inset-0 rounded-2xl bg-gradient-to-br from-blue-400/20 to-transparent"></div>
                    </div>
                    <h3 class="text-2xl font-bold mb-4 text-white">Secure Bookings</h3>
                    <p class="text-slate-300 leading-relaxed mb-6">
                        Your data and reservations are protected with bank-grade encryption and advanced security protocols
                    </p>
                    <div class="flex items-center text-blue-400 font-semibold">
                        <span>Learn More</span>
                        <i class="fas fa-arrow-right ml-2 transition-transform group-hover:translate-x-1"></i>
                    </div>
                </div>
                
                <!-- Feature 3 -->
                <div class="feature-card p-8 rounded-2xl animate-on-scroll" style="animation-delay: 0.5s;">
                    <div class="icon-container w-20 h-20 rounded-2xl flex items-center justify-center mx-auto mb-6 relative">
                        <i class="fas fa-clock text-4xl text-yellow-400"></i>
                        <div class="absolute inset-0 rounded-2xl bg-gradient-to-br from-yellow-400/20 to-transparent"></div>
                    </div>
                    <h3 class="text-2xl font-bold mb-4 text-white">Fast Processing</h3>
                    <p class="text-slate-300 leading-relaxed mb-6">
                        Instant booking confirmations and real-time updates with our lightning-fast processing system
                    </p>
                    <div class="flex items-center text-yellow-400 font-semibold">
                        <span>Learn More</span>
                        <i class="fas fa-arrow-right ml-2 transition-transform group-hover:translate-x-1"></i>
                    </div>
                </div>
            </div>
            
            <!-- Bottom CTA -->
            <div class="text-center mt-16 animate-on-scroll" style="animation-delay: 0.7s;">
                <div class="inline-flex items-center bg-gradient-to-r from-teal-500/10 to-blue-500/10 backdrop-blur-sm border border-teal-500/20 rounded-full px-8 py-4">
                    <div class="w-3 h-3 bg-green-400 rounded-full pulse-animation mr-3"></div>
                    <span class="text-slate-300">All systems operational • 24/7 support available</span>
                </div>
            </div>
        </div>
        
        <!-- Floating Background Elements -->
        <div class="absolute top-20 left-10 w-32 h-32 bg-teal-400/5 rounded-full blur-xl animate-pulse"></div>
        <div class="absolute bottom-20 right-10 w-40 h-40 bg-blue-400/5 rounded-full blur-xl animate-pulse" style="animation-delay: 1s;"></div>
        <div class="absolute top-1/2 left-1/4 w-24 h-24 bg-yellow-400/5 rounded-full blur-xl animate-pulse" style="animation-delay: 2s;"></div>
    </section>

    <script>
        // Intersection Observer for scroll animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, observerOptions);

        // Observe all animated elements
        document.querySelectorAll('.animate-on-scroll').forEach(el => {
            observer.observe(el);
        });

        // Add hover effects for feature cards
        document.querySelectorAll('.feature-card').forEach(card => {
            card.addEventListener('mouseenter', () => {
                card.style.transform = 'translateY(-12px) scale(1.02)';
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'translateY(0) scale(1)';
            });
        });

        // Parallax effect for background elements
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const parallaxElements = document.querySelectorAll('.absolute');
            
            parallaxElements.forEach((element, index) => {
                const speed = 0.1 + (index * 0.05);
                element.style.transform = `translateY(${scrolled * speed}px)`;
            });
        });

        // Add staggered animation delays
        document.querySelectorAll('.feature-card').forEach((card, index) => {
            card.style.animationDelay = `${index * 0.2}s`;
        });
    </script>

  <body class="bg-slate-900">
    <section class="py-20 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 relative overflow-hidden">
        <!-- Animated background particles -->
        <div class="particles">
            <!-- Particles will be generated by JavaScript -->
        </div>
        
        <!-- Animated background elements -->
        <div class="absolute inset-0 opacity-20">
            <div class="absolute top-20 left-20 w-32 h-32 bg-teal-400 rounded-full blur-3xl animate-float"></div>
            <div class="absolute bottom-20 right-20 w-40 h-40 bg-blue-400 rounded-full blur-3xl animate-float" style="animation-delay: -1.5s;"></div>
            <div class="absolute top-1/2 left-1/3 w-24 h-24 bg-purple-400 rounded-full blur-2xl animate-float" style="animation-delay: -3s;"></div>
        </div>

        <div class="container mx-auto px-6 relative z-10">
            <!-- Animated title -->
            <div class="text-center mb-16">
                <h2 class="text-5xl font-bold gradient-text mb-4 section-enter animate-fade-in-up">
                    Exclusive Property Offers
                </h2>
                <div class="w-24 h-1 bg-gradient-to-r from-teal-400 to-blue-400 mx-auto rounded-full animate-glow"></div>
                <p class="text-slate-300 text-lg mt-6 section-enter animate-fade-in-up stagger-1 max-w-2xl mx-auto">
                    Discover unbeatable deals on premium properties with our limited-time offers
                </p>
            </div>

            <!-- Animated cards grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Card 1: Zero Deposit -->
                <div class="card-hover bg-slate-800/80 backdrop-blur-sm rounded-2xl shadow-2xl overflow-hidden border border-slate-700/50 section-enter animate-fade-in-up stagger-2 relative">
                    <div class="relative overflow-hidden">
                        <img src="https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg" 
                             class="w-full h-56 object-cover transition-transform duration-700 hover:scale-110" 
                             alt="Zero Deposit Rental" />
                        <div class="overlay absolute inset-0 flex items-center justify-center">
                            <div class="text-center text-white">
                                <div class="pulse-ring"></div>
                                <div class="text-3xl font-bold">0%</div>
                                <div class="text-sm">DEPOSIT</div>
                            </div>
                        </div>
                        <div class="absolute top-4 left-4 bg-gradient-to-r from-emerald-500 to-teal-500 text-white px-3 py-1 rounded-full text-sm font-semibold animate-pulse">
                            LIMITED TIME
                        </div>
                    </div>
                    <div class="p-8">
                        <h3 class="text-2xl font-bold text-white mb-3 flex items-center">
                            <span class="w-2 h-2 bg-teal-400 rounded-full mr-3 animate-pulse"></span>
                            Zero Deposit Rentals
                        </h3>
                        <p class="text-slate-300 mb-4 leading-relaxed">Move into your dream home without the financial burden of a traditional deposit.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-teal-400 font-semibold">No Deposit Required</span>
                            <button class="bg-gradient-to-r from-teal-500 to-emerald-500 hover:from-teal-600 hover:to-emerald-600 text-white px-4 py-2 rounded-lg transition-all duration-300 hover:shadow-lg">
                                Learn More
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 2: Early Bird -->
                <div class="card-hover bg-slate-800/80 backdrop-blur-sm rounded-2xl shadow-2xl overflow-hidden border border-slate-700/50 section-enter animate-fade-in-up stagger-3 relative">
                    <div class="relative overflow-hidden">
                        <img src="https://images.pexels.com/photos/271743/pexels-photo-271743.jpeg" 
                             class="w-full h-56 object-cover transition-transform duration-700 hover:scale-110" 
                             alt="Early Bird Discount" />
                        <div class="overlay absolute inset-0 flex items-center justify-center">
                            <div class="text-center text-white">
                                <div class="pulse-ring"></div>
                                <div class="text-3xl font-bold">15%</div>
                                <div class="text-sm">OFF</div>
                            </div>
                        </div>
                        <div class="absolute top-4 left-4 bg-gradient-to-r from-blue-500 to-purple-500 text-white px-3 py-1 rounded-full text-sm font-semibold animate-bounce">
                            HOT DEAL
                        </div>
                    </div>
                    <div class="p-8">
                        <h3 class="text-2xl font-bold text-white mb-3 flex items-center">
                            <span class="w-2 h-2 bg-blue-400 rounded-full mr-3 animate-pulse"></span>
                            Early Bird Discounts
                        </h3>
                        <p class="text-slate-300 mb-4 leading-relaxed">Reserve early and save big on your next property rental with exclusive discounts.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-blue-400 font-semibold">Up to 15% Savings</span>
                            <button class="bg-gradient-to-r from-blue-500 to-purple-500 hover:from-blue-600 hover:to-purple-600 text-white px-4 py-2 rounded-lg transition-all duration-300 hover:shadow-lg">
                                Book Now
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 3: Long-Term Stays -->
                <div class="card-hover bg-slate-800/80 backdrop-blur-sm rounded-2xl shadow-2xl overflow-hidden border border-slate-700/50 section-enter animate-fade-in-up stagger-4 relative">
                    <div class="relative overflow-hidden">
                        <img src="https://images.pexels.com/photos/276554/pexels-photo-276554.jpeg" 
                             class="w-full h-56 object-cover transition-transform duration-700 hover:scale-110" 
                             alt="Long-term Stay" />
                        <div class="overlay absolute inset-0 flex items-center justify-center">
                            <div class="text-center text-white">
                                <div class="pulse-ring"></div>
                                <div class="text-3xl font-bold">VIP</div>
                                <div class="text-sm">ACCESS</div>
                            </div>
                        </div>
                        <div class="absolute top-4 left-4 bg-gradient-to-r from-purple-500 to-pink-500 text-white px-3 py-1 rounded-full text-sm font-semibold shimmer-effect">
                            EXCLUSIVE
                        </div>
                    </div>
                    <div class="p-8">
                        <h3 class="text-2xl font-bold text-white mb-3 flex items-center">
                            <span class="w-2 h-2 bg-purple-400 rounded-full mr-3 animate-pulse"></span>
                            Long-Term Stays
                        </h3>
                        <p class="text-slate-300 mb-4 leading-relaxed">Enjoy exclusive benefits and substantial savings with our long-term rental packages.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-purple-400 font-semibold">Premium Benefits</span>
                            <button class="bg-gradient-to-r from-purple-500 to-pink-500 hover:from-purple-600 hover:to-pink-600 text-white px-4 py-2 rounded-lg transition-all duration-300 hover:shadow-lg">
                                Explore
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Call to action -->
            <div class="text-center mt-16">
                <button class="bg-gradient-to-r from-teal-500 via-blue-500 to-purple-500 hover:from-teal-600 hover:via-blue-600 hover:to-purple-600 text-white font-bold py-4 px-8 rounded-2xl text-lg transition-all duration-300 hover:shadow-2xl hover:scale-105 animate-glow">
                    View All Properties
                </button>
            </div>
        </div>
    </section>

    <script>
        // Intersection Observer for scroll animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('section-enter-active');
                }
            });
        }, observerOptions);

        // Observe all elements with section-enter class
        document.querySelectorAll('.section-enter').forEach(el => {
            observer.observe(el);
        });

        // Generate floating particles
        function createParticle() {
            const particle = document.createElement('div');
            particle.classList.add('particle');
            particle.style.left = Math.random() * 100 + '%';
            particle.style.animationDelay = Math.random() * 15 + 's';
            particle.style.animationDuration = (Math.random() * 10 + 10) + 's';
            
            // Random colors for particles
            const colors = ['rgba(45, 212, 191, 0.5)', 'rgba(56, 189, 248, 0.5)', 'rgba(139, 92, 246, 0.5)'];
            particle.style.background = colors[Math.floor(Math.random() * colors.length)];
            
            document.querySelector('.particles').appendChild(particle);
            
            // Remove particle after animation
            setTimeout(() => {
                particle.remove();
            }, 15000);
        }

        // Create particles periodically
        setInterval(createParticle, 2000);

        // Initial particles
        for (let i = 0; i < 5; i++) {
            setTimeout(createParticle, i * 400);
        }

        // Add hover sound effect simulation (visual feedback)
        document.querySelectorAll('.card-hover').forEach(card => {
            card.addEventListener('mouseenter', () => {
                card.style.filter = 'brightness(1.1)';
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.filter = 'brightness(1)';
            });
        });

        // Parallax effect for background elements
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const parallaxElements = document.querySelectorAll('.animate-float');
            
            parallaxElements.forEach((element, index) => {
                const speed = (index + 1) * 0.1;
                element.style.transform = `translateY(${scrolled * speed}px)`;
            });
        });
    </script>

  <!-- Testimonials Section -->
  <c:if test="${not empty topReviews}">
    <section class="py-16 bg-slate-800">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center text-teal-400 mb-12">Tenant Feedback</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <c:forEach var="review" items="${topReviews}">
            <div class="bg-slate-700 p-6 rounded-lg shadow">
              <div class="text-yellow-400 mb-4">
                <c:forEach begin="1" end="${review.rating}">
                  <i class="fas fa-star"></i>
                </c:forEach>
                <c:forEach begin="1" end="${5 - review.rating}">
                  <i class="far fa-star text-yellow-500/50"></i>
                </c:forEach>
              </div>
              <p class="text-slate-300 mb-4">“${review.comment}”</p>
              <p class="font-semibold text-gray-200">– ${review.tenantName}</p>
              <p class="text-sm text-gray-400 mt-1 italic">${review.propertyTitle}</p>
            </div>
          </c:forEach>
        </div>
      </div>
    </section>
  </c:if>

</main>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>

</body>
</html>