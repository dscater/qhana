<template>
    <!-- Blog -->
    <section class="sec-blog bg0 p-t-60 p-b-90 contenedor_actividades">
        <div class="container">
            <div class="p-b-66">
                <h2 class="ltext-105 cl5 txt-center respon1">ACTIVIDADES</h2>
            </div>

            <div class="row">
                <div
                    class="col-sm-6 col-md-4 p-b-40"
                    v-for="item in listActividades"
                >
                    <div class="blog-item">
                        <div class="hov-img0">
                            <a href="">
                                <img
                                    :src="item.url_imagen"
                                    alt="IMG-ACTIIDAD"
                                />
                            </a>
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
                            <a
                                href="product.html"
                                class="btn btn-warning btn-xs btn-block mt-1"
                            >
                                Ver más
                            </a>
                        </div>
                    </div>
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
        };
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
        getActividades() {
            axios.get(main_url + "/portal/getActividades").then((response) => {
                this.listActividades = response.data.actividads;
            });
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
    background: var(--secundario);
}
.contenedor_actividades .blog-item .descripcion_actividad p {
    color: white;
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
