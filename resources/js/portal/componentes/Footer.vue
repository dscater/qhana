<template>
    <!-- Footer -->
    <footer class="bg3 p-t-75 p-b-32">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-3 p-b-50 offset-md-3">
                    <h4 class="stext-301 cl0 p-b-30">QHANA BOLIVIA</h4>

                    <p class="stext-107 cl7 size-201 text-justify">
                        Bienvenidos al sitio oficial de Qhana Bolivia. Por
                        trecientos años la región de Los Andes dentro de Bolivia
                        ha sido uno de los lugares más productores de excelentes
                        textiles.
                    </p>

                    <div class="p-t-27">
                        <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                            <i class="fab fa-facebook fa-lg"></i>
                        </a>

                        <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                            <i class="fab fa-instagram fa-lg"></i>
                        </a>

                        <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                            <i class="fab fa-twitter fa-lg"></i>
                        </a>
                    </div>
                </div>

                <div class="col-sm-6 col-lg-3 p-b-50">
                    <img :src="logo" alt="Logo" width="100%" />
                </div>
            </div>

            <div class="p-t-40">
                <p class="stext-107 cl6 txt-center">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy; {{ getAnioActual() }} Todos los derechos
                    reservados |
                    <a href="" class="text-warning">{{ empresa }}</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
                <p class="stext-107 cl6 txt-center oculto">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy; {{ getAnioActual() }} All rights reserved |
                    Made with
                    <i class="fa fa-heart-o" aria-hidden="true"></i> by
                    <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    &amp; distributed by
                    <a href="https://themewagon.com" target="_blank"
                        >ThemeWagon</a
                    >
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>
    </footer>
</template>
<script>
export default {
    props: ["logo", "empresa"],
    data() {
        return {};
    },
};
</script>
