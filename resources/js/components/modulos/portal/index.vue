<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar portal</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{ name: 'admin_portal.actividades' }"
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong>Actividades</strong></router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{ name: 'admin_portal.actividades' }"
                                class="card-body link_body"
                            >
                                <img
                                    :src="
                                        url_principal +
                                        '/imgs/fondo_actividades.png'
                                    "
                                    alt=""
                                />
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{ name: 'admin_portal.nosotros' }"
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong>Nosotros: </strong> Historia,
                                    Misión y Visión</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{ name: 'admin_portal.nosotros' }"
                                class="card-body link_body"
                            >
                                <img
                                    :src="
                                        url_principal +
                                        '/imgs/fondo_nosotros.png'
                                    "
                                    alt=""
                                />
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{ name: 'admin_portal.contactos' }"
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong>Contactos: </strong> Dirección,
                                    Teléfonos, Correo y Mapa</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{ name: 'admin_portal.contactos' }"
                                class="card-body link_body"
                            >
                                <img
                                    :src="
                                        url_principal +
                                        '/imgs/fondo_direccion.jpg'
                                    "
                                    alt=""
                                />
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{ name: 'admin_portal.banners' }"
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong>Inicio: </strong>
                                    Banners</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{ name: 'admin_portal.banners' }"
                                class="card-body link_body"
                            >
                                <img
                                    :src="
                                        url_principal + '/imgs/fondo_banner.png'
                                    "
                                    alt=""
                                />
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'admin_portal.redes_sociales',
                                    }"
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong
                                        >Redes Sociales</strong
                                    ></router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{ name: 'admin_portal.redes_sociales' }"
                                class="card-body link_body"
                            >
                                <img
                                    :src="
                                        url_principal + '/imgs/fondo_social.jpg'
                                    "
                                    alt=""
                                />
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    components: {},
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
        };
    },
    mounted() {
        this.loadingWindow.close();
    },
    methods: {},
};
</script>

<style>
.link_body {
    padding: 0px;
}

.link_body img {
    width: 100%;
}

.card_portal .card-body {
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
}
.card_portal .card-header a {
    width: calc(100% - 31px);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
