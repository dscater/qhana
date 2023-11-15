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
