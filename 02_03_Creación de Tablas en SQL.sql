create database gestion_inventario;
use gestion_inventario;

-- crear tablas

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    cantidad_inventario INT NOT NULL CHECK (cantidad_inventario >= 0)
);

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE transacciones (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('compra', 'venta') NOT NULL,
    fecha DATE NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    id_producto INT NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);


-- crear datos de ejemplo

-- Insertar productos
INSERT INTO productos (nombre, descripcion, precio, cantidad_inventario) VALUES
('Smartphone X', 'Smartphone con pantalla 6.5", 128GB', 350.00, 100),
('Laptop Pro', 'Laptop 16GB RAM, 512GB SSD', 1200.00, 50),
('Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 80.50, 200),
('Monitor 24"', 'Monitor LED 24 pulgadas Full HD', 150.75, 75);

-- Insertar proveedores
INSERT INTO proveedores (nombre, direccion, telefono, email) VALUES
('Tech Supplies SA', 'Av. Tecnología 1234, Ciudad', '555-123456', 'contacto@techsupplies.com'),
('Distribuciones Global', 'Calle Comercio 987, Ciudad', '555-654321', 'ventas@distglobal.com'),
('Electronica Plus', 'Av. Electrónica 456, Ciudad', '555-789012', 'info@electronica.com');

-- Insertar transacciones (compra y venta)
INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor) VALUES
('compra', '2025-06-01', 50, 1, 1),   -- 50 Smartphones comprados a Tech Supplies
('venta',  '2025-06-15', 10, 1, 1),   -- 10 Smartphones vendidos (proveedor referenciado igual)
('compra', '2025-06-05', 30, 2, 2),   -- 30 Laptops compradas a Distribuciones Global
('venta',  '2025-06-20', 5, 2, 2),    -- 5 Laptops vendidas
('compra', '2025-06-10', 100, 3, 3),  -- 100 auriculares comprados a Electronica Plus
('venta',  '2025-06-25', 40, 3, 3),   -- 40 auriculares vendidos
('compra', '2025-06-15', 60, 4, 1),   -- 60 monitores comprados a Tech Supplies
('venta',  '2025-06-30', 20, 4, 1);   -- 20 monitores vendidos
