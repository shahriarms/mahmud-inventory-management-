
-- Drop tables if they exist to start fresh
DROP TABLE IF EXISTS invoice_items;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS buyers;
DROP TABLE IF EXISTS vendors;

-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sku VARCHAR(100) UNIQUE,
    quantity INTEGER NOT NULL DEFAULT 0,
    price NUMERIC(10, 2) NOT NULL
);

-- Create buyers table
CREATE TABLE buyers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    due NUMERIC(10, 2) DEFAULT 0
);

-- Create vendors table
CREATE TABLE vendors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    company VARCHAR(255)
);

-- Create invoices table
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    buyer_id INTEGER REFERENCES buyers(id),
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    total NUMERIC(10, 2) NOT NULL,
    due NUMERIC(10, 2) NOT NULL
);

-- Create invoice_items table
CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    invoice_id INTEGER REFERENCES invoices(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    rate NUMERIC(10, 2) NOT NULL
);

-- Insert some sample data
INSERT INTO products (name, sku, quantity, price) VALUES
('Welding Rod', 'WR-001', 100, 5.00),
('Grinding Disc', 'GD-002', 50, 12.50),
('Drill Bit Set', 'DBS-003', 20, 25.00),
('Safety Goggles', 'SG-004', 75, 8.75);

INSERT INTO buyers (name, phone, address, due) VALUES
('John Doe Construction', '123-456-7890', '123 Main St, Anytown', 150.00),
('Jane Smith Services', '098-765-4321', '456 Oak Ave, Otherville', 0.00);

INSERT INTO vendors (name, phone, company) VALUES
('Global Metal Supply', '555-111-2222', 'Global Metal Inc.'),
('Tools & More Co.', '555-333-4444', 'Tools & More');
