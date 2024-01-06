<template>
    <div
        class="modal fade"
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
                                        'text-danger': errors.codigo_color,
                                    }"
                                    >Código-Color*</label
                                >
                                <el-input
                                    placeholder="Código-Color"
                                    :class="{
                                        'is-invalid': errors.codigo_color,
                                    }"
                                    v-model="admin_producto.codigo_color"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.codigo_color"
                                    v-text="errors.codigo_color[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.descripcion,
                                    }"
                                    >Descripción*</label
                                >

                                <el-input
                                    placeholder="Descripción"
                                    :class="{
                                        'is-invalid': errors.descripcion,
                                    }"
                                    v-model="admin_producto.descripcion"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.paterno"
                                    v-text="errors.paterno[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.titulo,
                                    }"
                                    >Título*</label
                                >

                                <el-input
                                    placeholder="Título"
                                    :class="{
                                        'is-invalid': errors.titulo,
                                    }"
                                    v-model="admin_producto.titulo"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.paterno"
                                    v-text="errors.paterno[0]"
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
        admin_producto: {
            type: Object,
            default: {
                codigo_color: "",
                descripcion: "",
                titulo: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.bModal = true;
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "AGREGAR PRODUCTO";
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
                let url = main_url + "/admin/admin_productos";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "codigo_color",
                    this.admin_producto.codigo_color
                        ? this.admin_producto.codigo_color
                        : ""
                );
                formdata.append(
                    "descripcion",
                    this.admin_producto.descripcion
                        ? this.admin_producto.descripcion
                        : ""
                );
                formdata.append(
                    "titulo",
                    this.admin_producto.titulo ? this.admin_producto.titulo : ""
                );

                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/admin_productos/" +
                        this.admin_producto.id;
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
                        this.limpiaAdminProducto();
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
            this.admin_producto.foto = e.target.files[0];
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaAdminProducto() {
            this.errors = [];
            this.admin_producto.codigo_color = "";
            this.admin_producto.descripcion = "";
            this.admin_producto.titulo = "";
        },
    },
};
</script>

<style></style>
