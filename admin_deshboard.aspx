<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_deshboard.aspx.cs" Inherits="CompanyProject.admin_deshboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>
        :root {
            --primary: #4f46e5;
            --sidebar: #111827;
            --page: #f5f7fb;
            --muted: #8490a5;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            background: var(--page);
            color: #1f2937;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        .sidebar {
            position: fixed;
            inset: 0 auto 0 0;
            width: 250px;
            background: var(--sidebar);
            color: white;
            padding: 26px 17px;
            overflow-y: auto;
            z-index: 1000;
        }

        .brand {
            font-size: 23px;
            font-weight: 700;
            margin: 0 12px 38px;
            letter-spacing: -.5px;
        }

        .brand span { color: #818cf8; }

        .menu-label {
            color: #94a3b8;
            font-size: 11px;
            letter-spacing: 1.5px;
            margin: 25px 12px 10px;
        }

        .nav-link-custom {
            display: flex;
            gap: 13px;
            align-items: center;
            padding: 13px 14px;
            color: #cbd5e1;
            text-decoration: none;
            border-radius: 9px;
            margin: 5px 0;
            transition: .2s;
        }

        .nav-link-custom:hover,
        .nav-link-custom.active {
            color: white;
            background: var(--primary);
        }

        .main {
            margin-left: 250px;
            padding: 28px 32px;
            min-height: 100vh;
        }

        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            margin-bottom: 30px;
        }

        .page-title {
            font-size: 27px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .muted { color: var(--muted); }

        .profile {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar {
            display: grid;
            place-items: center;
            width: 43px;
            height: 43px;
            border-radius: 50%;
            background: #e0e7ff;
            color: #4338ca;
            font-weight: 700;
        }

        .stat-card, .panel {
            background: white;
            border: 1px solid #edf0f5;
            border-radius: 15px;
            box-shadow: 0 4px 18px rgba(20, 30, 60, .035);
        }

        .stat-card {
            padding: 22px;
            height: 100%;
        }

        .stat-icon {
            display: grid;
            place-items: center;
            width: 47px;
            height: 47px;
            border-radius: 12px;
            font-size: 23px;
            margin-bottom: 20px;
        }

        .purple { background: #ede9fe; color: #6d28d9; }
        .blue   { background: #dbeafe; color: #1d4ed8; }
        .green  { background: #d1fae5; color: #047857; }
        .orange { background: #ffedd5; color: #c2410c; }

        .stat-number {
            font-size: 29px;
            font-weight: 700;
            margin: 5px 0;
        }

        .change {
            font-size: 12px;
            color: #059669;
            margin-top: 10px;
        }

        .panel {
            padding: 24px;
            margin-top: 25px;
        }

        .panel-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-bottom: 23px;
        }

        .panel-heading h5 {
            font-weight: 700;
            margin: 0;
        }

        .chart {
            height: 220px;
            display: flex;
            align-items: end;
            justify-content: space-around;
            gap: 12px;
            padding: 12px 4px 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .bar-group {
            height: 100%;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: end;
            align-items: center;
            gap: 9px;
        }

        .bar {
            width: min(36px, 75%);
            min-height: 8px;
            border-radius: 7px 7px 0 0;
            background: #c7d2fe;
            transition: .2s;
        }

        .bar:hover { background: var(--primary); }

        .bar-label {
            color: var(--muted);
            font-size: 12px;
            padding-bottom: 10px;
        }

        .table { vertical-align: middle; }

        .table th {
            color: var(--muted);
            font-size: 12px;
            font-weight: 600;
            border-bottom-width: 1px;
            white-space: nowrap;
        }

        .table td { padding-top: 16px; padding-bottom: 16px; }

        .status {
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            white-space: nowrap;
        }

        .completed { color: #047857; background: #d1fae5; }
        .pending { color: #b45309; background: #fef3c7; }
        .cancelled { color: #b91c1c; background: #fee2e2; }

        .mobile-menu {
            display: none;
            border: 0;
            background: white;
            border-radius: 8px;
            padding: 8px 12px;
            font-size: 21px;
        }

        @media (max-width: 900px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform .25s;
            }

            .sidebar.open { transform: translateX(0); }

            .main {
                margin-left: 0;
                padding: 22px 17px;
            }

            .mobile-menu { display: inline-block; }
            .page-title { font-size: 23px; }
        }

        @media (max-width: 500px) {
            .profile-info { display: none; }
            .stat-card { padding: 17px; }
            .stat-number { font-size: 24px; }
            .panel { padding: 16px; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <aside class="sidebar" id="sidebar">
        <div class="brand">Admin<span>Panel.</span></div>

        <div class="menu-label">MAIN MENU</div>

        <a href="admin_dashboard.aspx"
           class="nav-link-custom active">▦ Dashboard</a>

        <a href="users.aspx" class="nav-link-custom">♙ Users</a>
        <a href="products.aspx" class="nav-link-custom">▣ Products</a>
        <a href="orders.aspx" class="nav-link-custom">▤ Orders</a>
        <a href="reports.aspx" class="nav-link-custom">▥ Reports</a>

        <div class="menu-label">MANAGEMENT</div>

        <a href="categories.aspx" class="nav-link-custom">◈ Categories</a>
        <a href="settings.aspx" class="nav-link-custom">⚙ Settings</a>
        <a href="login.aspx" class="nav-link-custom">↪ Logout</a>
    </aside>

    <main class="main">
        <header class="topbar">
            <div class="d-flex align-items-center gap-3">
                <button type="button" class="mobile-menu"
                        onclick="toggleSidebar()"
                        aria-label="Toggle navigation">☰</button>
                <div>
                    <div class="page-title">Dashboard</div>
                    <div class="muted small">
                        Welcome back, Admin! Here's your overview.
                    </div>
                </div>
            </div>

            <div class="profile">
                <div class="profile-info text-end">
                    <div class="fw-semibold">Administrator</div>
                    <div class="muted small">System Admin</div>
                </div>
                <div class="avatar">A</div>
            </div>
        </header>

        <!-- Summary cards -->
        <div class="row g-3">
            <div class="col-6 col-xl-3">
                <div class="stat-card">
                    <div class="stat-icon purple">♙</div>
                    <div class="muted small">Total Users</div>
                    <div class="stat-number">
                        <asp:Label ID="lblTotalUsers"
                            runat="server" />
                    </div>
                    <div class="change">↑ Active user overview</div>
                </div>
            </div>

            <div class="col-6 col-xl-3">
                <div class="stat-card">
                    <div class="stat-icon blue">▣</div>
                    <div class="muted small">Total Products</div>
                    <div class="stat-number">
                        <asp:Label ID="lblTotalProducts"
                            runat="server"  />
                    </div>
                    <div class="change">↑ Order overview</div>
                </div>
            </div>

            <div class="col-6 col-xl-3">
                <div class="stat-card">
                    <div class="stat-icon green">₹</div>
                    <div class="muted small">Total Revenue</div>
                    <div class="stat-number">
                        <asp:Label ID="lblRevenue"
                            runat="server" Text="₹2.4L" />
                    </div>
                    <div class="change">Revenue overview</div>
                </div>
            </div>

            <div class="col-6 col-xl-3">
                <div class="stat-card">
                    <div class="stat-icon orange">◷</div>
                    <div class="muted small">Pending Orders</div>
                    <div class="stat-number">
                        <asp:Label ID="lblPending"
                            runat="server" Text="24" />
                    </div>
                    <div class="change">Orders awaiting action</div>
                </div>
            </div>
        </div>

        <!-- Chart and quick summary -->
        <div class="row">
            <div class="col-lg-8">
                <section class="panel">
                    <div class="panel-heading">
                        <div>
                            <h5>Monthly Overview</h5>
                            <div class="muted small mt-1">
                                Sample monthly performance
                            </div>
                        </div>
                        <span class="badge text-bg-light">This year</span>
                    </div>

                    <div class="chart">
                        <div class="bar-group">
                            <div class="bar" style="height:42%"></div>
                            <span class="bar-label">May</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:60%"></div>
                            <span class="bar-label">Jun</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:48%"></div>
                            <span class="bar-label">Jul</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:76%"></div>
                            <span class="bar-label">Aug</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:63%"></div>
                            <span class="bar-label">Sep</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:92%"></div>
                            <span class="bar-label">Oct</span>
                        </div>
                    </div>
                </section>
            </div>

            <div class="col-lg-4">
                <section class="panel">
                    <div class="panel-heading">
                        <h5>Quick Actions</h5>
                    </div>

                    <div class="d-grid gap-3">
                        <a href="add_user.aspx"
                           class="btn btn-primary text-start">
                            + &nbsp; Add New User
                        </a>
                        <a href="add_product.aspx"
                           class="btn btn-outline-primary text-start">
                            + &nbsp; Add New Product
                        </a>
                        <a href="orders.aspx"
                           class="btn btn-outline-secondary text-start">
                            ▤ &nbsp; Manage Orders
                        </a>
                        <a href="reports.aspx"
                           class="btn btn-outline-secondary text-start">
                            ▥ &nbsp; View Reports
                        </a>
                    </div>
                </section>
            </div>
        </div>

        <!-- Recent orders -->
        <section class="panel">
            <div class="panel-heading">
                <div>
                    <h5>Recent Orders</h5>
                    <div class="muted small mt-1">
                        Latest order activity
                    </div>
                </div>

                <a href="orders.aspx"
                   class="btn btn-sm btn-outline-primary">
                    View All
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>ORDER ID</th>
                            <th>CUSTOMER</th>
                            <th>DATE</th>
                            <th>AMOUNT</th>
                            <th>STATUS</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>#ORD-1001</td>
                            <td>Rahul Patel</td>
                            <td>28 Oct 2026</td>
                            <td>₹2,500</td>
                            <td><span class="status completed">
                                Completed</span></td>
                        </tr>

                        <tr>
                            <td>#ORD-1002</td>
                            <td>Priya Shah</td>
                            <td>28 Oct 2026</td>
                            <td>₹1,800</td>
                            <td><span class="status pending">
                                Pending</span></td>
                        </tr>

                        <tr>
                            <td>#ORD-1003</td>
                            <td>Amit Joshi</td>
                            <td>27 Oct 2026</td>
                            <td>₹950</td>
                            <td><span class="status cancelled">
                                Cancelled</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <footer class="text-center muted small mt-4 mb-2">
            © 2026 Admin Panel. All rights reserved.
        </footer>
    </main>

</form>

<script>
    function toggleSidebar() {
        document.getElementById("sidebar").classList.toggle("open");
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
