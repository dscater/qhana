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
                                        'text-danger': errors.material_id,
                                    }"
                                    >Seleccionar Material*</label
                                >
                                <el-select
                                    placeholder="Seleccionar Material"
                                    class="w-100"
                                    :class="{
                                        'is-invalid': errors.material_id,
                                    }"
                                    v-model="salida_material.material_id"
                                    clearable
                                    filtereable
                                >
                                    <el-option
                                        v-for="item in listMaterials"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.nombre"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.material_id"
                                    v-text="errors.material_id[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.cantidad,
                                    }"
                                    >Cantidad*</label
                                >

                                <input
                                    type="number"
                                    step="0.01"
                                    placeholder="Cantidad"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.cantidad,
                                    }"
                                    v-model="salida_material.cantidad"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.cantidad"
                                    v-text="errors.cantidad[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fecha_salida,
                                    }"
                                    >Fecha Salida*</label
                                >

                                <input
                                    type="date"
                                    placeholder="Fecha Salida"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.fecha_salida,
                                    }"
                                    v-model="salida_material.fecha_salida"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fecha_salida"
                                    v-text="errors.fecha_salida[0]"
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
        salida_material: {
            type: Object,
            default: {
                material_id: "",
                cantidad: "",
                fecha_salida: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                if (this.accion != "edit") {
                    this.salida_material.fecha_salida = this.getFechaActual();
                }
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
            listMaterials: [],
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
        this.getMaterials();
    },
    methods: {
        getMaterials() {
            axios.get(main_url + "/admin/materials").then((response) => {
                this.listMaterials = response.data.materials;
            });
        },
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/salida_materials";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "material_id",
                    this.salida_material.material_id
                        ? this.salida_material.material_id
                        : ""
                );
                formdata.append(
                    "cantidad",
                    this.salida_material.cantidad
                        ? this.salida_material.cantidad
                        : ""
                );
                formdata.append(
                    "fecha_salida",
                    this.salida_material.fecha_salida
                        ? this.salida_material.fecha_salida
                        : ""
                );

                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/salida_materials/" +
                        this.salida_material.id;
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
                        this.limpiaSalidaMaterial();
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
                                    showConfirmButton: true,
                                    confirmButtonColor: "#c57a40",
                                    confirmButtonText: "Aceptar",
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
            this.salida_material.foto = e.target.files[0];
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaSalidaMaterial() {
            this.errors = [];
            this.salida_material.material_id = "";
            this.salida_material.cantidad = "";
            this.salida_material.fecha_salida = "";
        },
    },
};
</script>

<style></style>
