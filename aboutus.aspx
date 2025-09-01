<%@ Page Title="About Us" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="SK_AGRO.aboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --glow-color: rgba(46, 139, 87, 0.7);
            --glow-spread: 10px;
        }
        
        /* Hero Section with Parallax and Glow Effect */
        .about-hero {
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.5)), url('../images/agriculture-bg.jpg') no-repeat center center;
            background-size: cover;
            background-attachment: fixed;
            color: white;
            padding: 8rem 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .about-hero::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle at center, var(--glow-color), transparent 70%);
            opacity: 0.3;
            animation: glow-pulse 8s infinite alternate;
            z-index: 0;
        }
        
        .about-hero .container {
            position: relative;
            z-index: 2;
        }
        
        .about-hero h1 {
            font-size: 4rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            text-shadow: 0 0 15px rgba(46, 139, 87, 0.8);
            background: linear-gradient(90deg, #fff, #2e8b57);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: text-glow 3s ease-in-out infinite alternate;
        }
        
        .about-hero p {
            font-size: 1.5rem;
            max-width: 800px;
            margin: 0 auto 3rem;
            text-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        
        /* Animated Gradient Border Card */
        .gradient-card {
            position: relative;
            border-radius: 16px;
            overflow: hidden;
            background: #fff;
            padding: 2px;
            z-index: 1;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .gradient-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                45deg,
                rgba(46, 139, 87, 0.8),
                rgba(255, 165, 0, 0.8),
                rgba(46, 139, 87, 0.8)
            );
            background-size: 200% 200%;
            animation: gradient-shift 6s ease infinite;
            z-index: -1;
        }
        
        .gradient-card .card-content {
            background: #fff;
            border-radius: 14px;
            padding: 2rem;
            height: 100%;
        }
        
        body.dark-mode .gradient-card .card-content {
            background: #2d2d2d;
        }
        
        /* 3D Flip Cards for Team */
        /* Team Card Styles */
        .team-section {
            padding: 5rem 0;
            background-color: #f9f9f9;
        }
    
        .team-card {
            perspective: 1000px;
            height: 100%;
        }
    
        .team-card-inner {
            position: relative;
            width: 100%;
            height: 400px;
            transition: transform 0.8s;
            transform-style: preserve-3d;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
    
        .team-card:hover .team-card-inner {
            transform: rotateY(180deg);
        }
    
        .team-card-front, .team-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
            border-radius: 16px;
            overflow: hidden;
        }
    
        .team-card-front {
            background: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
    
        .team-card-back {
            background: linear-gradient(135deg, #2e8b57, #3a3a3a);
            color: white;
            transform: rotateY(180deg);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
    
        .team-img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 1.5rem;
            border: 4px solid var(--primary-color);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
        }
    
        .team-name {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
    
        .team-position {
            color: var(--primary-color);
            margin-bottom: 1rem;
            font-weight: 500;
        }
    
        /* Dark Mode Adjustments */
        body.dark-mode .team-card-front {
            background: #2d2d2d;
        }
    
        body.dark-mode .team-position {
            color: #4CAF50;
        }
    
        /* Responsive Adjustments */
        @media (max-width: 767.98px) {
            .team-card-inner {
                height: 350px;
            }
        
            .team-card:hover .team-card-inner {
                transform: none;
            }
        
            .team-card-front, .team-card-back {
                position: relative;
                backface-visibility: visible;
                height: auto;
            }
        
            .team-card-back {
                transform: none;
                margin-top: -2rem;
            }
        }
        
        /* Interactive Timeline */
        .timeline {
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .timeline::after {
            content: '';
            position: absolute;
            width: 6px;
            background: linear-gradient(to bottom, var(--primary-color), #f9f9f9);
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -3px;
            border-radius: 10px;
        }
        
        body.dark-mode .timeline::after {
            background: linear-gradient(to bottom, var(--primary-color), #2d2d2d);
        }
        
        .timeline-item {
            padding: 10px 40px;
            position: relative;
            width: 50%;
            box-sizing: border-box;
        }
        
        .timeline-item::after {
            content: '';
            position: absolute;
            width: 25px;
            height: 25px;
            right: -12px;
            background-color: var(--primary-color);
            border: 4px solid #fff;
            top: 15px;
            border-radius: 50%;
            z-index: 1;
        }
        
        .timeline-item:nth-child(odd) {
            left: 0;
        }
        
        .timeline-item:nth-child(even) {
            left: 50%;
        }
        
        .timeline-item:nth-child(even)::after {
            left: -12px;
        }
        
        .timeline-content {
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        
        .timeline-item:hover .timeline-content {
            transform: scale(1.05);
        }
        
        body.dark-mode .timeline-content {
            background: #2d2d2d;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        /* Particle Background for Values */
        .values-section {
            position: relative;
            overflow: hidden;
        }
        
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
        }
        
        .particle {
            position: absolute;
            width: 5px;
            height: 5px;
            background-color: rgba(46, 139, 87, 0.5);
            border-radius: 50%;
            animation: float 15s infinite linear;
        }
        
        /* Animations */
        @keyframes glow-pulse {
            0% { transform: scale(0.8); opacity: 0.3; }
            100% { transform: scale(1.2); opacity: 0.6; }
        }
        
        @keyframes text-glow {
            0% { text-shadow: 0 0 10px rgba(46, 139, 87, 0.5); }
            100% { text-shadow: 0 0 20px rgba(46, 139, 87, 0.9); }
        }
        
        @keyframes gradient-shift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        @keyframes float {
            0% { transform: translateY(0) translateX(0); opacity: 0; }
            50% { opacity: 1; }
            100% { transform: translateY(-1000px) translateX(1000px); opacity: 0; }
        }
        
        /* Responsive Adjustments */
        @media (max-width: 991.98px) {
            .timeline::after {
                left: 31px;
            }
            
            .timeline-item {
                width: 100%;
                padding-left: 70px;
                padding-right: 25px;
            }
            
            .timeline-item::after {
                left: 18px;
            }
            
            .timeline-item:nth-child(even) {
                left: 0;
            }
        }
        
        @media (max-width: 767.98px) {
            .about-hero h1 {
                font-size: 2.5rem;
            }
            
            .about-hero p {
                font-size: 1.1rem;
            }
            
            .team-card-inner {
                transform-style: flat;
            }
            
            .team-card:hover .team-card-inner {
                transform: none;
            }
            
            .team-card-front, .team-card-back {
                position: relative;
                backface-visibility: visible;
            }
            
            .team-card-back {
                transform: none;
                margin-top: -2rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section with Parallax and Glow -->
    <section class="about-hero">
        <div class="container">
            <h1 data-aos="fade-up" data-aos-delay="100">About SK AGRO</h1>
            <p data-aos="fade-up" data-aos-delay="300">
                Revolutionizing agriculture through innovation and sustainability
            </p>
            <div data-aos="fade-up" data-aos-delay="500">
                <asp:LinkButton ID="btnExplore" runat="server" CssClass="btn btn-primary btn-lg" PostBackUrl="~/products.aspx">
                    Explore Our Solutions <i class="fas fa-arrow-right ms-2"></i>
                </asp:LinkButton>
            </div>
        </div>
    </section>

    <!-- Our Story Section with Gradient Border -->
    <section class="about-content-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6" data-aos="fade-right">
                    <div class="gradient-card">
                        <div class="card-content">
                            <img src="img/banner4.jpg" alt="SK AGRO Facilities" class="img-fluid rounded" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-6" data-aos="fade-left">
                    <h2 class="section-title">Our Story</h2>
                    <p class="about-text">
                        Founded in 2010, SK AGRO emerged from a simple vision: to transform agricultural practices through cutting-edge solutions. 
                        What began as a small research facility has grown into a nationally recognized leader in agricultural innovation.
                    </p>
                    <p class="about-text">
                        Our journey has been marked by groundbreaking discoveries in pesticide formulations and sustainable farming techniques. 
                        Today, we serve thousands of farmers across the nation, helping them achieve unprecedented yields while preserving our ecosystem.
                    </p>
                    <div class="mt-4" data-aos="fade-up" data-aos-delay="200">
                        <asp:LinkButton ID="btnLearnMore" runat="server" CssClass="btn btn-outline-primary" PostBackUrl="~/research.aspx">
                            Our Research <i class="fas fa-flask ms-2"></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Interactive Timeline -->
    <section class="mission-section">
        <div class="container">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-lg-8">
                    <h2 class="section-title" data-aos="fade-up">Our Journey</h2>
                    <p class="about-text" data-aos="fade-up" data-aos-delay="100">
                        Milestones that shaped our path to agricultural innovation
                    </p>
                </div>
            </div>
            
            <div class="timeline">
                <div class="timeline-item" data-aos="fade-up">
                    <div class="timeline-content">
                        <h3>2010</h3>
                        <p>Founded as a small research lab focusing on organic pesticides</p>
                    </div>
                </div>
                
                <div class="timeline-item" data-aos="fade-up" data-aos-delay="100">
                    <div class="timeline-content">
                        <h3>2013</h3>
                        <p>Patented our first eco-friendly pesticide formula</p>
                    </div>
                </div>
                
                <div class="timeline-item" data-aos="fade-up" data-aos-delay="200">
                    <div class="timeline-content">
                        <h3>2016</h3>
                        <p>Expanded operations nationwide with distribution centers in 5 states</p>
                    </div>
                </div>
                
                <div class="timeline-item" data-aos="fade-up" data-aos-delay="300">
                    <div class="timeline-content">
                        <h3>2020</h3>
                        <p>Launched our precision agriculture technology division</p>
                    </div>
                </div>
                
                <div class="timeline-item" data-aos="fade-up" data-aos-delay="400">
                    <div class="timeline-content">
                        <h3>2023</h3>
                        <p>Recognized as industry leader in sustainable agricultural solutions</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Core Values with Particle Background -->
    <section class="values-section mission-section">
        <div class="particles" id="particles-js"></div>
        <div class="container" style="position: relative; z-index: 2;">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-lg-8">
                    <h2 class="section-title" data-aos="fade-up">Our Core Values</h2>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="gradient-card">
                        <div class="card-content text-center p-4">
                            <div class="mission-icon">
                                <i class="fas fa-leaf fa-3x"></i>
                            </div>
                            <h3 class="mission-title">Sustainability</h3>
                            <p class="about-text">
                                We develop products that protect crops while minimizing environmental impact, promoting sustainable farming practices for future generations.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="gradient-card">
                        <div class="card-content text-center p-4">
                            <div class="mission-icon">
                                <i class="fas fa-flask fa-3x"></i>
                            </div>
                            <h3 class="mission-title">Innovation</h3>
                            <p class="about-text">
                                Our R&D team continuously develops new formulations and delivery systems to stay at the forefront of agricultural technology.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="gradient-card">
                        <div class="card-content text-center p-4">
                            <div class="mission-icon">
                                <i class="fas fa-hands-helping fa-3x"></i>
                            </div>
                            <h3 class="mission-title">Farmer Support</h3>
                            <p class="about-text">
                                We provide expert advice and support to help farmers choose the right products and application methods for their specific needs.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 3D Team Cards -->
    <section class="team-section">
        <div class="container">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-lg-8">
                    <h2 class="section-title" data-aos="fade-up">Leadership Team</h2>
                    <p class="about-text" data-aos="fade-up" data-aos-delay="100">
                        The visionaries driving our agricultural revolution
                    </p>
                </div>
            </div>
        
            <div class="row">
                <!-- CEO Card -->
                <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="team-card">
                        <div class="team-card-inner">
                            <div class="team-card-front text-center p-4">
                                <img src="images/team1.jpg" alt="Rajesh Patel - CEO" class="team-img" />
                                <h3 class="team-name">Rajesh Patel</h3>
                                <p class="team-position">Founder & CEO</p>
                            </div>
                            <div class="team-card-back p-4">
                                <h4 class="text-white">About Rajesh</h4>
                                <p class="text-white-50">
                                    With over 25 years in agriculture, Rajesh's vision drives our innovation. Holds PhD in Agricultural Science.
                                </p>
                                <div class="mt-3">
                                    <a href="https://linkedin.com" target="_blank" class="btn btn-sm btn-outline-light mr-2">
                                        <i class="fab fa-linkedin"></i> LinkedIn
                                    </a>
                                    <a href="mailto:rajesh@skagro.com" class="btn btn-sm btn-outline-light">
                                        <i class="fas fa-envelope"></i> Email
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
                <!-- CTO Card -->
                <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="team-card">
                        <div class="team-card-inner">
                            <div class="team-card-front text-center p-4">
                                <img src="images/team2.jpg" alt="Aakash Patel - CTO" class="team-img" />
                                <h3 class="team-name">Aakash Patel</h3>
                                <p class="team-position">Chief Technical Officer</p>
                            </div>
                            <div class="team-card-back p-4">
                                <h4 class="text-white">About Aakash</h4>
                                <p class="text-white-50">
                                    Leads our R&D with 15+ patents in pesticide formulations. Former professor at Agricultural University.
                                </p>
                                <div class="mt-3">
                                    <a href="https://linkedin.com" target="_blank" class="btn btn-sm btn-outline-light mr-2">
                                        <i class="fab fa-linkedin"></i> LinkedIn
                                    </a>
                                    <a href="mailto:aakash@skagro.com" class="btn btn-sm btn-outline-light">
                                        <i class="fas fa-envelope"></i> Email
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
                <!-- COO Card -->
                <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="team-card">
                        <div class="team-card-inner">
                            <div class="team-card-front text-center p-4">
                                <img src="images/team3.jpg" alt="Amit Singh - COO" class="team-img" />
                                <h3 class="team-name">Amit Singh</h3>
                                <p class="team-position">Chief Operations Officer</p>
                            </div>
                            <div class="team-card-back p-4">
                                <h4 class="text-white">About Amit</h4>
                                <p class="text-white-50">
                                    Built our nationwide distribution network. Logistics expert with 20 years experience.
                                </p>
                                <div class="mt-3">
                                    <a href="https://linkedin.com" target="_blank" class="btn btn-sm btn-outline-light mr-2">
                                        <i class="fab fa-linkedin"></i> LinkedIn
                                    </a>
                                    <a href="mailto:amit@skagro.com" class="btn btn-sm btn-outline-light">
                                        <i class="fas fa-envelope"></i> Email
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section py-5" style="background: linear-gradient(135deg, #2e8b57, #3a3a3a); color: white;">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3" data-aos="fade-up">
                    <h2 class="counter" data-target="2500">0</h2>
                    <p>Farmers Served</p>
                </div>
                <div class="col-md-3" data-aos="fade-up" data-aos-delay="100">
                    <h2 class="counter" data-target="45">0</h2>
                    <p>Patents Filed</p>
                </div>
                <div class="col-md-3" data-aos="fade-up" data-aos-delay="200">
                    <h2 class="counter" data-target="12">0</h2>
                    <p>States Covered</p>
                </div>
                <div class="col-md-3" data-aos="fade-up" data-aos-delay="300">
                    <h2 class="counter" data-target="98">0</h2>
                    <p>Success Rate</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script>
        // Initialize particle background
        function initParticles() {
            const container = document.getElementById('particles-js');
            const particleCount = 50;

            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.classList.add('particle');

                // Random positioning
                particle.style.left = Math.random() * 100 + '%';
                particle.style.top = Math.random() * 100 + '%';

                // Random size
                const size = Math.random() * 5 + 2;
                particle.style.width = size + 'px';
                particle.style.height = size + 'px';

                // Random animation duration and delay
                const duration = Math.random() * 20 + 10;
                const delay = Math.random() * 5;
                particle.style.animation = `float ${duration}s ${delay}s infinite linear`;

                container.appendChild(particle);
            }
        }

        // Animated counter
        function animateCounters() {
            const counters = document.querySelectorAll('.counter');
            const speed = 200;

            counters.forEach(counter => {
                const target = +counter.getAttribute('data-target');
                const count = +counter.innerText;
                const increment = target / speed;

                if (count < target) {
                    counter.innerText = Math.ceil(count + increment);
                    setTimeout(animateCounters, 1);
                } else {
                    counter.innerText = target;
                }
            });
        }

        // Initialize when page loads
        document.addEventListener('DOMContentLoaded', function () {
            initParticles();

            // Start counters when stats section is in view
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        animateCounters();
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.5 });

            const statsSection = document.querySelector('.stats-section');
            if (statsSection) {
                observer.observe(statsSection);
            }
        });
    </script>
</asp:Content>