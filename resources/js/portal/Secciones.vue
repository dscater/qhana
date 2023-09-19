<template>
    <!-- Blog -->
    <section class="sec-blog bg0 p-t-60 p-b-90">
        <div class="container">
            <div class="p-b-66">
                <h2 class="ltext-105 cl5 txt-center respon1">SECCIONES</h2>
            </div>

            <div class="row">
                <div class="col-sm-6 col-md-4 p-b-40">
                    <div class="blog-item">
                        <div class="hov-img0">
                            <a href="">
                                <img
                                    :src="url_asset + 'imgs/secciones/1.png'"
                                    alt="IMG-BLOG"
                                />
                            </a>
                        </div>

                        <div class="p-t-15">
                            <h4 class="p-b-12">
                                <a
                                    href=""
                                    class="mtext-101 cl2 hov-cl1 trans-04"
                                >
                                    SOCIOS
                                </a>
                            </h4>

                            <p class="stext-108 cl6">
                                Duis ut velit gravida nibh bibendum commodo.
                                Suspendisse pellentesque mattis augue id
                                euismod. Interdum et male-suada fames
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4 p-b-40">
                    <div class="blog-item">
                        <div class="hov-img0">
                            <a href="">
                                <img
                                    :src="url_asset + 'imgs/secciones/2.png'"
                                    alt="IMG-BLOG"
                                />
                            </a>
                        </div>

                        <div class="p-t-15">
                            <h4 class="p-b-12">
                                <a
                                    href=""
                                    class="mtext-101 cl2 hov-cl1 trans-04"
                                >
                                    COMERCIO
                                </a>
                            </h4>

                            <p class="stext-108 cl6">
                                Nullam scelerisque, lacus sed consequat laoreet,
                                dui enim iaculis leo, eu viverra ex nulla in
                                tellus. Nullam nec ornare tellus, ac fringilla
                                lacus. Ut sit ame
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4 p-b-40">
                    <div class="blog-item">
                        <div class="hov-img0">
                            <a href="">
                                <img
                                    :src="url_asset + 'imgs/secciones/3.png'"
                                    alt="IMG-BLOG"
                                />
                            </a>
                        </div>

                        <div class="p-t-15">
                            <h4 class="p-b-12">
                                <a
                                    href=""
                                    class="mtext-101 cl2 hov-cl1 trans-04"
                                >
                                    PROCESO
                                </a>
                            </h4>

                            <p class="stext-108 cl6">
                                Proin nec vehicula lorem, a efficitur ex. Nam
                                vehicula nulla vel erat tincidunt, sed hendrerit
                                ligula porttitor. Fusce sit amet maximus nunc
                            </p>
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
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getUrlAsset();
    },
    methods: {
        getUrlAsset() {
            axios.get("/url_asset").then((response) => {
                this.url_asset = response.data;
            });
        },
    },
};
</script>
