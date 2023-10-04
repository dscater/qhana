<template>
    <!-- Blog -->
    <section class="sec-blog bg0 p-b-90 contenedor_actividad fondo_seccion">
        <div class="container-fluid p-0 mb-4">
            <div class="bg-dark">
                <h2
                    class="ltext-105 cl5 txt-center respon1 text-warning pt-3 pb-3"
                >
                    ACTIVIDADES
                </h2>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12" v-if="oActividad">
                    <div class="row">
                        <div class="img_actividad col-md-6 p-0">
                            <img
                                :src="oActividad.url_imagen"
                                alt="IMG-ACTIIDAD"
                            />
                        </div>
                        <div class="p-t-15 descripcion_actividad col-md-6 p-0">
                            <p
                                class="stext-108 cl6 p-4"
                                v-text="oActividad.descripcion"
                            ></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mt-4">
                    <router-link
                        :to="{
                            name: 'portal.actividads',
                        }"
                        class="btn btn-warning btn-xs btn-block mt-1"
                    >
                        Volver a Actividades
                    </router-link>
                </div>
            </div>
        </div>
    </section>
</template>
<script>
export default {
    props: ["id"],
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_asset: "",
            oActividad: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getUrlAsset();
        this.getActividad();
    },
    methods: {
        getUrlAsset() {
            axios.get(main_url + "/url_asset").then((response) => {
                this.url_asset = response.data;
            });
        },
        getActividad() {
            axios
                .get(main_url + "/portal/getActividad/" + this.id)
                .then((response) => {
                    this.oActividad = response.data.actividad;
                });
        },
    },
};
</script>
<style>
.contenedor_actividad .descripcion_actividad {
    padding: 10px;
    background: white;
}
.contenedor_actividad .descripcion_actividad p {
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
