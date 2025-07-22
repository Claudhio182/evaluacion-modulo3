-- Total de ventas de un producto durante el mes anterior

SELECT p.nombre, SUM(t.cantidad) AS total_vendido
FROM transacciones t
JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'venta'
AND t.fecha BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
AND p.id_producto = 1
GROUP BY p.nombre;

-- JOIN para obtener información completa de transacciones con productos y proveedores

SELECT t.id_transaccion, t.tipo, t.fecha, t.cantidad,
       p.nombre AS producto_nombre,
       pr.nombre AS proveedor_nombre
FROM transacciones t
INNER JOIN productos p ON t.id_producto = p.id_producto
LEFT JOIN proveedores pr ON t.id_proveedor = pr.id_proveedor;

-- Subconsulta para obtener productos que no se han vendido en los últimos 3 meses

SELECT nombre
FROM productos
WHERE id_producto NOT IN (
    SELECT DISTINCT id_producto
    FROM transacciones
    WHERE tipo = 'venta'
    AND fecha >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
);

