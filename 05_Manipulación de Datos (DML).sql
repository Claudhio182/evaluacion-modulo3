-- Insertar datos

INSERT INTO productos (nombre, descripcion, precio, cantidad_inventario) VALUES
('Producto A', 'Descripción A', 100.00, 50),
('Producto B', 'Descripción B', 150.50, 20);

INSERT INTO proveedores (nombre, direccion, telefono, email) VALUES
('Proveedor 1', 'Calle Falsa 123', '123456789', 'proveedor1@example.com'),
('Proveedor 2', 'Av. Siempre Viva 742', '987654321', 'proveedor2@example.com');

INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor) VALUES
('compra', CURDATE(), 10, 1, 1),
('venta', CURDATE(), 5, 2, 2);

-- Actualizar cantidad de inventario después de una venta (ejemplo producto 1 vendió 3 unidades)
UPDATE productos
SET cantidad_inventario = cantidad_inventario - 3
WHERE id_producto = 1;

-- Eliminar un producto si ya no está disponible

DELETE FROM productos WHERE id_producto = 2;

