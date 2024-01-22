<template>
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-warning">
        <!-- Brand Logo -->
        <router-link
            exact
            :to="{ name: 'inicio' }"
            class="brand-link bg-orange"
        >
            <img
                :src="configuracion.path_image"
                alt="Logo"
                class="brand-image img-circle elevation-3"
                style="opacity: 0.8"
            />
            <span
                class="brand-text font-weight-light"
                v-text="configuracion.alias"
            ></span>
        </router-link>

        <!-- Sidebar -->
        <div class="sidebar p-0">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img
                        :src="user_sidebar.path_image"
                        class="img-circle elevation-2"
                        alt="User Image"
                    />
                </div>
                <div class="info">
                    <router-link
                        exact
                        :to="{
                            name: 'usuarios.perfil',
                            params: { id: user.id },
                        }"
                        class="d-block"
                        v-text="user_sidebar.full_name"
                    ></router-link>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline pl-1 pr-1">
                <div class="input-group" data-widget="sidebar-search">
                    <input
                        class="form-control form-control-sidebar bg-white"
                        type="search"
                        placeholder="Buscar Modulo"
                        aria-label="Search"
                    />
                    <div class="input-group-append">
                        <button class="btn btn-sidebar bg-white">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2 pr-1 pl-1">
                <ul
                    class="nav nav-pills nav-sidebar flex-column text-xs nav-flat"
                    data-widget="treeview"
                    role="menu"
                    data-accordion="false"
                >
                    <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <router-link
                            exact
                            :to="{ name: 'inicio' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-home"></i>
                            <p>Inicio</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-header font-weight-bold"
                        v-if="
                            permisos.includes('usuarios.index') ||
                            permisos.includes('users.index') ||
                            permisos.includes('conceptos.index') ||
                            permisos.includes('cajas.index') ||
                            permisos.includes('repositorios.index')
                        "
                    >
                        ADMINISTRACIÓN:
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('usuarios.index')"
                    >
                        <router-link
                            exact
                            :to="{ name: 'usuarios.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-users"></i>
                            <p>Personal</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="
                            permisos.includes('admin_productos.index') ||
                            permisos.includes('ingreso_productos.index') ||
                            permisos.includes('salida_productos.index')
                        "
                        :class="[
                            $route.name == 'admin_productos.index' ||
                            $route.name == 'ingreso_productos.index' ||
                            $route.name == 'salida_productos.index'
                                ? 'menu-is-opening menu-open'
                                : '',
                        ]"
                    >
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>
                                Producto Lana
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview pl-2">
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('ingreso_productos.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'ingreso_productos.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Ingreso de Productos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('salida_productos.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'salida_productos.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Salida de Productos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('admin_productos.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'admin_productos.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Producto Lana</p>
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li
                        class="nav-item"
                        v-if="
                            permisos.includes('solicitud_pedidos.index') ||
                            permisos.includes('distribucion_pedidos.index') ||
                            permisos.includes('recepcion_pedidos.index') ||
                            permisos.includes('tarifa_pagos.index')
                        "
                        :class="[
                            $route.name == 'solicitud_pedidos.index' ||
                            $route.name == 'solicitud_pedidos.create' ||
                            $route.name == 'solicitud_pedidos.edit' ||
                            $route.name == 'distribucion_pedidos.index' ||
                            $route.name == 'distribucion_pedidos.create' ||
                            $route.name == 'distribucion_pedidos.edit' ||
                            $route.name == 'recepcion_pedidos.index' ||
                            $route.name == 'recepcion_pedidos.create' ||
                            $route.name == 'recepcion_pedidos.edit' ||
                            $route.name == 'tarifa_pagos.index' ||
                            $route.name == 'tarifa_pagos.create' ||
                            $route.name == 'tarifa_pagos.edit'
                                ? 'menu-is-opening menu-open'
                                : '',
                        ]"
                    >
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-list"></i>
                            <p>
                                Pedidos
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview pl-2">
                            <li
                                class="nav-item"
                                v-if="permisos.includes('tarifa_pagos.index')"
                            >
                                <router-link
                                    :to="{ name: 'tarifa_pagos.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Tarifa de Pagos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('solicitud_pedidos.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'solicitud_pedidos.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Solicitud de Pedidos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'distribucion_pedidos.index'
                                    )
                                "
                            >
                                <router-link
                                    :to="{ name: 'distribucion_pedidos.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Distribución de Pedidos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('recepcion_pedidos.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'recepcion_pedidos.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Recepción de Pedidos</p>
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('clientes.index')"
                    >
                        <router-link
                            :to="{ name: 'clientes.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>Clientes</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="
                            permisos.includes('materials.index') ||
                            permisos.includes('ingreso_materials.index') ||
                            permisos.includes('salida_materials.index')
                        "
                        :class="[
                            $route.name == 'materials.index' ||
                            $route.name == 'ingreso_materials.index' ||
                            $route.name == 'salida_materials.index'
                                ? 'menu-is-opening menu-open'
                                : '',
                        ]"
                    >
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>
                                Materiales
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview pl-2">
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('ingreso_materials.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'ingreso_materials.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Ingreso de Materiales</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('salida_materials.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'salida_materials.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Salida de Materiales</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('materials.index')"
                            >
                                <router-link
                                    :to="{ name: 'materials.index' }"
                                    class="nav-link"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                >
                                    <i class="nav-icon far fa-circle"></i>
                                    <p>Materiales</p>
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('cajas.index')"
                    >
                        <router-link
                            :to="{ name: 'cajas.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-cash-register"></i>
                            <p>Caja</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('conceptos.index')"
                    >
                        <router-link
                            :to="{ name: 'conceptos.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>Conceptos</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('repositorios.index')"
                    >
                        <router-link
                            :to="{ name: 'repositorios.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-folder-open"></i>
                            <p>Repositorio</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('users.index')"
                    >
                        <router-link
                            :to="{ name: 'users.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-users"></i>
                            <p>Usuarios</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-header font-weight-bold"
                        v-if="
                            permisos.includes('portals.index') ||
                            permisos.includes('catalogos.index') ||
                            permisos.includes('productos.index')
                        "
                    >
                        PORTAL
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('portals.index')"
                    >
                        <router-link
                            :to="{
                                name: 'admin_portal.index',
                            }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fa fa-table"></i>
                            <p>Portal</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('catalogos.index')"
                    >
                        <router-link
                            :to="{ name: 'productos.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fa fa-tags"></i>
                            <p>Productos</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('catalogos.index')"
                    >
                        <router-link
                            exact
                            :to="{ name: 'catalogos.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fa fa-list-alt"></i>
                            <p>Catálogos</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('pedidos.index')"
                    >
                        <router-link
                            :to="{ name: 'pedidos.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-clipboard-list"></i>
                            <p>Pedidos</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-header font-weight-bold"
                        v-if="
                            permisos.includes('reportes.usuarios') ||
                            permisos.includes('reportes.cajas')
                        "
                    >
                        REPORTES:
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('reportes.usuarios')"
                    >
                        <router-link
                            :to="{ name: 'reportes.usuarios' }"
                            class="nav-link"
                        >
                            <i class="fas fa-file-pdf nav-icon"></i>
                            <p>Lista de Usuarios</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('reportes.cajas')"
                    >
                        <router-link
                            :to="{ name: 'reportes.cajas' }"
                            class="nav-link"
                        >
                            <i class="fas fa-file-pdf nav-icon"></i>
                            <p>Caja</p>
                        </router-link>
                    </li>
                    <li class="nav-header font-weight-bold">OTRAS OPCIONES:</li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('configuracion.index')"
                    >
                        <router-link
                            :to="{ name: 'configuracion' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-cog"></i>
                            <p>Configuración</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link
                            exact
                            :to="{
                                name: 'usuarios.perfil',
                                params: { id: user.id },
                            }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-user"></i>
                            <p>Perfil</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <a
                            href="#"
                            class="nav-link"
                            @click.prevent="logout()"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="fas fa-power-off nav-icon"></i>
                            <p>Salir</p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
