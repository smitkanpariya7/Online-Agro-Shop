<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SK_AGRO.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    
        /* Hero Section */
        .hero-section {
            position: relative;
            height: 100vh;
            min-height: 600px;
            width: 100%;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-video {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            object-fit: cover;
            z-index: 1;
            
        }

        .hero-overlay {
            position: relative;
            z-index: 3;
            height: 100%;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 20px;
        }

        .hero-content {
            text-align: center;
            max-width: 900px;
            padding: 0 20px;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 20px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            line-height: 1.2;
        }

        .hero-subtitle {
            font-size: 1.4rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 40px;
            font-weight: 300;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-btn {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 15px 35px;
            font-size: 1.1rem;
            border-radius: 50px;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
        }

        .hero-btn:hover {
            background-color: #218838;
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(40, 167, 69, 0.4);
        }

        .hero-scroll-down {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 10;
            color: white;
            font-size: 1.5rem;
            animation: bounce 2s infinite;
            cursor: pointer;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0) translateX(-50%);
            }
            40% {
                transform: translateY(-20px) translateX(-50%);
            }
            60% {
                transform: translateY(-10px) translateX(-50%);
            }
        }
        
        /* Floating Particles */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 2;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 50%;
            pointer-events: none;
        }
        
        /* Section Common Styles */
        .section {
            padding: 100px 0;
            position: relative;
        }

        .section-title {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            position: relative;
            display: inline-block;
            color: var(--secondary-color);
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 80px;
            height: 5px;
            background-color: var(--primary-color);
            border-radius: 3px;
        }
        
        .section-subtitle {
            color: #666;
            margin-bottom: 3rem;
            font-size: 1.2rem;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .text-center .section-title:after {
            left: 50%;
            transform: translateX(-50%);
        }
        
        /* Category Cards */
        .category-section {
            background-color: #f9fbf8;
            position: relative;
            overflow: hidden;
        }

        .category-section:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path fill="rgba(40, 167, 69, 0.03)" d="M0,0 L100,0 L100,100 Q50,80 0,100"></path></svg>') no-repeat;
            background-size: 100% auto;
            z-index: 0;
        }
        
        .category-card {
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: var(--transition);
            margin-bottom: 2rem;
            background: white;
            border: none;
            position: relative;
            z-index: 1;
        }
        
        .category-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        
        .category-img-container {
            overflow: hidden;
            position: relative;
        }
        
        .category-img {
            height: 250px;
            object-fit: cover;
            width: 100%;
            transition: transform 0.8s ease;
        }

        .category-card:hover .category-img {
            transform: scale(1.1);
        }
        
        .category-body {
            padding: 2rem;
            position: relative;
        }
        
        .category-title {
            font-size: 1.6rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--secondary-color);
        }

        .category-description {
            color: #666;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }
        
        .view-btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
        }
        
        .view-btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
            color: white;
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
        }

        .category-badge {
            position: absolute;
            top: -15px;
            right: 20px;
            background: var(--accent-color);
            color: var(--secondary-color);
            padding: 5px 15px;
            border-radius: 50px;
            font-weight: 700;
            font-size: 0.8rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            z-index: 2;
        }
        
        /* About Section */
        .about-section {
            background: linear-gradient(135deg, #f5fff5, #f0f8ff);
            position: relative;
            overflow: hidden;
        }

        .about-section:before {
            content: '';
            position: absolute;
            bottom: 0;
            right: 0;
            width: 300px;
            height: 300px;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path fill="rgba(40, 167, 69, 0.05)" d="M0,100 L100,100 L100,0 Q50,30 0,0"></path></svg>') no-repeat;
            background-size: cover;
            z-index: 0;
        }
        
        .about-img-container {
            position: relative;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            transform: perspective(1000px) rotateY(-5deg);
            transition: var(--transition);
        }

        .about-img-container:hover {
            transform: perspective(1000px) rotateY(0deg);
        }
        
        .about-img {
            border-radius: 16px;
            height: 100%;
            object-fit: cover;
            width: 100%;
        }
        
        .about-content {
            padding-left: 3rem;
            position: relative;
            z-index: 1;
        }
        
        .about-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 2rem;
            color: var(--secondary-color);
        }
        
        .about-text {
            line-height: 1.8;
            margin-bottom: 1.5rem;
            color: #555;
            font-size: 1.1rem;
        }
        
        .feature-list {
            list-style: none;
            padding: 0;
            margin-bottom: 2rem;
        }
        
        .feature-list li {
            margin-bottom: 1rem;
            position: relative;
            padding-left: 2.5rem;
            font-size: 1.1rem;
            color: #444;
        }
        
        .feature-list li:before {
            content: '\f00c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            left: 0;
            top: 0;
            color: var(--primary-color);
            font-size: 1.2rem;
        }

        .stats-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 2rem;
        }

        .stat-item {
            flex: 1 1 120px;
            text-align: center;
            background: white;
            padding: 20px 15px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .stat-number {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 5px;
            line-height: 1;
        }

        .stat-label {
            font-size: 0.9rem;
            color: #666;
            font-weight: 600;
        }
        
        /* Offers Section Styles */
        .offers-section {
            padding: 80px 0;
            background: linear-gradient(to right, #f3fff3, #f0f7ff);
            position: relative;
            overflow: hidden;
        }

        .offers-section:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 20px;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 10" preserveAspectRatio="none"><path fill="rgba(40, 167, 69, 0.1)" d="M0,0 L100,0 C80,10 50,10 0,0 Z"></path></svg>') no-repeat;
            background-size: 100% 100%;
        }

        .offers-heading {
            font-size: 2.5rem;
            font-weight: 700;
            text-align: center;
            color: var(--secondary-color);
            margin-bottom: 40px;
            position: relative;
            display: inline-block;
        }

        .offers-heading:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background-color: var(--accent-color);
            border-radius: 2px;
        }

        /* Scrollable Wrapper */
        .offers-scroll-wrapper {
            display: flex;
            gap: 25px;
            overflow-x: auto;
            scroll-snap-type: x mandatory;
            padding: 20px 10px;
            -webkit-overflow-scrolling: touch;
            scrollbar-width: none; /* Firefox */
        }

        .offers-scroll-wrapper::-webkit-scrollbar {
            display: none; /* Chrome/Safari */
        }

        .offer-box {
            flex: 0 0 320px;
            padding: 25px;
            border-radius: 16px;
            color: #fff;
            scroll-snap-align: start;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .offer-box:before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, rgba(255,255,255,0) 70%);
            transform: rotate(30deg);
            z-index: -1;
            transition: all 0.6s ease;
        }

        .offer-box:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .offer-box:hover:before {
            transform: rotate(30deg) translate(20px, 20px);
        }

        .offer-left {
            max-width: 60%;
        }

        .offer-amount {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 5px;
            text-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .offer-note {
            font-size: 1rem;
            opacity: 0.9;
            line-height: 1.4;
        }

        .offer-code {
            text-align: center;
            background: rgba(255,255,255,0.2);
            border-radius: 12px;
            padding: 15px;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255,255,255,0.3);
            transition: var(--transition);
        }

        .offer-box:hover .offer-code {
            transform: scale(1.05);
            background: rgba(255,255,255,0.3);
        }

        .coupon-label {
            font-size: 0.8rem;
            text-transform: uppercase;
            opacity: 0.8;
            letter-spacing: 1px;
            margin-bottom: 5px;
            display: block;
        }

        .coupon-value {
            font-size: 1.3rem;
            font-weight: bold;
            color: #fff;
            letter-spacing: 1px;
        }

        /* Gradient Variants */
        .gradient-yellow-purple {
            background: linear-gradient(135deg, #FFD700, #9932CC);
        }

        .gradient-green-blue {
            background: linear-gradient(135deg, #3CB371, #4682B4);
        }

        .gradient-orange-red {
            background: linear-gradient(135deg, #FF8C00, #FF4500);
        }

        .gradient-purple-cyan {
            background: linear-gradient(135deg, #9370DB, #00BFFF);
        }

        /* Ribbon for Special Offers */
        .ribbon {
            position: absolute;
            top: 10px;
            right: -30px;
            width: 120px;
            height: 30px;
            background: var(--accent-color);
            color: var(--secondary-color);
            text-align: center;
            line-height: 30px;
            font-weight: bold;
            font-size: 0.8rem;
            transform: rotate(45deg);
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
            z-index: 2;
        }

        /* Testimonials */
        .testimonial-section {
            background: linear-gradient(135deg, rgba(46, 139, 87, 0.03), rgba(46, 139, 87, 0.01));
            position: relative;
            overflow: hidden;
        }

        .testimonial-section:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path fill="rgba(40, 167, 69, 0.03)" d="M0,100 L50,0 L100,100 Z"></path></svg>') no-repeat;
            background-size: 100% auto;
            opacity: 0.2;
            z-index: 0;
        }
        
        .testimonial-card {
            background: white;
            border-radius: 16px;
            padding: 2.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            margin: 1rem;
            transition: var(--transition);
            position: relative;
            z-index: 1;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        .testimonial-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
        }
        
        .testimonial-text {
            font-style: italic;
            margin-bottom: 2rem;
            position: relative;
            font-size: 1.1rem;
            line-height: 1.8;
            color: #555;
            flex-grow: 1;
        }
        
        .testimonial-text:before {
            content: '\f10d';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            left: -1.5rem;
            top: -0.5rem;
            color: rgba(46, 139, 87, 0.1);
            font-size: 4rem;
            z-index: -1;
            opacity: 0.5;
        }
        
        .testimonial-author {
            display: flex;
            align-items: center;
            margin-top: auto;
        }
        
        .author-img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 1.5rem;
            border: 3px solid var(--primary-color);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .author-name {
            font-weight: 700;
            margin-bottom: 0.25rem;
            color: var(--secondary-color);
            font-size: 1.1rem;
        }
        
        .author-title {
            color: #777;
            font-size: 0.9rem;
        }

        .rating {
            color: var(--accent-color);
            margin-top: 5px;
            font-size: 0.9rem;
        }

        /* Partnership Section */
        .partnership-section {
            background: linear-gradient(to bottom right, #f7faff, #e5fff7);
            position: relative;
            overflow: hidden;
            padding: 100px 0;
        }

        .partnership-section:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path fill="rgba(40, 167, 69, 0.03)" d="M0,0 L100,0 L100,100 Q50,80 0,100"></path></svg>') no-repeat;
            background-size: 100% auto;
            z-index: 0;
        }

        .section-title {
            position: relative;
            z-index: 1;
        }

        .partners-scroll-container {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            scroll-snap-type: x mandatory;
            padding: 30px 0;
            position: relative;
        }

        .partners-scroll-container:before,
        .partners-scroll-container:after {
            content: '';
            position: absolute;
            top: 0;
            bottom: 0;
            width: 60px;
            z-index: 2;
            pointer-events: none;
        }

        .partners-scroll-container:before {
            left: 0;
            background: linear-gradient(to right, rgba(247, 250, 255, 1), rgba(247, 250, 255, 0));
        }

        .partners-scroll-container:after {
            right: 0;
            background: linear-gradient(to left, rgba(247, 250, 255, 1), rgba(247, 250, 255, 0));
        }

        .partners-scroll-wrapper {
            display: flex;
            gap: 30px;
            min-width: max-content;
            padding: 20px 60px;
        }

        .partner-item {
            scroll-snap-align: center;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 25px;
            flex: 0 0 auto;
            min-width: 180px;
            max-width: 200px;
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .partner-item:hover {
            transform: translateY(-8px) scale(1.05);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
        }

        .partner-item img {
            max-height: 70px;
            max-width: 100%;
            object-fit: contain;
            transition: all 0.4s ease;
            filter: grayscale(0.3) contrast(0.9);
            opacity: 0.8;
        }

        .partner-item:hover img {
            filter: grayscale(0) contrast(1);
            opacity: 1;
        }

        .btn-become-partner {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 1.1rem;
            border-radius: 50px;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 8px 25px rgba(40, 167, 69, 0.3);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn-become-partner:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, var(--primary-color), #32CD32);
            z-index: -1;
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        .btn-become-partner:hover {
            background: var(--primary-color);
            box-shadow: 0 12px 30px rgba(40, 167, 69, 0.4);
            transform: translateY(-3px);
        }

        .btn-become-partner:hover:before {
            opacity: 1;
        }

        /* Benefits Section */
        .benefits-section {
            background-color: #f3fbe9;
            padding: 80px 0;
            position: relative;
            overflow: hidden;
        }

        .benefits-section:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path fill="rgba(40, 167, 69, 0.03)" d="M0,0 L100,0 L100,100 Q50,80 0,100"></path></svg>') no-repeat;
            background-size: 100% auto;
            z-index: 0;
        }

        .benefits-wrapper {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            position: relative;
            z-index: 1;
        }

        .benefit-item {
            flex: 1 1 220px;
            max-width: 240px;
            padding: 30px 25px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            transition: var(--transition);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .benefit-item:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--primary-color);
        }

        .benefit-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.12);
        }

        .benefit-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
            transition: transform 0.4s ease;
        }

        .benefit-item:hover .benefit-icon {
            transform: scale(1.2);
        }

        .benefit-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin: 0 0 10px;
        }

        .benefit-description {
            font-size: 0.95rem;
            color: #666;
            line-height: 1.6;
        }

        /* Gallery Section */
        .gallery-section {
            padding: 100px 0;
            background: #f8fff7;
            position: relative;
            overflow: hidden;
            text-align: center;
        }

        .gallery-section:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 20px;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 10" preserveAspectRatio="none"><path fill="rgba(40, 167, 69, 0.1)" d="M0,0 L100,0 C80,10 50,10 0,0 Z"></path></svg>') no-repeat;
            background-size: 100% 100%;
        }

        .gallery-title {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--secondary-color);
            position: relative;
        }

        .gallery-subtitle {
            font-size: 1.2rem;
            color: #666;
            max-width: 700px;
            margin: 0 auto 50px;
            line-height: 1.6;
        }

        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            padding: 0 20px;
        }

        .gallery-item {
            overflow: hidden;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: var(--transition);
            position: relative;
            aspect-ratio: 4/3;
        }

        .gallery-item:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            opacity: 0;
            transition: opacity 0.4s ease;
            z-index: 1;
        }

        .gallery-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .gallery-item:hover:before {
            opacity: 1;
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .gallery-item:hover img {
            transform: scale(1.1);
        }

        .gallery-caption {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            padding: 20px;
            color: white;
            text-align: left;
            z-index: 2;
            transform: translateY(100%);
            transition: transform 0.4s ease;
            opacity: 0;
        }

        .gallery-item:hover .gallery-caption {
            transform: translateY(0);
            opacity: 1;
        }

        .gallery-caption h4 {
            font-size: 1.3rem;
            margin-bottom: 5px;
            font-weight: 700;
        }

        .gallery-caption p {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        /* CTA Section */
        .cta-section {
            padding: 100px 0;
            background: linear-gradient(135deg, var(--primary-color), #1e7e34);
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .cta-section:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path fill="rgba(255,255,255,0.05)" d="M0,0 L100,0 L100,100 Q50,80 0,100"></path></svg>') no-repeat;
            background-size: 100% auto;
        }

        .cta-title {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .cta-subtitle {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 40px;
            opacity: 0.9;
        }

        .cta-btn {
            background: white;
            color: var(--primary-color);
            border: none;
            padding: 15px 40px;
            font-size: 1.1rem;
            border-radius: 50px;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .cta-btn:hover {
            background: rgba(255, 255, 255, 0.9);
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
            color: var(--primary-color);
        }

        /* Newsletter Section */
        .newsletter-section {
            padding: 80px 0;
            background: #f5f5f5;
            text-align: center;
        }

        .newsletter-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            position: relative;
            overflow: hidden;
        }

        .newsletter-container:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
        }

        .newsletter-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--secondary-color);
        }

        .newsletter-subtitle {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .newsletter-form {
            display: flex;
            max-width: 500px;
            margin: 0 auto;
        }

        .newsletter-input {
            flex: 1;
            padding: 15px 20px;
            border: 1px solid #ddd;
            border-radius: 50px 0 0 50px;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .newsletter-input:focus {
            border-color: var(--primary-color);
        }

        .newsletter-btn {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 0 30px;
            border-radius: 0 50px 50px 0;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
        }

        .newsletter-btn:hover {
            background: #218838;
        }

        /* Animation Classes */
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

        .fade-in-up {
            animation: fadeInUp 0.8s ease forwards;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-15px);
            }
        }

        .float-animation {
            animation: float 4s ease-in-out infinite;
        }

        /* Dark Mode Adjustments */
        body.dark-mode {
            background-color: #121212;
            color: #e0e0e0;
        }

        body.dark-mode .category-card,
        body.dark-mode .testimonial-card,
        body.dark-mode .benefit-item,
        body.dark-mode .newsletter-container,
        body.dark-mode .partner-item {
            background-color: #2d2d2d;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            color: #e0e0e0;
        }

        body.dark-mode .category-title,
        body.dark-mode .about-title,
        body.dark-mode .section-title,
        body.dark-mode .testimonial-text,
        body.dark-mode .gallery-title,
        body.dark-mode .author-name,
        body.dark-mode .benefit-title,
        body.dark-mode .newsletter-title {
            color: #f1f1f1;
        }

        body.dark-mode .section-subtitle,
        body.dark-mode .about-text,
        body.dark-mode .author-title,
        body.dark-mode .gallery-subtitle,
        body.dark-mode .benefit-description,
        body.dark-mode .newsletter-subtitle {
            color: #aaa;
        }

        body.dark-mode .about-section,
        body.dark-mode .benefits-section,
        body.dark-mode .newsletter-section {
            background-color: #1a1a1a;
        }

        body.dark-mode .category-section {
            background-color: #121212;
        }

        body.dark-mode .testimonial-section {
            background: linear-gradient(135deg, rgba(46, 139, 87, 0.05), rgba(46, 139, 87, 0.02));
        }

        body.dark-mode .partnership-section {
            background: linear-gradient(to bottom right, #1a1a2e, #16213e);
        }

        body.dark-mode .gallery-section {
            background: #121212;
        }

        body.dark-mode .cta-section {
            background: linear-gradient(135deg, #1a3a1a, #0e5a0e);
        }

        body.dark-mode .newsletter-input {
            background-color: #3d3d3d;
            border-color: #444;
            color: #f1f1f1;
        }

        /* Responsive Adjustments */
        @media (max-width: 1199.98px) {
            .section {
                padding: 80px 0;
            }
            
            .hero-title {
                font-size: 3rem;
            }
            
            .section-title {
                font-size: 2.5rem;
            }
        }

        @media (max-width: 991.98px) {
            .section {
                padding: 70px 0;
            }
            
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.2rem;
            }
            
            .about-content {
                padding-left: 0;
                margin-top: 3rem;
            }
            
            .about-img {
                height: 400px;
            }
            
            .section-title {
                font-size: 2.2rem;
            }
            
            .category-title {
                font-size: 1.4rem;
            }
        }
        
        @media (max-width: 767.98px) {
            .section {
                padding: 60px 0;
            }
            
            .hero-section {
                height: auto;
                min-height: 100vh;
                padding: 100px 0;
                text-align: center;
            }
            
            .hero-title {
                font-size: 2.2rem;
            }
            
            .hero-subtitle {
                font-size: 1.1rem;
                margin-left: auto;
                margin-right: auto;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .testimonial-card {
                margin: 1rem 0;
            }
            
            .partner-item {
                width: 150px;
                height: 100px;
            }
            
            .newsletter-form {
                flex-direction: column;
            }
            
            .newsletter-input {
                border-radius: 50px;
                margin-bottom: 10px;
            }
            
            .newsletter-btn {
                border-radius: 50px;
                padding: 15px;
            }
            
            .gallery-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 575.98px) {
            .section {
                padding: 50px 0;
            }
            
            .hero-title {
                font-size: 1.8rem;
            }
            
            .hero-btn {
                padding: 12px 25px;
                font-size: 1rem;
            }
            
            .section-title {
                font-size: 1.8rem;
            }
            
            .section-title:after {
                height: 3px;
                width: 50px;
                bottom: -8px;
            }
            
            .about-title {
                font-size: 1.8rem;
            }
            
            .feature-list li {
                font-size: 1rem;
            }
            
            .offer-box {
                flex: 0 0 85%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class="hero-section">
        <!-- Background Video -->
        <video class="hero-video" autoplay muted loop playsinline>
            <source src="images/Brown Modern Agriculture Video.mp4" type="video/mp4" />
            Your browser does not support HTML5 video.
        </video>

        <!-- Floating Particles -->
        <div class="particles" id="particles-js"></div>

        <!-- Overlay Content -->
        <div class="hero-overlay">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-10 mx-auto text-center hero-content">
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="hero-scroll-down" onclick="scrollToNextSection()">
            <i class="fas fa-chevron-down"></i>
        </div>
    </section>


    <!-- Categories Section -->
    <section class="section category-section" id="categories">
        <div class="container">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-lg-8" data-aos="fade-up">
                    <h2 class="section-title">Our Product Categories</h2>
                    <p class="section-subtitle">
                        High-quality agricultural products to boost your farming productivity
                    </p>
                </div>
            </div>
            
            <div class="row">
                <asp:Repeater ID="eventsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay='<%# Container.ItemIndex * 100 %>'>
                            <div class="category-card">
                                <div class="category-badge">Popular</div>
                                <div class="category-img-container">
                                    <img src='<%# ResolveUrl("~/admin/img/") + Eval("c_image") %>' class="category-img" alt='<%# Eval("c_name") %>' />
                                </div>
                                <div class="category-body">
                                    <asp:Label ID="cat_id" runat="server" Text='<%# Eval("c_id") %>' Visible="false"></asp:Label>
                                    <h3 class="category-title"><%# Eval("c_name") %></h3>
                                    <p class="category-description">High-quality products for effective <%# Eval("c_name") %> management and improved crop yield.</p>
                                    <asp:LinkButton ID="crdproduct" runat="server" CssClass="view-btn" OnClick="crdproduct_Click1">
                                        View Products <i class="fas fa-arrow-right ms-2"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="section about-section" id="about">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6" data-aos="fade-right">
                    <div class="about-img-container">
                        <img src="img/banner4.jpg" alt="About SK AGRO" class="about-img img-fluid" />
                    </div>
                </div>
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="about-content">
                        <h2 class="about-title">About SK AGRO</h2>
                        <p class="about-text">
                            "Protecting your crops, protecting your future – with SK AGRO."
                        </p>
                        <p class="about-text">
                            We are a leading provider of high-quality agricultural products and solutions, helping farmers 
                            achieve better yields through sustainable farming practices. With over 15 years of experience 
                            in the industry, we've built a reputation for excellence and reliability.
                        </p>
                        <ul class="feature-list">
                            <li>Premium quality pesticides and fertilizers</li>
                            <li>Expert advice and agricultural solutions</li>
                            <li>Environmentally friendly products</li>
                            <li>Nationwide delivery and support</li>
                            <li>Certified and tested products</li>
                        </ul>

                        <div class="stats-container">
                            <div class="stat-item" data-aos="zoom-in" data-aos-delay="100">
                                <div class="stat-number">15+</div>
                                <div class="stat-label">Years Experience</div>
                            </div>
                            <div class="stat-item" data-aos="zoom-in" data-aos-delay="200">
                                <div class="stat-number">500+</div>
                                <div class="stat-label">Products</div>
                            </div>
                            <div class="stat-item" data-aos="zoom-in" data-aos-delay="300">
                                <div class="stat-number">10K+</div>
                                <div class="stat-label">Happy Farmers</div>
                            </div>
                        </div>

                        <asp:LinkButton ID="btnLearnMore" runat="server" CssClass="view-btn mt-4" PostBackUrl="~/aboutus.aspx" data-aos="fade-up" data-aos-delay="400">
                            Learn More <i class="fas fa-arrow-right ms-2"></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Offers Section -->
    <section class="section offers-section" id="offers">
        <div class="container">
            <h2 class="offers-heading" data-aos="fade-right">🔥 Today's Special Offers</h2>

            <div class="offers-scroll-wrapper">
                <!-- Offer Card -->
                <div class="offer-box gradient-yellow-purple" data-aos="fade-up" data-aos-delay="100">
                    <div class="offer-left">
                        <p class="offer-amount">Get <strong>₹50 OFF</strong></p>
                        <p class="offer-note">On your first order<br />through our mobile app</p>
                    </div>
                    <div class="offer-code">
                        <span class="coupon-label">Coupon Code</span>
                        <div class="coupon-value">APP50</div>
                    </div>
                    <div class="ribbon">Limited Time</div>
                </div>

                <div class="offer-box gradient-green-blue" data-aos="fade-up" data-aos-delay="200">
                    <div class="offer-left">
                        <p class="offer-amount">Flat <strong>10% OFF</strong></p>
                        <p class="offer-note">On all pesticide products<br />Above ₹499</p>
                    </div>
                    <div class="offer-code">
                        <span class="coupon-label">Use Code</span>
                        <div class="coupon-value">PEST10</div>
                    </div>
                </div>

                <div class="offer-box gradient-orange-red" data-aos="fade-up" data-aos-delay="300">
                    <div class="offer-left">
                        <p class="offer-amount">Save <strong>₹100</strong></p>
                        <p class="offer-note">On fertilizers<br />Min. order ₹799</p>
                    </div>
                    <div class="offer-code">
                        <span class="coupon-label">Code</span>
                        <div class="coupon-value">FERT100</div>
                    </div>
                </div>

                <div class="offer-box gradient-purple-cyan" data-aos="fade-up" data-aos-delay="400">
                    <div class="offer-left">
                        <p class="offer-amount">Get <strong>15% OFF</strong></p>
                        <p class="offer-note">On herbicides<br />Min. order ₹999</p>
                    </div>
                    <div class="offer-code">
                        <span class="coupon-label">Coupon</span>
                        <div class="coupon-value">HERB15</div>
                    </div>
                    <div class="ribbon">Popular</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="section testimonial-section" id="testimonials">
        <div class="container">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-lg-8" data-aos="fade-up">
                    <h2 class="section-title">What Our Customers Say</h2>
                    <p class="section-subtitle">
                        Trusted by farmers and agricultural professionals nationwide
                    </p>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4" data-aos="fade-up">
                    <div class="testimonial-card">
                        <p class="testimonial-text">
                            The products from SK AGRO have transformed my farm's productivity. Their pesticides are effective and environmentally friendly. I've seen a 30% increase in yield since switching to their solutions.
                        </p>
                        <div class="testimonial-author">
                            <img src="images/team1.jpg" alt="Rajesh Patel" class="author-img" />
                            <div>
                                <h5 class="author-name">Rajesh Patel</h5>
                                <p class="author-title">Farm Owner, Gujarat</p>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="testimonial-card">
                        <p class="testimonial-text">
                            Excellent customer service and high-quality products. My crops have never been healthier since I started using SK AGRO solutions. Their technical support team is always available for advice.
                        </p>
                        <div class="testimonial-author">
                            <img src="images/team2.jpg" alt="Aakash Patel" class="author-img" />
                            <div>
                                <h5 class="author-name">Aakash Patel</h5>
                                <p class="author-title">Agricultural Consultant</p>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="testimonial-card">
                        <p class="testimonial-text">
                            The user-friendly website makes it easy to order products even from remote areas. Delivery is always on time and products are well-packaged. Highly recommended for all farmers!
                        </p>
                        <div class="testimonial-author">
                            <img src="images/team3.jpg" alt="Amit Singh" class="author-img" />
                            <div>
                                <h5 class="author-name">Amit Singh</h5>
                                <p class="author-title">Customer</p>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Partnerships Section -->
    <section class="section partnership-section" id="partners">
        <div class="container">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-lg-10" data-aos="fade-up">
                    <h2 class="section-title">Our Trusted Partners</h2>
                    <p class="section-subtitle">
                        Collaborating with global leaders to innovate agriculture and sustainability
                    </p>
                </div>
            </div>

            <!-- Scrollable Partner Logos -->
            <div class="partners-scroll-container" data-aos="fade-up" data-aos-delay="150">
                <div class="partners-scroll-wrapper">
                    <%-- Repeat partner-item for each logo --%>
                    <div class="partner-item"><img src="images/partner1.png" alt="Partner 1" /></div>
                    <div class="partner-item"><img src="images/partner2.png" alt="Partner 2" /></div>
                    <div class="partner-item"><img src="images/partner3.png" alt="Partner 3" /></div>
                    <div class="partner-item"><img src="images/partner4.png" alt="Partner 4" /></div>
                    <div class="partner-item"><img src="images/partner5.png" alt="Partner 5" /></div>
                    <%--<div class="partner-item"><img src="images/partner6.png" alt="Partner 6" /></div>
                    <div class="partner-item"><img src="images/partner7.png" alt="Partner 7" /></div>
                    <div class="partner-item"><img src="images/partner8.png" alt="Partner 8" /></div>--%>
                   
                </div>
            </div>

            <!-- Call to Action -->
            <div class="row mt-5">
                <div class="col-12 text-center" data-aos="fade-up" data-aos-delay="200">
                    <asp:LinkButton ID="btnBecomePartner" runat="server" CssClass="btn-become-partner" PostBackUrl="~/contactus.aspx">
                        Become a Partner <i class="fas fa-handshake ms-2"></i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </section>

    <!-- Benefits Section -->
    <section class="section benefits-section" id="benefits">
        <div class="container">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-lg-8" data-aos="fade-up">
                    <h2 class="section-title">Why Choose SK AGRO?</h2>
                    <p class="section-subtitle">
                        We provide the best agricultural solutions with unmatched benefits
                    </p>
                </div>
            </div>

            <div class="benefits-wrapper">
                <div class="benefit-item" data-aos="fade-up" data-aos-delay="100">
                    <div class="benefit-icon">
                        <i class="fas fa-tag"></i>
                    </div>
                    <h4 class="benefit-title">100% Branded Products</h4>
                    <p class="benefit-description">Only genuine and certified products from trusted brands</p>
                </div>
                
                <div class="benefit-item" data-aos="fade-up" data-aos-delay="200">
                    <div class="benefit-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <h4 class="benefit-title">Quality Assurance</h4>
                    <p class="benefit-description">Rigorous quality checks for all our agricultural products</p>
                </div>
                
                <div class="benefit-item" data-aos="fade-up" data-aos-delay="300">
                    <div class="benefit-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h4 class="benefit-title">Safe & Secure</h4>
                    <p class="benefit-description">Secure payments and data protection guaranteed</p>
                </div>
                
                <div class="benefit-item" data-aos="fade-up" data-aos-delay="400">
                    <div class="benefit-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h4 class="benefit-title">Expert Advice</h4>
                    <p class="benefit-description">24/7 support from agricultural specialists</p>
                </div>
                
                <div class="benefit-item" data-aos="fade-up" data-aos-delay="500">
                    <div class="benefit-icon">
                        <i class="fas fa-handshake"></i>
                    </div>
                    <h4 class="benefit-title">Best Price Guarantee</h4>
                    <p class="benefit-description">Competitive prices with regular discounts</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Gallery Section -->
    <section class="section gallery-section" id="gallery">
        <div class="container">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-lg-8" data-aos="fade-up">
                    <h2 class="gallery-title">Our Agricultural Products</h2>
                    <p class="gallery-subtitle">
                        Explore our wide range of premium quality agricultural solutions
                    </p>
                </div>
            </div>

            <div class="gallery-grid">
                <!-- Repeat for each image -->
                <div class="gallery-item" data-aos="zoom-in">
                    <img src="img/banner1.jpg" alt="Agricultural Product 1" />
                    <div class="gallery-caption">
                        <h4>Pesticides</h4>
                        <p>Effective solutions for pest control</p>
                    </div>
                </div>
                <div class="gallery-item" data-aos="zoom-in" data-aos-delay="100">
                    <img src="img/banner3.jpg" alt="Agricultural Product 2" />
                    <div class="gallery-caption">
                        <h4>Fertilizers</h4>
                        <p>Nutrient-rich formulas for growth</p>
                    </div>
                </div>
                <div class="gallery-item" data-aos="zoom-in" data-aos-delay="200">
                    <img src="img/banner5.jpg" alt="Agricultural Product 3" />
                    <div class="gallery-caption">
                        <h4>Herbicides</h4>
                        <p>Weed control solutions</p>
                    </div>
                </div>
                <div class="gallery-item" data-aos="zoom-in" data-aos-delay="300">
                    <img src="img/banner6.jpg" alt="Agricultural Product 4" />
                    <div class="gallery-caption">
                        <h4>Seeds</h4>
                        <p>High-yield certified seeds</p>
                    </div>
                </div>
                <div class="gallery-item" data-aos="zoom-in" data-aos-delay="400">
                    <img src="img/daily1.jpg" alt="Agricultural Product 5" />
                    <div class="gallery-caption">
                        <h4>Equipment</h4>
                        <p>Modern farming tools</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="section cta-section" id="cta">
        <div class="container">
            <div class="row justify-content-center text-center">
                <div class="col-lg-8" data-aos="fade-up">
                    <h2 class="cta-title">Ready to Transform Your Farming?</h2>
                    <p class="cta-subtitle">
                        Join thousands of farmers who trust SK AGRO for their agricultural needs. Get started today and experience the difference in quality and service.
                    </p>
                    <asp:LinkButton ID="btnShopNow" runat="server" CssClass="cta-btn" PostBackUrl="~/products.aspx" data-aos="fade-up" data-aos-delay="100">
                        Shop Now <i class="fas fa-arrow-right ms-2"></i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </section>

    

    <script>
        // Function to scroll to next section
        function scrollToNextSection() {
            const nextSection = document.getElementById('categories');
            nextSection.scrollIntoView({ behavior: 'smooth' });
        }

        // Create floating particles for hero section
        document.addEventListener('DOMContentLoaded', function() {
            const particlesContainer = document.querySelector('.particles');
            const particleCount = 30;
            
            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.classList.add('particle');
                
                // Random size between 2px and 6px
                const size = Math.random() * 4 + 2;
                particle.style.width = `${size}px`;
                particle.style.height = `${size}px`;
                
                // Random position
                particle.style.left = `${Math.random() * 100}%`;
                particle.style.top = `${Math.random() * 100}%`;
                
                // Random opacity
                particle.style.opacity = Math.random() * 0.5 + 0.1;
                
                // Random animation duration and delay
                const duration = Math.random() * 20 + 10;
                const delay = Math.random() * 5;
                particle.style.animation = `float ${duration}s ease-in-out ${delay}s infinite`;
                
                particlesContainer.appendChild(particle);
            }
        });

        // Initialize AOS (Animate On Scroll) library
        // Make sure to include AOS library in your project
        if (typeof AOS !== 'undefined') {
            AOS.init({
                duration: 800,
                easing: 'ease-in-out',
                once: true,
                mirror: false
            });
        }
    </script>
</asp:Content>