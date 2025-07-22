-- Recuperar todos los productos disponibles en el inventario

SELECT * FROM productos WHERE cantidad_inventario > 0;

-- Recuperar todos los proveedores que suministran un producto específico (ejemplo id_producto = 1)

SELECT DISTINCT p.*
FROM proveedores p
JOIN transacciones t ON p.id_proveedor = t.id_proveedor
WHERE t.id_producto = 1;

-- Consultar transacciones realizadas en una fecha específica (ejemplo: '2025-07-22')

SELECT * FROM transacciones WHERE fecha = '2025-07-22';

-- Número total de productos vendidos (tipo = 'venta')

SELECT SUM(cantidad) AS total_vendidos FROM transacciones WHERE tipo = 'venta';

-- Valor total de compras (tipo = 'compra')

SELECT SUM(cantidad * p.precio) AS valor_total_compras
FROM transacciones t
JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'compra';
