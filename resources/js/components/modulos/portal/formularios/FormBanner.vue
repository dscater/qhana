<template>
    <div
        class="modal fade formulario_banner"
        :class="{ show: bModal }"
        id="modal-default"
        aria-modal="true"
        role="dialog"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                        @click="cierraModal"
                    >
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.img,
                                    }"
                                    >Seleccionar imagen*</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.img,
                                    }"
                                    ref="input_file"
                                    @change="cargaImagen"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.img"
                                    v-text="errors.img[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <div class="contenedor_imagen">
                                    <div class="imagen">
                                        <img
                                            :src="src_imagen_cargada"
                                            alt="Imagen"
                                            v-if="src_imagen_cargada != ''"
                                        />
                                        <div class="vacio" v-else>
                                            Seleccioné una imagen
                                        </div>
                                        <div
                                            class="desc1 text-white"
                                            v-text="banner.desc1"
                                        ></div>
                                        <div
                                            class="desc2 text-white"
                                            v-text="banner.desc2"
                                        ></div>
                                        <div
                                            class="boton_comprar"
                                            v-if="banner.muestra_boton == 1"
                                        >
                                            <button
                                                type="button"
                                                class="btn-xs btn-warning text-white"
                                            >
                                                COMPRAR AHORA
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.desc1,
                                    }"
                                    >Descripción 1</label
                                >
                                <el-input
                                    type="textarea"
                                    placeholder="Descripción 1"
                                    :class="{ 'is-invalid': errors.desc1 }"
                                    v-model="banner.desc1"
                                    autosize
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.desc1"
                                    v-text="errors.desc1[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.desc2,
                                    }"
                                    >Descripción 2</label
                                >
                                <el-input
                                    type="textarea"
                                    placeholder="Descripción 2"
                                    :class="{ 'is-invalid': errors.desc2 }"
                                    v-model="banner.desc2"
                                    autosize
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.desc2"
                                    v-text="errors.desc2[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.posicion,
                                    }"
                                    >Posición*</label
                                >
                                <input
                                    type="number"
                                    min="1"
                                    placeholder="Posición"
                                    class="form-control"
                                    :class="{ 'is-invalid': errors.posicion }"
                                    v-model="banner.posicion"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.posicion"
                                    v-text="errors.posicion[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.muestra_boton,
                                    }"
                                    >Mostrar botón comprar*</label
                                >
                                <el-switch
                                    :class="{
                                        'is-invalid': errors.muestra_boton,
                                    }"
                                    style="display: block"
                                    v-model="banner.muestra_boton"
                                    active-color="#13ce66"
                                    inactive-color="#ff4949"
                                    active-text="SI"
                                    inactive-text="NO"
                                    active-value="1"
                                    inactive-value="0"
                                >
                                </el-switch>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.muestra_boton"
                                    v-text="errors.muestra_boton[0]"
                                ></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-between">
                    <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                        @click="cierraModal"
                    >
                        Cerrar
                    </button>
                    <el-button
                        type="warning"
                        class="bg-warning"
                        :loading="enviando"
                        @click="setRegistroModal()"
                        >{{ textoBoton }}</el-button
                    >
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        muestra_modal: {
            type: Boolean,
            default: false,
        },
        accion: {
            type: String,
            default: "nuevo",
        },
        banner: {
            type: Object,
            default: {
                img: null,
                url_img: "",
                posicion: 1,
                desc1: "",
                desc2: "",
                muestra_boton: "0",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.$refs.input_file.value = null;
                this.bModal = true;
                if (this.accion == "edit") {
                    let self = this;
                    console.log(this.banner);
                    setTimeout(function () {
                        self.src_imagen_cargada = self.banner.url_img;
                    }, 300);
                }
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "AGREGAR BANNER";
            } else {
                return "MODIFICAR REGISTRO";
            }
        },
        textoBoton() {
            if (this.accion == "nuevo") {
                return "Registrar";
            } else {
                return "Actualizar";
            }
        },
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            bModal: this.muestra_modal,
            enviando: false,
            errors: [],
            src_imagen_cargada: "",
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
    },
    methods: {
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/banners";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append("img", this.banner.img ? this.banner.img : "");
                formdata.append(
                    "posicion",
                    this.banner.posicion ? this.banner.posicion : ""
                );
                formdata.append(
                    "desc1",
                    this.banner.desc1 ? this.banner.desc1 : ""
                );
                formdata.append(
                    "desc2",
                    this.banner.desc2 ? this.banner.desc2 : ""
                );
                formdata.append(
                    "muestra_boton",
                    this.banner.muestra_boton ? this.banner.muestra_boton : "0"
                );

                if (this.accion == "edit") {
                    url = main_url + "/admin/banners/" + this.banner.id;
                    formdata.append("_method", "PUT");
                }
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        this.enviando = false;
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.limpiaBanner();
                        this.$emit("envioModal");
                        this.errors = [];
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                            }
                            if (
                                error.response.status === 420 ||
                                error.response.status === 419 ||
                                error.response.status === 401
                            ) {
                                window.location = "/";
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
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
        cargaImagen(e) {
            const file = e.target.files[0];
            if (file) {
                this.banner.img = file;
                this.src_imagen_cargada = URL.createObjectURL(file);
            } else {
                if (this.banner.url_img) {
                    this.src_imagen_cargada = this.banner.url_img;
                } else {
                    this.banner.img = null;
                    this.src_imagen_cargada = "";
                }
            }
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaBanner() {
            this.errors = [];
            this.banner.img = null;
            this.banner.posicion = "";
            this.banner.desc1 = "";
            this.banner.desc2 = "";
            this.banner.muestra_boton = "0";
            this.$refs.input_file.value = null;
            this.src_imagen_cargada = "";
        },
    },
};
</script>

<style>
.formulario_banner .contenedor_imagen {
    display: flex;
    min-height: 100px;
}
.formulario_banner .contenedor_imagen .imagen {
    height: 100%;
    width: 100%;
}

.formulario_banner .contenedor_imagen .imagen img {
    width: 100%;
}

.formulario_banner .contenedor_imagen .imagen .vacio {
    height: 100px;
    width: 100%;
    background: gray;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}

.formulario_banner .contenedor_imagen .imagen .desc1 {
    max-width: 50%;
    word-wrap: break-word;
    position: absolute;
    bottom: 60px;
    left: 30px;
    text-transform: capitalize;
}
.formulario_banner .contenedor_imagen .imagen .desc2 {
    max-width: 50%;
    word-wrap: break-word;
    position: absolute;
    bottom: 40px;
    left: 30px;
    text-transform: uppercase;
    font-weight: bold;
}
.formulario_banner .contenedor_imagen .imagen .boton_comprar {
    position: absolute;
    bottom: 10px;
    left: 30px;
}

.formulario_banner .contenedor_imagen .imagen .boton_comprar button {
    border-radius: 30px;
}
</style>
