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
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.empresa,
                                    }"
                                    >Empresa*</label
                                >
                                <el-input
                                    placeholder="Empresa"
                                    :class="{ 'is-invalid': errors.empresa }"
                                    v-model="cliente.empresa"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.empresa"
                                    v-text="errors.empresa[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.nombre_encargado,
                                    }"
                                    >Nombre Completo Encargado*</label
                                >
                                <el-input
                                    placeholder="Nombre Completo Encargado"
                                    :class="{
                                        'is-invalid': errors.nombre_encargado,
                                    }"
                                    v-model="cliente.nombre_encargado"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.nombre_encargado"
                                    v-text="errors.nombre_encargado[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fonos,
                                    }"
                                    >Teléfonos*</label
                                >
                                <el-input
                                    placeholder="Teléfonos"
                                    :class="{ 'is-invalid': errors.fonos }"
                                    v-model="cliente.fonos"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fonos"
                                    v-text="errors.fonos[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.dir,
                                    }"
                                    >Dirección</label
                                >
                                <el-input
                                    placeholder="Dirección"
                                    :class="{ 'is-invalid': errors.dir }"
                                    v-model="cliente.dir"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.dir"
                                    v-text="errors.dir[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.correo,
                                    }"
                                    >Correo</label
                                >
                                <el-input
                                    placeholder="Correo"
                                    :class="{ 'is-invalid': errors.correo }"
                                    v-model="cliente.correo"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.correo"
                                    v-text="errors.correo[0]"
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
        cliente: {
            type: Object,
            default: {
                empresa: "",
                nombre_encargado: "",
                fonos: "",
                dir: "",
                correo: "",
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
                return "AGREGAR REGISTRO";
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
                let url = main_url + "/admin/clientes";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "empresa",
                    this.cliente.empresa ? this.cliente.empresa : ""
                );
                formdata.append(
                    "nombre_encargado",
                    this.cliente.nombre_encargado
                        ? this.cliente.nombre_encargado
                        : ""
                );
                formdata.append(
                    "fonos",
                    this.cliente.fonos ? this.cliente.fonos : ""
                );
                formdata.append(
                    "dir",
                    this.cliente.dir ? this.cliente.dir : ""
                );
                formdata.append(
                    "correo",
                    this.cliente.correo ? this.cliente.correo : ""
                );

                if (this.accion == "edit") {
                    url = main_url + "/admin/clientes/" + this.cliente.id;
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
                        this.limpiaCliente();
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
            this.cliente.foto = e.target.files[0];
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaCliente() {
            this.errors = [];
            this.cliente.empresa = "";
            this.cliente.nombre_encargado = "";
            this.cliente.fonos = "";
            this.cliente.dir = "";
            this.cliente.correo = "";
        },
    },
};
</script>

<style></style>
