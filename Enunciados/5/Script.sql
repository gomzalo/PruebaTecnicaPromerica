CREATE TABLE [articulo] (
  [id_articulo] integer PRIMARY KEY,
  [nombre] nvarchar(255),
  [id_tipo] integer,
  [id_subtipo] integer,
  [precio] float
)
GO

CREATE TABLE [tipo] (
  [id_tipo] integer PRIMARY KEY,
  [nombre] nvarchar(255)
)
GO

CREATE TABLE [sucursal] (
  [id_sucursal] integer PRIMARY KEY,
  [nombre] nvarchar(255),
  [ubicacion] integer
)
GO

CREATE TABLE [inventario] (
  [id_inventario] integer PRIMARY KEY,
  [id_articulo] integer,
  [id_sucursal] integer,
  [cantidad] integer
)
GO

CREATE TABLE [promocion] (
  [id_promocion] integer PRIMARY KEY,
  [descripcion] nvarchar(255),
  [puntos] integer,
  [fecha_inicio] date,
  [fecha_fin] date
)
GO

CREATE TABLE [canje] (
  [id_canje] integer PRIMARY KEY,
  [id_promocion] integer,
  [id_articulo] integer,
  [nuevo_precio] float,
  [cantidad] integer,
  [observaciones] nvarchar(255)
)
GO

ALTER TABLE [articulo] ADD FOREIGN KEY ([id_tipo]) REFERENCES [tipo] ([id_tipo])
GO

ALTER TABLE [articulo] ADD FOREIGN KEY ([id_subtipo]) REFERENCES [tipo] ([id_tipo])
GO

ALTER TABLE [articulo] ADD FOREIGN KEY ([id_articulo]) REFERENCES [inventario] ([id_articulo])
GO

ALTER TABLE [inventario] ADD FOREIGN KEY ([id_sucursal]) REFERENCES [sucursal] ([id_sucursal])
GO

ALTER TABLE [canje] ADD FOREIGN KEY ([id_promocion]) REFERENCES [promocion] ([id_promocion])
GO

ALTER TABLE [canje] ADD FOREIGN KEY ([id_articulo]) REFERENCES [articulo] ([id_articulo])
GO
