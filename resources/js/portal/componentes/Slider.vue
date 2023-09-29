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
    mounted() {
        this.initSlick1();
    },
    methods: {
        initSlick1() {
            $(".wrap-slick1").each(function () {
                var wrapSlick1 = $(this);
                var slick1 = $(this).find(".slick1");

                var itemSlick1 = $(slick1).find(".item-slick1");
                var layerSlick1 = $(slick1).find(".layer-slick1");
                var actionSlick1 = [];

                $(slick1).on("init", function () {
                    var layerCurrentItem = $(itemSlick1[0]).find(
                        ".layer-slick1"
                    );

                    for (var i = 0; i < actionSlick1.length; i++) {
                        clearTimeout(actionSlick1[i]);
                    }

                    $(layerSlick1).each(function () {
                        $(this).removeClass(
                            $(this).data("appear") + " visible-true"
                        );
                    });

                    for (var i = 0; i < layerCurrentItem.length; i++) {
                        actionSlick1[i] = setTimeout(
                            function (index) {
                                $(layerCurrentItem[index]).addClass(
                                    $(layerCurrentItem[index]).data("appear") +
                                        " visible-true"
                                );
                            },
                            $(layerCurrentItem[i]).data("delay"),
                            i
                        );
                    }
                });

                var showDot = false;
                if ($(wrapSlick1).find(".wrap-slick1-dots").length > 0) {
                    showDot = true;
                }

                $(slick1).slick({
                    pauseOnFocus: false,
                    pauseOnHover: false,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    fade: true,
                    speed: 1000,
                    infinite: true,
                    autoplay: true,
                    autoplaySpeed: 6000,
                    arrows: true,
                    appendArrows: $(wrapSlick1),
                    prevArrow:
                        '<button class="arrow-slick1 prev-slick1"><i class="zmdi zmdi-caret-left"></i></button>',
                    nextArrow:
                        '<button class="arrow-slick1 next-slick1"><i class="zmdi zmdi-caret-right"></i></button>',
                    dots: showDot,
                    appendDots: $(wrapSlick1).find(".wrap-slick1-dots"),
                    dotsClass: "slick1-dots",
                    customPaging: function (slick, index) {
                        var linkThumb = $(slick.$slides[index]).data("thumb");
                        var caption = $(slick.$slides[index]).data("caption");
                        return (
                            '<img src="' +
                            linkThumb +
                            '">' +
                            '<span class="caption-dots-slick1">' +
                            caption +
                            "</span>"
                        );
                    },
                });

                $(slick1).on(
                    "afterChange",
                    function (event, slick, currentSlide) {
                        var layerCurrentItem = $(itemSlick1[currentSlide]).find(
                            ".layer-slick1"
                        );

                        for (var i = 0; i < actionSlick1.length; i++) {
                            clearTimeout(actionSlick1[i]);
                        }

                        $(layerSlick1).each(function () {
                            $(this).removeClass(
                                $(this).data("appear") + " visible-true"
                            );
                        });

                        for (var i = 0; i < layerCurrentItem.length; i++) {
                            actionSlick1[i] = setTimeout(
                                function (index) {
                                    $(layerCurrentItem[index]).addClass(
                                        $(layerCurrentItem[index]).data(
                                            "appear"
                                        ) + " visible-true"
                                    );
                                },
                                $(layerCurrentItem[i]).data("delay"),
                                i
                            );
                        }
                    }
                );
            });
        },
    },
};
</script>