</template>

<script>
export default {
    props: ["user_sidebar", "configuracion"],
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            fullscreenLoading: false,
            permisos: localStorage.getItem("permisos"),
            timeoutId: null,
        };
    },
    mounted() {
        // Configurar el temporizador para llamar a logout después de 5 minutos de inactividad
        this.resetLogoutTimer();
        window.addEventListener("mousemove", this.resetLogoutTimer);
    },
    methods: {
        logout() {
            this.fullscreenLoading = true;
            axios
                .post(main_url + "/logout")
                .then((res) => {
                    let self = this;
                    setTimeout(function () {
                        self.$router.push({ name: "login" });
                        localStorage.clear();
                        location.reload();
                    }, 500);
                })
                .catch((error) => {
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = error.response.data.errors;
                        }
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            window.location = "/administracion/login";
                        }
                        if (error.response.status === 500) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: error.response.data.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                        }
                    }
                });
        },
        resetLogoutTimer() {
            // Reiniciar el temporizador cuando se detecta actividad
            clearTimeout(this.timeoutId);
            this.timeoutId = setTimeout(() => {
                this.logout();
            }, 10 * 60 * 1000); // 10 minutos en milisegundos
        },
    },
    beforeDestroy() {
        // Limpiar el temporizador y quitar el evento cuando se destruye el componente
        clearTimeout(this.timeoutId);
        window.removeEventListener("mousemove", this.resetLogoutTimer);
    },
};
</script>

<style>
.user-panel .info {
    display: flex;
    height: 100%;
    align-items: center;
}
.user-panel .info a {
    font-size: 0.8em;
}

.main-sidebar .image img {
    min-height: 30px;
}
</style>
