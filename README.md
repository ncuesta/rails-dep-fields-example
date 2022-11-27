# App rails de ejemplo

Esta app muestra una forma sencilla de implementar un formulario con
pasos que dependen de la información ingresada en los pasos anteriores,
utilizando una sola vista y un solo controlador para esto.

## Preparación

Instalar dependencias, preparar base de datos y cargar datos iniciales (seed):

```bash
$ bin/setup
```

## Prueba

Correr el servidor de Rails y navegar a [http://localhost:3000](http://localhost:3000):

```bash
$ bin/rails server
```

## Puntos importantes del código

* `OrdersController`.
* Vista para `OrdersController#new`.
* Modelo `Order`.
