BEGIN ;

INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('compra', CURDATE(), 10, 1, 1);

UPDATE productos
SET cantidad_inventario = cantidad_inventario + 10
WHERE id_producto = 1;

COMMIT;
