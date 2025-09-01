<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/admin/MasterPage1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="SK_AGRO.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 & Font Awesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    
    <!-- Chart.js for analytics -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- AOS Animation Library -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #2b5876 0%, #4e4376 100%);
            --success-gradient: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            --warning-gradient: linear-gradient(135deg, #f7971e 0%, #ffd200 100%);
            --danger-gradient: linear-gradient(135deg, #ff416c 0%, #ff4b2b 100%);
            --info-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --dark-gradient: linear-gradient(135deg, #434343 0%, #000000 100%);
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .dashboard-header {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            border-radius: 16px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .dashboard-card {
            position: relative;
            overflow: hidden;
            border: none;
            border-radius: 16px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            background: white;
            height: 100%;
            display: flex;
            flex-direction: column;
            z-index: 1;
        }
        
        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--primary-gradient);
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: -1;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .dashboard-card:hover::before {
            opacity: 1;
        }
        
        .dashboard-card:hover .dashboard-count,
        .dashboard-card:hover .dashboard-label,
        .dashboard-card:hover .dashboard-icon {
            color: white !important;
        }
        
        .dashboard-card-primary::before {
            background: var(--primary-gradient);
        }
        
        .dashboard-card-warning::before {
            background: var(--warning-gradient);
        }
        
        .dashboard-card-info::before {
            background: var(--info-gradient);
        }
        
        .dashboard-card-success::before {
            background: var(--success-gradient);
        }
        
        .dashboard-card-secondary::before {
            background: var(--secondary-gradient);
        }
        
        .dashboard-card-danger::before {
            background: var(--danger-gradient);
        }
        
        .dashboard-card-dark::before {
            background: var(--dark-gradient);
        }
        
        .dashboard-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #6c757d;
            transition: all 0.3s ease;
        }
        
        .dashboard-count {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            transition: all 0.3s ease;
        }
        
        .dashboard-label {
            font-size: 1rem;
            color: #6c757d;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        
        .dashboard-footer {
            margin-top: auto;
            padding: 0.75rem 1rem;
            background: rgba(0, 0, 0, 0.03);
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            color: #6c757d;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: all 0.3s ease;
        }
        
        .dashboard-card:hover .dashboard-footer {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .dashboard-footer i {
            transition: transform 0.3s ease;
        }
        
        .dashboard-card:hover .dashboard-footer i {
            transform: translateX(5px);
        }
        
        .analytics-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            height: 100%;
        }
        
        .recent-activity {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .recent-activity li {
            padding: 0.75rem 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
        }
        
        .recent-activity li:last-child {
            border-bottom: none;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
        }
        
        .activity-icon-primary {
            background: rgba(103, 126, 234, 0.1);
            color: #667eea;
        }
        
        .activity-icon-success {
            background: rgba(17, 153, 142, 0.1);
            color: #11998e;
        }
        
        .activity-icon-warning {
            background: rgba(247, 151, 30, 0.1);
            color: #f7971e;
        }
        
        .activity-icon-danger {
            background: rgba(255, 65, 108, 0.1);
            color: #ff416c;
        }
        
        .activity-content {
            flex-grow: 1;
        }
        
        .activity-time {
            font-size: 0.75rem;
            color: #6c757d;
        }
        
        .status-card {
            display: flex;
            align-items: center;
            padding: 1rem;
            border-radius: 12px;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        
        .status-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        
        .status-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
            font-size: 1.5rem;
        }
        
        .status-info {
            flex-grow: 1;
        }
        
        .status-title {
            font-weight: 600;
            margin-bottom: 0.25rem;
        }
        
        .status-value {
            font-weight: 700;
            font-size: 1.25rem;
        }
        
        .glow {
            animation: glow 2s infinite alternate;
        }
        
        @keyframes glow {
            from {
                box-shadow: 0 0 5px rgba(103, 126, 234, 0.5);
            }
            to {
                box-shadow: 0 0 20px rgba(103, 126, 234, 0.8);
            }
        }
        
        .pulse {
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4">
        <!-- Header -->
        <div class="dashboard-header" data-aos="fade-down">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1 class="h3 mb-0 fw-bold">Dashboard Overview</h1>
                    <p class="mb-0 text-muted">Welcome back, Administrator!</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <span class="badge bg-primary me-2"><i class="fas fa-circle me-1"></i> Live Data</span>
                    
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="row g-4 mb-4">
            <!-- Products -->
            <div class="col-md-6 col-xl-3" data-aos="fade-up" data-aos-delay="100">
                <div class="dashboard-card dashboard-card-primary p-4">
                    <i class="fas fa-box-open dashboard-icon"></i>
                    <div class="dashboard-count text-primary">
                        <asp:Label ID="lblProduct" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="dashboard-label">Total Products</div>
                    <a href="manage_product.aspx" class="dashboard-footer">
                        View Details <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>

            <!-- Users -->
            <div class="col-md-6 col-xl-3" data-aos="fade-up" data-aos-delay="200">
                <div class="dashboard-card dashboard-card-warning p-4">
                    <i class="fas fa-users dashboard-icon"></i>
                    <div class="dashboard-count text-warning">
                        <asp:Label ID="lblUser" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="dashboard-label">Registered Users</div>
                    <a href="manage_user.aspx" class="dashboard-footer">
                        View Details <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>

            <!-- Categories -->
            <div class="col-md-6 col-xl-3" data-aos="fade-up" data-aos-delay="300">
                <div class="dashboard-card dashboard-card-info p-4">
                    <i class="fas fa-tags dashboard-icon"></i>
                    <div class="dashboard-count text-info">
                        <asp:Label ID="lblCategory" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="dashboard-label">Active Categories</div>
                    <a href="category.aspx" class="dashboard-footer">
                        View Details <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>

            <!-- Payments -->
            <div class="col-md-6 col-xl-3" data-aos="fade-up" data-aos-delay="400">
                <div class="dashboard-card dashboard-card-success p-4 glow">
                    <i class="fas fa-credit-card dashboard-icon"></i>
                    <div class="dashboard-count text-success">
                        <%--₹--%><asp:Label ID="lblPayment" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="dashboard-label">Total Revenue</div>
                    <a href="paymentview.aspx" class="dashboard-footer">
                        View Details <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>
        </div>

                <!-- Additional Stats Row -->
        <div class="row g-4">
            <!-- Feedback -->
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
                <div class="dashboard-card dashboard-card-secondary p-4">
                    <i class="fas fa-comments dashboard-icon"></i>
                    <div class="dashboard-count text-secondary">
                        <asp:Label ID="lblFeedback" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="dashboard-label">Customer Feedback</div>
                    <a href="feedback.aspx" class="dashboard-footer">
                        View Details <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>

            <!-- Orders -->
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                <div class="dashboard-card dashboard-card-danger p-4">
                    <i class="fas fa-shopping-bag dashboard-icon"></i>
                    <div class="dashboard-count text-danger">
                        24
                    </div>
                    <div class="dashboard-label">New Orders</div>
                    <a href="order.aspx" class="dashboard-footer">
                        View Details <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
            </div>

            <!-- Status Cards -->
            <div class="col-md-12 col-lg-6" data-aos="fade-up" data-aos-delay="300">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="status-card pulse">
                            <div class="status-icon bg-primary bg-opacity-10 text-primary">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <div class="status-info">
                                <div class="status-title">Conversion Rate</div>
                                <div class="status-value">3.2%</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="status-card">
                            <div class="status-icon bg-success bg-opacity-10 text-success">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="status-info">
                                <div class="status-title">Successful Orders</div>
                                <div class="status-value">98%</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="status-card">
                            <div class="status-icon bg-info bg-opacity-10 text-info">
                                <i class="fas fa-eye"></i>
                            </div>
                            <div class="status-info">
                                <div class="status-title">Daily Visits</div>
                                <div class="status-value">1,245</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="status-card">
                            <div class="status-icon bg-warning bg-opacity-10 text-warning">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="status-info">
                                <div class="status-title">Avg. Response Time</div>
                                <div class="status-value">12m</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <script>
        // Initialize AOS animation
        AOS.init({
            duration: 800,
            easing: 'ease-in-out',
            once: true
        });

        

        // System theme detection
        function updateTheme() {
            if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
                document.body.classList.add('dark-mode');
            } else {
                document.body.classList.remove('dark-mode');
            }
        }

        window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', updateTheme);
        updateTheme();
    </script>
</asp:Content>