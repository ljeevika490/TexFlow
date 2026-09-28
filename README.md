# TexFlow – Textile Production Management Platform

A complete, modern, and practical **MERN Stack** (MongoDB, Express.js, React, Node.js) final-year project connecting textile raw material suppliers with a textile manufacturing company.

---

## 🌟 Project Purpose & Workflow

TexFlow provides an industrial, transparent, and structured platform for textile manufacturing operations:

```
Supplier (Seller) ──> Raw Material Catalog ──> Purchase Order (PO) ──> Production Batch ──> Status Tracking
```

- **Admin**: Manages raw material inventory, reviews and updates all purchase orders, schedules and monitors textile production batches, and oversees registered sellers.
- **Seller (Supplier)**: Browses factory material requirements, places Purchase Orders with real-time cost calculation, tracks order fulfillment, and manages their profile.

---

## 🛠️ Technology Stack

| Layer | Technologies Used |
|---|---|
| **Frontend** | React 19, Vite, React Router DOM v7, Axios, Lucide Icons, Custom Corporate CSS |
| **Backend** | Node.js, Express.js, CORS, Dotenv |
| **Database** | MongoDB, Mongoose ODM |
| **Authentication** | JSON Web Tokens (JWT), bcryptjs password hashing |

---

## 👥 User Roles & Access Control

### 1. Admin (`ADMIN`)
- **Dashboard**: High-level production analytics, 5 KPI cards, recent purchase orders, and production summary.
- **Raw Materials Management**: Full CRUD on cotton, polyester, yarn, dye, and fabric stock.
- **Purchase Orders Management**: View all orders, update status (`PENDING` ➔ `CONFIRMED` ➔ `IN TRANSIT` ➔ `RECEIVED` / `CANCELLED`), delete orders.
- **Production Batches**: Schedule batches, assign raw materials, track lifecycle (`PLANNED`, `IN PRODUCTION`, `COMPLETED`, `ON HOLD`, `CANCELLED`).
- **Sellers Directory**: View registered suppliers, contact numbers, email, and order counts.

### 2. Seller / Supplier (`SELLER`)
- **Dashboard**: Supplier-scoped KPI cards (Total, Pending, Confirmed, Completed) and recent orders.
- **Materials Catalog**: View raw materials with live pricing and stock availability; direct "Order Material" action.
- **My Purchase Orders**: Submit orders with live price computation (`quantity × price`), cancel pending orders, view detailed PO breakdown.
- **Profile**: View and update contact information.
- *Guarded*: Strictly prevented from viewing other sellers' orders, production schedules, or admin routes.

---

## 🚀 Quick Start Guide

### Prerequisites
- [Node.js](https://nodejs.org/) (v18 or higher)
- [MongoDB](https://www.mongodb.com/) running locally on port 27017

### 1. Backend Setup
```bash
cd backend
npm install
npm run seed     # Seeds realistic demo data (Admin, Sellers, Materials, Batches)
npm start        # Starts Express server on http://localhost:5000
```

### 2. Frontend Setup
```bash
cd frontend
npm install
npm run dev      # Starts Vite dev server on http://localhost:5173
```

---

## 🔑 Demo Login Credentials

The login screen includes **1-Click Demo Fill** buttons for immediate testing:

| Role | Email | Password | Organization |
|---|---|---|---|
| **Admin** | `admin@texflow.com` | `admin123` | Enterprise Manufacturing Admin |
| **Seller 1** | `tiruppur.tex@gmail.com` | `seller123` | Tiruppur Cotton Mills |
| **Seller 2** | `coimbatore.yarns@gmail.com` | `seller123` | Coimbatore Spinners Ltd |

---

## 📡 API Endpoints

### Authentication
- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Sign in and receive JWT
- `POST /api/auth/logout` - Sign out
- `GET  /api/auth/me` - Current authenticated user session

### Raw Materials
- `GET    /api/raw-materials` - Get materials (with `search` & `status` filters)
- `POST   /api/raw-materials` - Create material *(Admin)*
- `GET    /api/raw-materials/:id` - Get material details
- `PUT    /api/raw-materials/:id` - Update material *(Admin)*
- `DELETE /api/raw-materials/:id` - Delete material *(Admin)*

### Purchase Orders
- `GET    /api/purchase-orders` - Get orders (Admin gets all, Seller gets own)
- `POST   /api/purchase-orders` - Create order
- `GET    /api/purchase-orders/:id` - Get order details
- `PUT    /api/purchase-orders/:id` - Update status/details (Admin all, Seller cancel pending)
- `DELETE /api/purchase-orders/:id` - Delete order *(Admin)*

### Production Batches
- `GET    /api/production` - Get batches *(Admin)*
- `POST   /api/production` - Create production batch *(Admin)*
- `GET    /api/production/:id` - Get batch details *(Admin)*
- `PUT    /api/production/:id` - Update batch & status *(Admin)*
- `DELETE /api/production/:id` - Delete batch *(Admin)*

### Users & Statistics
- `GET /api/users/sellers` - Registered sellers directory *(Admin)*
- `GET /api/users/admin-stats` - Admin metrics & recent summary *(Admin)*
- `GET /api/users/seller-stats` - Supplier dashboard metrics *(Seller)*
- `PUT /api/users/profile` - Update profile name and phone *(Authenticated)*

---

## 📁 Repository Structure

```
TexFlow/
├── backend/
│   ├── config/          # MongoDB connection (db.js)
│   ├── controllers/     # Express route controllers
│   ├── middleware/      # JWT authentication & role-based authorization
│   ├── models/          # Mongoose models (User, RawMaterial, PurchaseOrder, ProductionBatch)
│   ├── routes/          # Express route definitions
│   ├── .env             # Environment variables
│   ├── seed.js          # Demo data seeding script
│   ├── server.js        # Main server entry point
│   └── package.json
│
├── frontend/
│   ├── src/
│   │   ├── components/  # Layout, Navbar, Sidebar, ProtectedRoute, Modal, StatCard, StatusBadge
│   │   ├── context/     # AuthContext with token handling
│   │   ├── pages/       # Login, Register, Admin Pages, Seller Pages
│   │   ├── services/    # Axios instance with interceptors
│   │   ├── App.jsx      # Route configuration with role protection
│   │   ├── main.jsx     # App bootstrap
│   │   └── index.css    # Clean industrial CSS design system
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
│
├── package.json
└── README.md
```
