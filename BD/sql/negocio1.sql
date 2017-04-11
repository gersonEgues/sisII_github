CREATE TABLE direccion (
  id_direccion INT NOT NULL,
  numero_casa VARCHAR(5) NULL,
  calle VARCHAR(20) NULL,
  zona VARCHAR(20) NULL,
  PRIMARY KEY(id_direccion)
);

CREATE TABLE formulario_reembolso (
  id_formulario_reembolso VARCHAR(20) NOT NULL,
  costo_total VARCHAR NULL,
  anticipo VARCHAR NULL,
  saldo VARCHAR NULL,
  descuento VARCHAR NULL,
  PRIMARY KEY(id_formulario_reembolso)
);

CREATE TABLE cliente (
  id_cliente VARCHAR(20) NOT NULL,
  nombre VARCHAR(20) NULL,
  apellido_p VARCHAR(20) NULL,
  apellido_m VARCHAR(20) NULL,
  ci INT NULL,
  password_c VARCHAR(30) NULL,
  email VARCHAR(30) NULL,
  telefono INT NULL,
  PRIMARY KEY(id_cliente)
);

CREATE TABLE carrito_formulario (
  id_carrito VARCHAR(20) NOT NULL,
  cantidad_formulario INT NULL,
  fecha_pedido DATE NULL,
  hora_pedido TIME NULL,
  PRIMARY KEY(id_carrito)
);

CREATE TABLE formulario_pedido (
  id_formulario VARCHAR(10) NOT NULL,
  carrito_formulario_id_carrito VARCHAR(20) NOT NULL,
  nombre_producto VARCHAR NULL,
  cantidad_producto INT NULL,
  costo_total VARCHAR NULL,
  anticipo VARCHAR NULL,
  saldo VARCHAR NULL,
  PRIMARY KEY(id_formulario),
  FOREIGN KEY(carrito_formulario_id_carrito)
    REFERENCES carrito_formulario(id_carrito)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE direccion_e (
  direccion_id_direccion INT NOT NULL,
  FOREIGN KEY(direccion_id_direccion)
    REFERENCES direccion(id_direccion)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE empleado (
  id_empleado VARCHAR(10) NOT NULL,
  empleado_id_empleado VARCHAR(10) NOT NULL,
  nombre VARCHAR(20) NULL,
  apellido_p VARCHAR(20) NULL,
  apellido_m VARCHAR(20) NULL,
  email VARCHAR(20) NULL,
  telefono INT NULL,
  activo BOOL NULL,
  rol VARCHAR NULL,
  pasword VARCHAR(30) NULL,
  fecha_ingreso DATE NULL,
  fecha_salida DATE NULL,
  edad INT NULL,
  PRIMARY KEY(id_empleado),
  FOREIGN KEY(empleado_id_empleado)
    REFERENCES empleado(id_empleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_empleado)
    REFERENCES empleado(id_empleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE se_comunica_con (
  id_comunicacion INT NOT NULL,
  empleado_id_empleado VARCHAR(10) NOT NULL,
  cliente_id_cliente VARCHAR(20) NOT NULL,
  fecha DATE NULL,
  hora TIME NULL,
  PRIMARY KEY(id_comunicacion, empleado_id_empleado, cliente_id_cliente),
  FOREIGN KEY(empleado_id_empleado)
    REFERENCES empleado(id_empleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cliente_id_cliente)
    REFERENCES cliente(id_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE direccion_c (
  direccion_id_direccion INT NOT NULL,
  cliente_id_cliente VARCHAR(20) NOT NULL,
  descripcion_casa VARCHAR NULL,
  FOREIGN KEY(direccion_id_direccion)
    REFERENCES direccion(id_direccion)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cliente_id_cliente)
    REFERENCES cliente(id_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE historail_reembolso (
  id_reembolso VARCHAR(20) NOT NULL,
  formulario_reembolso_id_formulario_reembolso VARCHAR(20) NOT NULL,
  cliente_id_cliente VARCHAR(20) NOT NULL,
  empleado_id_empleado VARCHAR(10) NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY(id_reembolso, formulario_reembolso_id_formulario_reembolso, cliente_id_cliente),
  FOREIGN KEY(formulario_reembolso_id_formulario_reembolso)
    REFERENCES formulario_reembolso(id_formulario_reembolso)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cliente_id_cliente)
    REFERENCES cliente(id_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(empleado_id_empleado)
    REFERENCES empleado(id_empleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE compra_en (
  carrito_formulario_id_carrito VARCHAR(20) NOT NULL,
  cliente_id_cliente VARCHAR(20) NOT NULL,
  empleado_id_empleado VARCHAR(10) NOT NULL,
  fecha DATE NULL,
  hora TIME NULL,
  PRIMARY KEY(carrito_formulario_id_carrito, cliente_id_cliente),
  FOREIGN KEY(carrito_formulario_id_carrito)
    REFERENCES carrito_formulario(id_carrito)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cliente_id_cliente)
    REFERENCES cliente(id_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(empleado_id_empleado)
    REFERENCES empleado(id_empleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE historial_ausencia (
  id_historial VARCHAR(20) NOT NULL,
  empleado_id_empleado VARCHAR(10) NOT NULL,
  fecha DATE NULL,
  justificado BOOL NULL,
  PRIMARY KEY(id_historial),
  FOREIGN KEY(empleado_id_empleado)
    REFERENCES empleado(id_empleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE secion (
  id_secion VARCHAR(20) NOT NULL,
  empleado_id_empleado VARCHAR(10) NOT NULL,
  fecha DATE NULL,
  hora TIME NULL,
  ip_pc VARCHAR(20) NULL,
  PRIMARY KEY(id_secion, empleado_id_empleado),
  FOREIGN KEY(empleado_id_empleado)
    REFERENCES empleado(id_empleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE motivo (
  id_motivo INT NOT NULL,
  historial_ausencia_id_historial VARCHAR(20) NOT NULL,
  fallecimiento_familiar BOOL NULL,
  cumpleaños BOOL NULL,
  salud BOOL NULL,
  accidente BOOL NULL,
  PRIMARY KEY(id_motivo, historial_ausencia_id_historial),
  FOREIGN KEY(historial_ausencia_id_historial)
    REFERENCES historial_ausencia(id_historial)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


