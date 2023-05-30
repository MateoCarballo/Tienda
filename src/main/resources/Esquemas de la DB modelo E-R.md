# Modelo Entidad-Relación de la base de datos "Tienda"

## Tabla Usuario
- idUsuario (PK)
- nombre
- apellido1
- apellido2
- correo (UNIQUE)
- tfno (UNIQUE)

## Tabla Producto
- idProducto (PK)
- cif
- nombre
- descripción
- valor

## Tabla Pedido
- idPedido (PK)
- idUsuario (FK)
- fecha

## Tabla Pedido_Producto
- idPedido_Producto (PK)
- idPedido (FK)
- idProducto (FK)

## Tabla Proveedor
- cif (PK)
- nombre
- tfno (UNIQUE)
- dirección

### Claves foráneas
- La tabla "Producto" tiene una clave foránea "cif" que referencia a la tabla "Proveedor".
- La tabla "Pedido" tiene una clave foránea "idUsuario" que referencia a la tabla "Usuario".
- La tabla "Pedido_Producto" tiene una clave foránea "idPedido" que referencia a la tabla "Pedido", y una clave foránea "idProducto" que referencia a la tabla "Producto".

