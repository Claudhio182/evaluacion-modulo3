DELIMITER //
CREATE PROCEDURE registrarCompra(
    IN pid_producto INT,
    IN pcantidad INT,
    IN pid_proveedor INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
    VALUES ('compra', CURDATE(), pcantidad, pid_producto, pid_proveedor);

    UPDATE productos
    SET cantidad_inventario = cantidad_inventario + pcantidad
    WHERE id_producto = pid_producto;

    COMMIT;
END //
DELIMITER ;
