USE jardineria;
    SELECT 
        c.nombre_cliente as cliente,
        CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) as comercial,
        o.codigo_oficina as oficina
    FROM cliente c
        inner join empleado e on (e.codigo_empleado = c.codigo_empleado_rep_ventas)
        inner join oficina o on (o.codigo_oficina = e.codigo_oficina); 



-- 1.4.5 ejercicio1
SELECT 
    c.nombre_cliente as cliente,
    CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) as empleado
FROM cliente c
    inner join empleado e on (e.codigo_empleado = c.codigo_empleado_rep_ventas)
ORDER BY c.nombre_cliente;

-- 1.4.5 ejercicio2
use jardineria;
SELECT 
    c.nombre_cliente as cliente,
    CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) as empleado,
    p.codigo_cliente as pago,
    e.puesto as puesto
FROM cliente c
    inner join empleado e on  (e.codigo_empleado = c.codigo_cliente)
    inner join pago p on (p.codigo_cliente = c.codigo_cliente);

-- 1.4.5 ejercicio3
use jardineria;
SELECT 
    c.nombre_cliente as cliente,
    CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) as empleado,
    p.codigo_cliente as pago,
    e.puesto as puesto
FROM cliente c
    inner join empleado e on  (e.codigo_empleado = c.codigo_cliente)
    LEFT join pago p on (p.codigo_cliente = c.codigo_cliente);

-- 1.4.5 ejercicio4
use jardineria;
SELECT 
    c.nombre_cliente as cliente,
    CONCAT(e.nombre, ' ', e.apellido1, ' ', apellido2),
    p.codigo_cliente as pago,
    e.puesto as puesto,
    c.ciudad as city

FROM cliente c 
    inner join empleado e on  (e.codigo_empleado = c.codigo_cliente)
    INNER join pago p on (p.codigo_cliente = c.codigo_cliente);

-- 1.4.5 ejercicio5
use jardineria;
SELECT 
    c.nombre_cliente as cliente,
    CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2),
    p.codigo_cliente as pago,
    c.ciudad as ciudad

FROM cliente c 
    INNER JOIN empleado e on (e.codigo_empleado = c.codigo_cliente)
    LEFT JOIN pago p on (p.codigo_cliente = c.codigo_empleado_rep_ventas);
-- 1.4.5 ejercicio6
use jardineria;
SELECT 
    c.linea_direccion1 as direccion,
    c.ciudad as ciudad
FROM cliente c
    inner join empleado e on (e.codigo_empleado = c.codigo_empleado_rep_ventas)
WHERE c.ciudad = 'Fuenlabrada';

-- 1.4.5 ejercicio7
SELECT 
    c.nombre_cliente as cliente,
    CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) as representantes,
    p.codigo_cliente as pago,
    c.ciudad as ciudad

FROM cliente c 
    INNER JOIN empleado e on (e.codigo_empleado = c.codigo_cliente)
    LEFT JOIN pago p on (p.codigo_cliente = c.codigo_empleado_rep_ventas)
ORDER BY pago;

-- 1.4.5 ejercicio8
USE jardineria;
SELECT 
    CONCAT(e1.nombre, ' ', e1.apellido1, ' ', e1.apellido2) as empleados,
    e2.nombre as jefe
FROM empleado e1 
    INNER JOIN empleado e2 on (e2.codigo_empleado = e1.codigo_jefe);

-- 1.4.5 ejercicio9
USE jardineria;
SELECT
    CONCAT(e1.nombre, ' ', e1.apellido1, ' ', e1.apellido2) as empleado,
    e2.nombre as jefe,
    e3.nombre as jefedejefes

FROM empleado e1 
    inner JOIN empleado e2 on (e2.codigo_empleado = e1.codigo_jefe)
    inner JOIN empleado e3 on (e3.codigo_empleado = e2.codigo_jefe);


-- 1.4.5 ejercicio10
USE jardineria;
SELECT
    COUNT(c1.nombre_cliente) as pedidos,
    c1.nombre_contacto as cliente
    
FROM cliente c1 
    INNER JOIN pedido p1 on (p1.codigo_cliente = c1.codigo_cliente)

WHERE p1.fecha_esperada < p1.fecha_entrega
GROUP BY cliente;

-- 1.4.5 ejercicio11
use jardineria;
SELECT DISTINCT c.nombre_cliente, ga.gama
from cliente c
    INNER JOIN pedido ped on (ped.codigo_cliente = c.codigo_cliente)
    INNER JOIN detalle_pedido dp on (dp.codigo_pedido = ped.codigo_pedido)
    INNER JOIN producto pr on (pr.codigo_producto = dp.codigo_producto)
    INNER JOIN gama_producto ga on (ga.gama = pr.gama)
ORDER BY c.nombre_cliente, ga.gama;

-- 1.4.6 ejercicio1
use jardineria;
SELECT DISTINCT c.nombre_contacto,
p.total as total
FROM cliente c
    LEFT JOIN pago p on (p.codigo_cliente = c.codigo_cliente)
WHERE (p.total is null);

--1.4.6 ejercicio2
use jardineria;
SELECT
    c.codigo_cliente as id,
    c.nombre_contacto as cliente,
    ped.fecha_pedido as fecha

FROM cliente c
    LEFT JOIN pedido ped on (ped.codigo_pedido = c.codigo_cliente)

WHERE (ped.fecha_pedido is NULL);

--1.4.6 ejercicio3

use jardineria;
SELECT
    c.codigo_cliente as id,
    c.nombre_cliente as cliente,
    pa.fecha_pago as pago,
    ped.fecha_pedido as fecha

FROM cliente c
    LEFT JOIN pago pa on (pa.codigo_cliente = c.codigo_cliente)
    LEFT JOIN pedido ped on (ped.codigo_pedido = c.codigo_cliente)
WHERE (pa.codigo_cliente is NULL) AND (ped.codigo_cliente is NULL);

--1.4.6 ejercicio4