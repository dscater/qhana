<template>
    <!-- Slider -->
    <section class="section-slide">
        <div class="wrap-slick1 rs1-slick1">
            <div class="slick1">
                <div
                    class="item-slick1"
                    :style="
                        'background-image: url(' +
                        ruta_asset +
                        'imgs/sliders/1.png)'
                    "
                >
                    <!-- <div class="container-fluid h-full info_slider">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30">
                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="fadeInDown"
                                data-delay="0"
                            >
                                <span class="ltext-202 respon2">
                                    Men Collection 2018
                                </span>
                            </div>

                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="fadeInUp"
                                data-delay="800"
                            >
                                <h2 class="ltext-104 p-t-19 p-b-43 respon1">
                                    New arrivals
                                </h2>
                            </div>

                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="zoomIn"
                                data-delay="1600"
                            >
                                <a
                                    href="product.html"
                                    class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"
                                >
                                    Comprar ahora
                                </a>
                            </div>
                        </div>
                    </div> -->
                </div>

                <div
                    class="item-slick1"
                    :style="
                        'background-image: url(' +
                        ruta_asset +
                        'imgs/sliders/2.png)'
                    "
                >
                    <div class="container-fluid h-full info_slider">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30">
                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="rollIn"
                                data-delay="0"
                            >
                                <span class="ltext-202 respon2">
                                    Nueva colección
                                </span>
                            </div>

                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="lightSpeedIn"
                                data-delay="800"
                            >
                                <h2 class="ltext-104 p-t-19 p-b-43 respon1">
                                    Jackets & Coats
                                </h2>
                            </div>

                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="slideInUp"
                                data-delay="1600"
                            >
                                <a
                                    href="product.html"
                                    class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"
                                >
                                    Comprar ahora
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    class="item-slick1"
                    :style="
                        'background-image: url(' +
                        ruta_asset +
                        'imgs/sliders/3.png)'
                    "
                >
                    <div class="container-fluid h-full info_slider">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30">
                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="rotateInDownLeft"
                                data-delay="0"
                            >
                                <span class="ltext-202 respon2">
                                    Colección 2023
                                </span>
                            </div>

                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="rotateInUpRight"
                                data-delay="800"
                            >
                                <h2 class="ltext-104 p-t-19 p-b-43 respon1">
                                    NUEVA TEMPORADA
                                </h2>
                            </div>

                            <div
                                class="layer-slick1 animated visible-false"
                                data-appear="rotateIn"
                                data-delay="1600"
                            >
                                <a
                                    href="product.html"
                                    class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"
                                >
                                    Comprar ahora
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
<script>
export default {
    props: ["ruta_asset"],
    data() {
        return {};
    },
    mounted() {},
};
</script>
