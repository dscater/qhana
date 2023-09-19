<template>
    <!-- Blog -->
    <section class="sec-blog bg0 p-t-60 p-b-90">
        <div class="container">
            <div class="flex-w flex-tr">
                <div
                    class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md"
                >
                    <form>
                        <h4 class="mtext-105 cl2 txt-center p-b-30">
                            Escribenos
                        </h4>

                        <div class="bor8 m-b-20 how-pos4-parent">
                            <input
                                class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30"
                                type="text"
                                name="email"
                                placeholder="Tú correo"
                            />
                            <img
                                class="how-pos4 pointer-none"
                                src="images/icons/icon-email.png"
                                alt="ICON"
                            />
                        </div>

                        <div class="bor8 m-b-30">
                            <textarea
                                class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25"
                                name="msg"
                                placeholder="Mensaje"
                            ></textarea>
                        </div>

                        <button
                            class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
                        >
                            Enviar
                        </button>
                    </form>
                </div>

                <div
                    class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md"
                >
                    <div class="flex-w w-full p-b-42">
                        <span class="fs-18 cl5 txt-center size-211">
                            <span class="lnr lnr-map-marker"></span>
                        </span>

                        <div class="size-212 p-t-2">
                            <span class="mtext-110 cl2"> Dirección </span>

                            <p class="stext-115 cl6 size-213 p-t-18">
                                Coza Store Center 8th floor, 379 Hudson St, New
                                York, NY 10018 US
                            </p>
                        </div>
                    </div>

                    <div class="flex-w w-full p-b-42">
                        <span class="fs-18 cl5 txt-center size-211">
                            <span class="lnr lnr-phone-handset"></span>
                        </span>

                        <div class="size-212 p-t-2">
                            <span class="mtext-110 cl2"> Teléfono </span>

                            <p class="stext-115 cl1 size-213 p-t-18">
                                +1 800 1236879
                            </p>
                        </div>
                    </div>

                    <div class="flex-w w-full">
                        <span class="fs-18 cl5 txt-center size-211">
                            <span class="lnr lnr-envelope"></span>
                        </span>

                        <div class="size-212 p-t-2">
                            <span class="mtext-110 cl2"> Correo1 </span>

                            <p class="stext-115 cl1 size-213 p-t-18">
                                contact@example.com
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
