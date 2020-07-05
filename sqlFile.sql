# Selecting the product that has selled the most and the amount
SELECT c.Nombre, c.`Ventas`
FROM 
(SELECT b.Nombre, SUM(a.Cantidad*b.`Precio Sugerido público`) AS `Ventas`
FROM transacciones AS a INNER JOIN productos AS b ON a.`Código Producto` = b.`Código Producto`
WHERE a.`Código Tipo transacción` = 2
GROUP BY a.`Código Producto`) AS c
ORDER BY C.`Ventas` ASC
LIMIT 1;
# Select by bodega the total amount of buying
SELECT b.Nombre, SUM(if(a.`Código Tipo Transacción`=1,1,0)) AS `Compra`
FROM transacciones AS a INNER JOIN `bodegas` AS b ON a.`Código Bodega` = b.`Código Bodega`
GROUP BY a.`Código Bodega`;
#Selecte the total amount of transaction where the amount of product was 1,2,3,4 and 10
SELECT if(a.`Código Transacción`>0,1,0) AS `Cantidad`, count(a.Cantidad) AS `Número Transacciones`
FROM transacciones AS a
WHERE a.Cantidad =1
UNION ALL
SELECT if(a.`Código Transacción`>0,2,0) AS `Cantidad`, count(a.Cantidad) AS `Número Transacciones`
FROM transacciones AS 
