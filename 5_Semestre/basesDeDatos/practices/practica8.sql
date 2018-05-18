/*Consulta1*/
select proveedor.idProv, proveedor.nomProv, producto.nomProducto from proveedor join producto on producto.idProv = proveedor.idProv;

/*Consulta2*/
select proveedor.idProv, proveedor.nomProv, producto.nomProducto from proveedor left join producto on producto.idProv = proveedor.idProv;

/*Consulta3*/
select producto.idProducto, producto.nomProducto, proveedor.nomProv from proveedor right join producto on producto.idProv = proveedor.idProv;

/*Consulta4*/
select producto.idProv, proveedor.nomProv, producto.nomProducto from proveedor left join producto on producto.idProv = proveedor.idProv
	union
select producto.idProv, proveedor.nomProv, producto.nomProducto from proveedor right join producto on producto.idProv = proveedor.idProv;

/*Consulta5*/
select nomProducto from producto join prodVendidos on prodVendidos.idProducto = producto.idProducto;

/*Consulta6, se puede usar "is not null"*/
select nomProducto, idProdVend from (producto left join prodVendidos on prodVendidos.idProducto = producto.idProducto) where idProdVend is null;

/*Consulta*/


/*Consulta*/


/*Consulta*/


/*Consulta*/


/*Consulta*/


/*Consulta*/


/*Consulta*/


/*Consulta*/


/*Consulta*/


/*EJEMPLITOS :'v*/


select prodVendidos.precioVenta as "drugsPrice", prodVendidos.cantidad as "drugsCantidad", venta.fechaVta as "drugsDate" from (prodVendidos join venta on prodVendidos.idVenta=venta.idVenta) group by prodVendidos.precioVenta;

select aidi, drugsPrice, drugsCantidad from (select prodVendidos.precioVenta as "drugsPrice", prodVendidos.cantidad as "drugsCantidad", venta.fechaVta as "drugsDate", venta.idVenta as "aidi" from (prodVendidos join venta on prodVendidos.idVenta=venta.idVenta) group by prodVendidos.precioVenta) as chelas;

select aidi, aidiCliente, drugsPrice, drugsCantidad from (select venta.idCliente as "aidiCliente", prodVendidos.precioVenta as "drugsPrice", prodVendidos.cantidad as "drugsCantidad", venta.fechaVta as "drugsDate", venta.idVenta as "aidi" from (prodVendidos join venta on prodVendidos.idVenta=venta.idVenta) group by prodVendidos.precioVenta) as chelas;

select uno.aidiCliente, uno.aidi as "idProducto", uno.drugsPrice as "precio", uno.drugsCantidad, cliente.nombre from (select aidi, aidiCliente, drugsPrice, drugsCantidad from (select venta.idCliente as "aidiCliente", prodVendidos.precioVenta as "drugsPrice", prodVendidos.cantidad as "drugsCantidad", venta.fechaVta as "drugsDate", venta.idVenta as "aidi" from (prodVendidos join venta on prodVendidos.idVenta=venta.idVenta) group by prodVendidos.precioVenta) as chelas) as uno join cliente on uno.aidiCliente=cliente.idCliente;