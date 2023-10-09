<template>
    <!-- Blog -->
    <section class="sec-blog bg0 p-b-90 contenedor_actividades fondo_seccion">
        <div class="container-fluid p-0 mb-4">
            <div class="bg-dark">
                <h2
                    class="ltext-105 cl5 txt-center respon1 text-warning pt-3 pb-3"
                >
                    ACTIVIDADES
                </h2>
            </div>
        </div>
        <div class="container wow fadeInUp bg-dark p-4" wow-data-delay="0.2s">
            <div class="row pb-3">
                <div class="col-md-6 ml-auto mr-auto">
                    <div class="input-group">
                        <input
                            type="text"
                            v-model="search"
                            placeholder="Buscar..."
                            @keyup="searchActividades"
                            class="form-control"
                        />
                        <span class="input-group-append">
                            <button
                                class="btn btn-warning"
                                @click="searchActividades"
                            >
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
            <b-skeleton-wrapper :loading="loading">
                <template #loading>
                    <b-row>
                        <b-col cols="3">
                            <b-skeleton-img></b-skeleton-img>
                        </b-col>
                        <b-col cols="3">
                            <b-skeleton-img></b-skeleton-img>
                        </b-col>
                        <b-col cols="3">
                            <b-skeleton-img></b-skeleton-img>
                        </b-col>
                        <b-col cols="3">
                            <b-skeleton-img></b-skeleton-img>
                        </b-col>
                    </b-row>
                    <b-row class="mt-4 pb-5">
                        <b-col cols="3">
                            <b-skeleton-img></b-skeleton-img>
                        </b-col>
                        <b-col cols="3">
                            <b-skeleton-img></b-skeleton-img>
                        </b-col>
                        <b-col cols="3">
                            <b-skeleton-img></b-skeleton-img>
                        </b-col>
                        <b-col cols="3">
                            <b-skeleton-img></b-skeleton-img>
                        </b-col>
                    </b-row>
                </template>
                <div class="row" v-if="listActividades.length > 0">
                    <div
                        class="col-sm-6 col-md-4 p-b-40"
                        v-for="item in listActividades"
                    >
                        <div class="blog-item">
                            <div class="hov-img0">
                                <router-link
                                    :to="{
                                        name: 'portal.actividad',
                                        params: { id: item.id },
                                    }"
                                >
                                    <img
                                        :src="item.url_imagen"
                                        alt="IMG-ACTIIDAD"
                                    />
                                </router-link>
                            </div>

                            <div class="p-t-15 descripcion_actividad">
                                <!-- <h4 class="p-b-12">
                                <a
                                    href=""
                                    class="mtext-101 cl2 hov-cl1 trans-04"
                                >
                                    SOCIOS
                                </a>
                            </h4> -->

                                <p
                                    class="stext-108 cl6"
                                    v-text="item.descripcion"
                                ></p>
                                <router-link
                                    :to="{
                                        name: 'portal.actividad',
                                        params: { id: item.id },
                                    }"
                                    class="btn btn-warning btn-xs btn-block mt-1"
                                >
                                    Ver más
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pb-5" v-else>
                    <div class="col-md-12">
                        <h4 class="text-center text-white">
                            No se encontrarón registros
                        </h4>
                    </div>
                </div>
            </b-skeleton-wrapper>
            <div class="row" v-if="!loading && listActividades.length > 0">
                <div class="col-md-12 pb-3 paginacion_portal">
                    <b-pagination
                        class="rounded-0"
                        align="center"
                        v-model="currentPage"
                        :total-rows="rows"
                        :per-page="perPage"
                        aria-controls="my-table"
                    ></b-pagination>
                </div>
            </div>
        </div>
    </section>
</template>
<script>
export default {
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_asset: "",
            listActividades: [],
            currentPage: 1,
            rows: 12,
            perPage: 5,
            search: "",
            setTimeOutSearch: null,
            loading: false,
        };
    },
    watch: {
        currentPage(newVal) {
            this.getActividades(newVal);
        },
    },
    mounted() {
        this.loadingWindow.close();
        this.getUrlAsset();
        this.getActividades();
    },
    methods: {
        getUrlAsset() {
            axios.get(main_url + "/url_asset").then((response) => {
                this.url_asset = response.data;
            });
        },
        getActividades(page = 1) {
            this.loading = true;
            axios
                .get(main_url + "/portal/listaActividades", {
                    params: {
                        page: page,
                        texto: this.search,
                    },
                })
                .then((response) => {
                    this.listActividades = response.data.actividads.data;
                    this.rows = response.data.actividads.total;
                    this.perPage = response.data.per_page;
                    let self = this;
                    setTimeout(function () {
                        self.loading = false;
                    }, 300);
                });
        },
        searchActividades() {
            this.loading = true;
            clearInterval(this.setTimeOutSearch);
            let self = this;
            this.setTimeOutSearch = setTimeout(function () {
                self.getActividades();
            }, 600);
        },
    },
};
</script>
<style>
.contenedor_actividades .blog-item {
    overflow: hidden;
}
.contenedor_actividades .blog-item .hov-img0 a {
    display: flex;
    height: 350px;
    overflow: hidden;
}
.contenedor_actividades .blog-item .descripcion_actividad {
    padding: 10px;
    border-left: solid 1px var(--secundario);
    border-bottom: solid 1px var(--secundario);
    border-right: solid 1px var(--secundario);
    border-radius: 0px 0px 10px 10px;
    background: white;
}
.contenedor_actividades .blog-item .descripcion_actividad p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 0.85em;
    color: var(--secundario);
    display: block;
    display: -webkit-box;
    max-width: 100%;
    height: 80px;
    margin: 0 auto;
    text-align: justify;
    line-height: 1.5;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
