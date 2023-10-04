<template>
    <!-- Blog -->
    <section class="sec-blog bg0 p-t-60 p-b-90 contenedor_nosotros fondo_seccion">
        <div class="container">
            <div class="p-b-66">
                <h2 class="ltext-105 cl5 txt-center respon1">NOSOTROS</h2>
            </div>

            <div class="row">
                <div
                    class="col-sm-6 col-md-4 p-b-40"
                    v-if="oNosotros.historia != ''"
                >
                    <div class="blog-item">
                        <div class="hov-img0">
                            <a href="">
                                <img
                                    :src="url_asset + 'imgs/secciones/1.png'"
                                    alt="IMG-BLOG"
                                />
                            </a>
                        </div>

                        <div class="p-t-15 descripcion_nosotros">
                            <h4 class="p-b-12">
                                <span class="mtext-101 cl2 hov-cl1 trans-04">
                                    HISTORIA
                                </span>
                            </h4>

                            <p
                                class="stext-108 cl6 text-justify"
                                v-text="oNosotros.historia"
                            ></p>
                        </div>
                    </div>
                </div>

                <div
                    class="col-sm-6 col-md-4 p-b-40"
                    v-if="oNosotros.mision != ''"
                >
                    <div class="blog-item">
                        <div class="hov-img0">
                            <a href="">
                                <img
                                    :src="url_asset + 'imgs/secciones/2.png'"
                                    alt="IMG-BLOG"
                                />
                            </a>
                        </div>

                        <div class="p-t-15 descripcion_nosotros">
                            <h4 class="p-b-12">
                                <span class="mtext-101 cl2 hov-cl1 trans-04">
                                    MISIÓN
                                </span>
                            </h4>

                            <p
                                class="stext-108 cl6 text-justify"
                                v-text="oNosotros.mision"
                            ></p>
                        </div>
                    </div>
                </div>

                <div
                    class="col-sm-6 col-md-4 p-b-40"
                    v-if="oNosotros.vision != ''"
                >
                    <div class="blog-item">
                        <div class="hov-img0">
                            <a href="">
                                <img
                                    :src="url_asset + 'imgs/secciones/3.png'"
                                    alt="IMG-BLOG"
                                />
                            </a>
                        </div>

                        <div class="p-t-15 descripcion_nosotros">
                            <h4 class="p-b-12">
                                <span class="mtext-101 cl2 hov-cl1 trans-04">
                                    VISIÓN
                                </span>
                            </h4>

                            <p
                                class="stext-108 cl6 text-justify"
                                v-text="oNosotros.vision"
                            ></p>
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
            oNosotros: {
                historia: "QHANA",
                mision: "",
                vision: "",
            },
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getUrlAsset();
        this.getInfoNosotros();
    },
    methods: {
        getUrlAsset() {
            axios.get(main_url + "/url_asset").then((response) => {
                this.url_asset = response.data;
            });
        },
        getInfoNosotros() {
            axios.get(main_url + "/portal/getNosotros").then((response) => {
                this.oNosotros = response.data.nosotros;
            });
        },
    },
};
</script>
<style>
.contenedor_nosotros .blog-item .descripcion_nosotros {
    padding: 10px;
    border-left: solid 1px var(--secundario);
    border-bottom: solid 1px var(--secundario);
    border-right: solid 1px var(--secundario);
    border-radius: 0px 0px 10px 10px;
    background: var(--secundario);
}

.contenedor_nosotros .blog-item .descripcion_nosotros p,
.contenedor_nosotros .blog-item .descripcion_nosotros h4,
.contenedor_nosotros .blog-item .descripcion_nosotros h4 span,
.contenedor_nosotros .blog-item .descripcion_nosotros h4 a {
    color: white;
}
</style>
