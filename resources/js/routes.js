import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
    base: "/" + app_base,
    routes: [
        /* ************************* *
         *       PORTAL
         * ************************* */
        // INICIO
        {
            path: "/",
            name: "portal.inicio",
            component: require("./portal/Inicio.vue").default,
        },

        // ACTIVIDADES
        {
            path: "/actividades",
            name: "portal.actividads",
            component: require("./portal/Actividades.vue").default,
        },
        {
            path: "/actividades/:id",
            name: "portal.actividad",
            component: require("./portal/Actividad.vue").default,
            props: true,
        },

        // NOSOTROS
        {
            path: "/nosotros",
            name: "portal.nosotros",
            component: require("./portal/Nosotros.vue").default,
        },

        // PRODUCTOS
        {
            path: "/productos",
            name: "portal.productos",
            component: require("./portal/Productos.vue").default,
        },

        // CARRITO
        {
            path: "/carrito",
            name: "portal.carrito",
            component: require("./portal/Carrito.vue").default,
        },

        // CONTACTOS
        {
            path: "/contactos",
            name: "portal.contactos",
            component: require("./portal/Contactos.vue").default,
        },

        /* ************************* *
         *     ADMINISTRACIÓN
         * ************************* */

        // INICIO
        {
            path: "/administracion",
            name: "inicio",
            component: require("./components/Inicio.vue").default,
        },

        // LOGIN
        {
            path: "/administracion/login",
            name: "login",
            component: require("./Auth.vue").default,
        },

        // Usuarios
        {
            path: "/administracion/usuarios/perfil/:id",
            name: "usuarios.perfil",
            component: require("./components/modulos/usuarios/perfil.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/usuarios",
            name: "usuarios.index",
            component: require("./components/modulos/usuarios/index.vue")
                .default,
        },

        // Portal
        {
            path: "/administracion/portal",
            name: "admin_portal.index",
            component: require("./components/modulos/portal/index.vue").default,
            props: true,
        },

        // Portal - actividades
        {
            path: "/administracion/portal/actividades",
            name: "admin_portal.actividades",
            component: require("./components/modulos/portal/Actividades.vue")
                .default,
            props: true,
        },

        // Portal - banners
        {
            path: "/administracion/portal/banners",
            name: "admin_portal.banners",
            component: require("./components/modulos/portal/Banners.vue")
                .default,
            props: true,
        },

        // Portal - banners
        {
            path: "/administracion/portal/contactos",
            name: "admin_portal.contactos",
            component: require("./components/modulos/portal/Contactos.vue")
                .default,
            props: true,
        },

        // Portal - nosotros
        {
            path: "/administracion/portal/nosotros",
            name: "admin_portal.nosotros",
            component: require("./components/modulos/portal/Nosotros.vue")
                .default,
            props: true,
        },

        // Portal - redes_sociales
        {
            path: "/administracion/portal/redes_sociales",
            name: "admin_portal.redes_sociales",
            component: require("./components/modulos/portal/RedesSociales.vue")
                .default,
            props: true,
        },

        // Portal - apis
        {
            path: "/administracion/portal/apis",
            name: "admin_portal.apis",
            component: require("./components/modulos/portal/Apis.vue").default,
            props: true,
        },

        // Catálogos
        {
            path: "/administracion/catalogos",
            name: "catalogos.index",
            component: require("./components/modulos/catalogos/index.vue")
                .default,
            props: true,
        },

        // Productos
        {
            path: "/administracion/productos",
            name: "productos.index",
            component: require("./components/modulos/productos/index.vue")
                .default,
            props: true,
        },

        // Pedidos
        {
            path: "/administracion/pedidos",
            name: "pedidos.index",
            component: require("./components/modulos/pedidos/index.vue")
                .default,
            props: true,
        },

        {
            path: "/administracion/pedidos/:id",
            name: "pedidos.show",
            component: require("./components/modulos/pedidos/show.vue").default,
            props: true,
        },

        // Conceptos
        {
            path: "/administracion/conceptos",
            name: "conceptos.index",
            component: require("./components/modulos/conceptos/index.vue")
                .default,
            props: true,
        },

        // Cajas
        {
            path: "/administracion/cajas",
            name: "cajas.index",
            component: require("./components/modulos/cajas/index.vue").default,
            props: true,
        },
        {
            path: "/administracion/cajas/movimiento_cajas",
            name: "cajas.MovimientoCajas",
            component: require("./components/modulos/cajas/MovimientoCajas.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/cajas/movimiento_cajas/:id",
            name: "movimiento_cajas.cajas",
            component: require("./components/modulos/cajas/Cajas.vue").default,
            props: true,
        },

        // Repositorios
        {
            path: "/administracion/repositorios",
            name: "repositorios.index",
            component: require("./components/modulos/repositorios/index.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/repositorios/subir_archivos/:id",
            name: "repositorios.subir_archivos",
            component:
                require("./components/modulos/repositorios/SubirArchivos.vue")
                    .default,
            props: true,
        },

        // Admin Productos
        {
            path: "/administracion/admin_productos",
            name: "admin_productos.index",
            component: require("./components/modulos/admin_productos/index.vue")
                .default,
            props: true,
        },

        // ingreso_productos
        {
            path: "/administracion/ingreso_productos",
            name: "ingreso_productos.index",
            component:
                require("./components/modulos/ingreso_productos/index.vue")
                    .default,
            props: true,
        },

        // salida_productos
        {
            path: "/administracion/salida_productos",
            name: "salida_productos.index",
            component:
                require("./components/modulos/salida_productos/index.vue")
                    .default,
            props: true,
        },

        // clientes
        {
            path: "/administracion/clientes",
            name: "clientes.index",
            component: require("./components/modulos/clientes/index.vue")
                .default,
            props: true,
        },

        // solicitud_pedidos
        {
            path: "/administracion/solicitud_pedidos",
            name: "solicitud_pedidos.index",
            component:
                require("./components/modulos/solicitud_pedidos/index.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/solicitud_pedidos/create",
            name: "solicitud_pedidos.create",
            component:
                require("./components/modulos/solicitud_pedidos/create.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/solicitud_pedidos/:id",
            name: "solicitud_pedidos.edit",
            component:
                require("./components/modulos/solicitud_pedidos/edit.vue")
                    .default,
            props: true,
        },

        // distribucion_pedidos
        {
            path: "/administracion/distribucion_pedidos",
            name: "distribucion_pedidos.index",
            component:
                require("./components/modulos/distribucion_pedidos/index.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/distribucion_pedidos/create",
            name: "distribucion_pedidos.create",
            component:
                require("./components/modulos/distribucion_pedidos/create.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/distribucion_pedidos/:id",
            name: "distribucion_pedidos.edit",
            component:
                require("./components/modulos/distribucion_pedidos/edit.vue")
                    .default,
            props: true,
        },

        // recepcion_pedidos
        {
            path: "/administracion/recepcion_pedidos",
            name: "recepcion_pedidos.index",
            component:
                require("./components/modulos/recepcion_pedidos/index.vue")
                    .default,
            props: true,
        },

        // tarifa_pagos
        {
            path: "/administracion/tarifa_pagos",
            name: "tarifa_pagos.index",
            component: require("./components/modulos/tarifa_pagos/index.vue")
                .default,
            props: true,
        },

        // materials
        {
            path: "/administracion/materials",
            name: "materials.index",
            component: require("./components/modulos/materials/index.vue")
                .default,
            props: true,
        },

        // ingreso_materials
        {
            path: "/administracion/ingreso_materials",
            name: "ingreso_materials.index",
            component:
                require("./components/modulos/ingreso_materials/index.vue")
                    .default,
            props: true,
        },

        // salida_materials
        {
            path: "/administracion/salida_materials",
            name: "salida_materials.index",
            component:
                require("./components/modulos/salida_materials/index.vue")
                    .default,
            props: true,
        },

        // Configuración
        {
            path: "/administracion/configuracion",
            name: "configuracion",
            component: require("./components/modulos/configuracion/index.vue")
                .default,
            props: true,
        },

        // Reportes
        {
            path: "/administracion/reportes/usuarios",
            name: "reportes.usuarios",
            component: require("./components/modulos/reportes/usuarios.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/reportes/cajas",
            name: "reportes.cajas",
            component: require("./components/modulos/reportes/cajas.vue")
                .default,
            props: true,
        },

        // PÁGINA NO ENCONTRADA
        {
            path: "*",
            component: require("./components/modulos/errors/404.vue").default,
        },
    ],
    mode: "history",
    linkActiveClass: "active open",
});
