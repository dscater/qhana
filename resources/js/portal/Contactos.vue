<template>
    <div>
        <!-- Map -->
        <div class="map">
            <div id="google_map" v-html="oContacto?.mapa"></div>
        </div>
        <section class="sec-blog bg0 p-t-60 p-b-90 fondo_seccion">
            <div class="container">
                <div class="flex-w flex-tr">
                    <div
                        class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md bg-dark"
                    >
                        <form>
                            <h4 class="mtext-105 cl0 txt-center p-b-30">
                                Escribenos
                            </h4>

                            <span
                                v-if="errors.correo"
                                class="error invalid-feedback d-block"
                                v-text="errors.correo[0]"
                            ></span>
                            <div class="bor8 m-b-20 how-pos4-parent">
                                <input
                                    class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30"
                                    type="text"
                                    name="email"
                                    placeholder="Tú correo"
                                    v-model="oCorreo.correo"
                                    :class="{
                                        'is-invalid': errors.correo,
                                    }"
                                />
                                <img
                                    class="how-pos4 pointer-none"
                                    src="images/icons/icon-email.png"
                                    alt="ICON"
                                />
                            </div>
                            <span
                                v-if="errors.mensaje"
                                class="error invalid-feedback d-block"
                                v-text="errors.mensaje[0]"
                            ></span>
                            <div class="bor8 m-b-30">
                                <textarea
                                    class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25"
                                    name="msg"
                                    placeholder="Mensaje"
                                    v-model="oCorreo.mensaje"
                                    :class="{
                                        'is-invalid': errors.mensaje,
                                    }"
                                ></textarea>
                            </div>
                            <button
                                type="button"
                                class="flex-c-m stext-101 cl2 size-121 bg0 bor1 hov-btn3 p-lr-15 trans-04 pointer"
                                @click="prepararEnvio"
                                :disabled="enviando"
                                v-text="txtBoton"
                            ></button>
                        </form>
                    </div>

                    <div
                        class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md bg-dark"
                        v-if="oContacto"
                    >
                        <div class="flex-w w-full p-b-42">
                            <span class="fs-18 cl5 txt-center size-211">
                                <span class="lnr lnr-map-marker"></span>
                            </span>

                            <div class="size-212 p-t-2">
                                <span class="mtext-110 cl0"> Dirección </span>

                                <p
                                    class="stext-115 cl1 size-213 p-t-18"
                                    v-text="oContacto.direccion"
                                ></p>
                            </div>
                        </div>

                        <div class="flex-w w-full p-b-42">
                            <span class="fs-18 cl5 txt-center size-211">
                                <span class="lnr lnr-phone-handset"></span>
                            </span>

                            <div class="size-212 p-t-2">
                                <span class="mtext-110 cl0"> Teléfonos </span>

                                <p
                                    class="stext-115 cl1 size-213 p-t-18"
                                    v-text="oContacto.fonos"
                                ></p>
                            </div>
                        </div>

                        <div class="flex-w w-full">
                            <span class="fs-18 cl5 txt-center size-211">
                                <span class="lnr lnr-envelope"></span>
                            </span>

                            <div class="size-212 p-t-2">
                                <span class="mtext-110 cl0"> Correo </span>

                                <p
                                    class="stext-115 cl1 size-213 p-t-18"
                                    v-text="oContacto.correo"
                                ></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
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
            oContacto: null,
            oCorreo: {
                correo: "",
                mensaje: "",
            },
            errors: [],
            enviando: false,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getUrlAsset();
        this.getInfoContacto();
    },
    computed: {
        txtBoton() {
            if (this.enviando) {
                return "ENVIANDO...";
            }
            return "ENVIAR";
        },
    },
    methods: {
        getUrlAsset() {
            axios.get(main_url + "/url_asset").then((response) => {
                this.url_asset = response.data;
            });
        },
        getInfoContacto() {
            axios.get(main_url + "/portal/getContacto").then((response) => {
                this.oContacto = response.data.contacto;
            });
        },
        // cargaMapaGoogle(lat, lng, drag = false, dir = "") {
        //     lat = parseFloat(lat);
        //     lng = parseFloat(lng);

        //     // Inicializa el mapa
        //     this.map = new google.maps.Map(
        //         document.getElementById("google_map"),
        //         {
        //             center: { lat: lat, lng: lng },
        //             zoom: 18,
        //         }
        //     );

        //     // Configura el icono personalizado
        //     const customIcon = {
        //         url: main_url + "/imgs/pinmap.gif", // Ruta a tu icono personalizado
        //         scaledSize: new google.maps.Size(50, 50), // Tamaño del icono
        //     };

        //     // Crea un marcador en el centro del mapa
        //     this.marker = new google.maps.Marker({
        //         position: { lat: lat, lng: lng },
        //         map: this.map,
        //         icon: customIcon,
        //         draggable: drag,
        //     });

        //     // Escucha el evento de arrastrar del marcador
        //     google.maps.event.addListener(this.marker, "dragend", () => {
        //         const newPosition = this.marker.getPosition();
        //         this.oContacto.lat = newPosition.lat();
        //         this.oContacto.lng = newPosition.lng();
        //     });

        //     if (dir != "") {
        //         // Crea una ventana de información (infowindow) con el contenido deseado
        //         let self = this;
        //         this.infowindow = new google.maps.InfoWindow({
        //             content: `<strong>DIRECCIÓN:</strong><br>${self.oContacto.direccion}`,
        //         });
        //         // Escucha el evento 'click' en el marcador para abrir la ventana de información
        //         this.marker.addListener("click", () => {
        //             this.infowindow.open(this.map, this.marker);
        //         });
        //     }
        // },
        prepararEnvio() {
            this.enviando = true;
            let self = this;
            this.errors = [];
            setTimeout(function () {
                self.enviarCorreo();
            }, 500);
        },
        enviarCorreo() {
            axios
                .post(main_url + "/portal/enviarcorreo", this.oCorreo)
                .then((response) => {
                    Swal.fire({
                        icon: "success",
                        title: "¡Correcto!",
                        html: response.data.message,
                        showConfirmButton: false,
                        timer: 2000,
                    });
                    this.enviando = false;
                    this.oCorreo.mensaje = "";
                })
                .catch((error) => {
                    this.enviando = false;
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = error.response.data.errors;
                        }
                        if (error.response.status === 500) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: error.response.data.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                        }
                    }
                });
        },
    },
};
</script>
<style>
#google_map iframe {
    width: 100%;
    /* Establece una altura relativa al ancho (aspect ratio) */
    height: 100%;
    padding-bottom: 0; /* Esto es un aspect ratio de 4:3 (3/4 * 100%) */
}
</style>
