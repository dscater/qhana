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
                            <div class="form-group col-md-6 text-center">
                                <label
                                    :class="{
                                        'text-danger': errors.tipo,
                                    }"
                                    >Tipo*</label
                                >
                                <template v-if="accion == 'edit'">
                                    <el-input
                                        :class="[
                                            caja.tipo == 'NORMAL'
                                                ? 'bg-dark'
                                                : 'bg-warning',
                                        ]"
                                        v-model="caja.tipo"
                                        readonly
                                    ></el-input>
                                </template>
                                <template v-else>
                                    <el-switch
                                        :class="{
                                            'is-invalid': errors.tipo,
                                        }"
                                        style="display: block"
                                        v-model="caja.tipo"
                                        active-color="#C57A40"
                                        inactive-color="#000000"
                                        active-text="RECIBO"
                                        inactive-text="NORMAL"
                                        active-value="RECIBO"
                                        inactive-value="NORMAL"
                                    >
                                    </el-switch>
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.tipo"
                                        v-text="errors.tipo[0]"
                                    ></span>
                                </template>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.tipo_movimiento,
                                    }"
                                    >Tipo de Movimiento*</label
                                >
                                <template v-if="accion == 'edit'">
                                    <el-input
                                        v-model="caja.tipo_movimiento"
                                        readonly
                                    ></el-input>
                                </template>
                                <template v-else>
                                    <el-select
                                        placeholder="Tipo de Movimiento"
                                        class="w-100"
                                        :class="{
                                            'is-invalid':
                                                errors.tipo_movimiento,
                                        }"
                                        v-model="caja.tipo_movimiento"
                                        clearable
                                    >
                                        <el-option
                                            :value="'INGRESO'"
                                            :label="'INGRESO'"
                                        ></el-option>
                                        <el-option
                                            :value="'EGRESO'"
                                            :label="'EGRESO'"
                                        ></el-option>
                                    </el-select>
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.tipo_movimiento"
                                        v-text="errors.tipo_movimiento[0]"
                                    ></span>
                                </template>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.concepto_id,
                                    }"
                                    >Concepto*</label
                                >
                                <template v-if="accion == 'edit'">
                                    <el-input
                                        v-model="caja.concepto.nombre"
                                        readonly
                                    ></el-input>
                                </template>
                                <template v-else>
                                    <el-select
                                        class="w-100"
                                        :class="{
                                            'is-invalid': errors.concepto_id,
                                        }"
                                        v-model="caja.concepto_id"
                                        clearable
                                    >
                                        <el-option
                                            v-for="item in listConceptos"
                                            :key="item.id"
                                            :value="item.id"
                                            :label="item.nombre"
                                        ></el-option>
                                    </el-select>
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.concepto_id"
                                        v-text="errors.concepto_id[0]"
                                    ></span>
                                </template>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.monto,
                                    }"
                                    >Monto Bs.*</label
                                >
                                <template v-if="accion == 'edit'">
                                    <el-input
                                        v-model="caja.monto"
                                        readonly
                                    ></el-input>
                                </template>
                                <template v-else>
                                    <input
                                        type="number"
                                        placeholder="Monto Bs."
                                        class="form-control"
                                        :class="{ 'is-invalid': errors.monto }"
                                        v-model="caja.monto"
                                        clearable
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.monto"
                                        v-text="errors.monto[0]"
                                    ></span>
                                </template>
                            </div>
                            <div
                                class="form-group col-md-6"
                                v-if="caja.tipo == 'NORMAL'"
                            >
                                <label
                                    :class="{
                                        'text-danger': errors.nro_factura,
                                    }"
                                    >Nro. Factura/Recibo</label
                                >

                                <el-input
                                    type="text"
                                    placeholder="Nro. Factura/Recibo"
                                    :class="{
                                        'is-invalid': errors.nro_factura,
                                    }"
                                    v-model="caja.nro_factura"
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.nro_factura"
                                    v-text="errors.nro_factura[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fecha,
                                    }"
                                    >Fecha de Registro*</label
                                >
                                <template v-if="accion == 'edit'">
                                    <el-input
                                        v-model="caja.fecha"
                                        readonly
                                    ></el-input>
                                </template>
                                <template v-else>
                                    <input
                                        type="date"
                                        placeholder="Fecha de Registro"
                                        class="form-control"
                                        :class="{
                                            'is-invalid': errors.fecha,
                                        }"
                                        v-model="caja.fecha"
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.fecha"
                                        v-text="errors.fecha[0]"
                                    ></span>
                                </template>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.descripcion,
                                    }"
                                    >Descripción</label
                                >

                                <el-input
                                    type="textarea"
                                    placeholder="Descripción"
                                    :class="{
                                        'is-invalid': errors.descripcion,
                                    }"
                                    v-model="caja.descripcion"
                                    autosize
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.descripcion"
                                    v-text="errors.descripcion[0]"
                                ></span>
                            </div>
                            <div
                                class="form-group col-md-6"
                                v-if="caja.tipo == 'RECIBO'"
                            >
                                <label
                                    :class="{
                                        'text-danger': errors.a_favor,
                                    }"
                                    >A Favor de*</label
                                >

                                <el-select
                                    placeholder="A Favor de"
                                    class="w-100"
                                    :class="{
                                        'is-invalid': errors.a_favor,
                                    }"
                                    v-model="caja.a_favor"
                                    autosize
                                    @change="
                                        caja.user_id = '';
                                        getUsuarios();
                                    "
                                >
                                    <el-option
                                        v-for="item in [
                                            'SOCIO',
                                            'TRABAJADOR',
                                            'OTRO',
                                        ]"
                                        :key="item"
                                        :value="item"
                                        :labvel="item"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.a_favor"
                                    v-text="errors.a_favor[0]"
                                ></span>
                            </div>
                            <div
                                class="form-group col-md-6"
                                v-if="caja.a_favor != 'OTRO' && textUser != ''"
                            >
                                <label
                                    :class="{
                                        'text-danger': errors.user_id,
                                    }"
                                    v-text="textUser"
                                ></label>

                                <el-select
                                    :placeholder="textUser"
                                    class="w-100"
                                    :class="{
                                        'is-invalid': errors.user_id,
                                    }"
                                    v-model="caja.user_id"
                                >
                                    <el-option
                                        v-for="item in listUsers"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.full_name"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.user_id"
                                    v-text="errors.user_id[0]"
                                ></span>
                            </div>
                            <div
                                class="form-group col-md-6"
                                v-if="
                                    caja.a_favor == 'OTRO' &&
                                    caja.tipo == 'RECIBO'
                                "
                            >
                                <label
                                    :class="{
                                        'text-danger': errors.nombre,
                                    }"
                                    >Indique el nombre</label
                                >

                                <el-input
                                    type="textarea"
                                    placeholder="Indicar el nombre"
                                    :class="{
                                        'is-invalid': errors.nombre,
                                    }"
                                    v-model="caja.nombre"
                                    autosize
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.nombre"
                                    v-text="errors.nombre[0]"
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
        caja: {
            type: Object,
            default: {
                tipo: "",
                tipo_movimiento: "",
                concepto_id: "",
                monto: "",
                responsable_id: "",
                nro_factura: "",
                fecha: "",
                descripcion: "",
                a_favor: "",
                nombre: "",
                nro: "",
                user_id: "",
                nombre: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.bModal = true;
                if (this.accion == "edit") {
                    this.getUsuarios();
                }
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        textUser() {
            if (this.caja.tipo == "RECIBO" && this.caja.a_favor == "SOCIO") {
                return "Seleccione un socio";
            }
            if (
                this.caja.tipo == "RECIBO" &&
                this.caja.a_favor == "TRABAJADOR"
            ) {
                return "Seleccione un trabajador";
            }
            return "";
        },
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
            listConceptos: [],
            listUsers: [],
            errors: [],
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
        this.getConceptos();
    },
    methods: {
        getUsuarios() {
            if (this.caja.a_favor != "OTROS") {
                axios
                    .get(main_url + "/admin/usuarios/getUsuarioTipoPersonal", {
                        params: {
                            tipo: this.caja.a_favor,
                        },
                    })
                    .then((response) => {
                        this.listUsers = response.data;
                    });
            } else {
                this.listUsers = [];
            }
        },
        getConceptos() {
            axios.get(main_url + "/admin/conceptos").then((response) => {
                this.listConceptos = response.data.conceptos;
            });
        },
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/cajas";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append("tipo", this.caja.tipo ? this.caja.tipo : "");
                formdata.append(
                    "tipo_movimiento",
                    this.caja.tipo_movimiento ? this.caja.tipo_movimiento : ""
                );
                formdata.append(
                    "concepto_id",
                    this.caja.concepto_id ? this.caja.concepto_id : ""
                );
                formdata.append(
                    "monto",
                    this.caja.monto ? this.caja.monto : ""
                );
                formdata.append(
                    "responsable_id",
                    this.caja.responsable_id ? this.caja.responsable_id : ""
                );
                formdata.append(
                    "nro_factura",
                    this.caja.nro_factura ? this.caja.nro_factura : ""
                );
                formdata.append(
                    "fecha",
                    this.caja.fecha ? this.caja.fecha : ""
                );
                formdata.append(
                    "descripcion",
                    this.caja.descripcion ? this.caja.descripcion : ""
                );
                formdata.append(
                    "a_favor",
                    this.caja.a_favor ? this.caja.a_favor : ""
                );
                formdata.append("nro", this.caja.nro ? this.caja.nro : "");
                formdata.append(
                    "user_id",
                    this.caja.user_id ? this.caja.user_id : ""
                );
                formdata.append(
                    "nombre",
                    this.caja.nombre ? this.caja.nombre : ""
                );

                if (this.accion == "edit") {
                    url = main_url + "/admin/cajas/" + this.caja.id;
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
                        this.limpiaCaja();
                        this.$emit("envioModal");
                        this.errors = [];
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            if (res.data.caja.tipo == "RECIBO") {
                                this.generarRecibo(res.data.caja.id);
                            }
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
        generarRecibo(id) {
            let config = {
                responseType: "blob",
            };
            axios
                .post(
                    main_url + "/admin/cajas/generarRecibo/" + id,
                    null,
                    config
                )
                .then((res) => {
                    let pdfBlob = new Blob([res.data], {
                        type: "application/pdf",
                    });
                    let urlReporte = URL.createObjectURL(pdfBlob);
                    window.open(urlReporte);
                })
                .catch(async (error) => {
                    let responseObj = await error.response.data.text();
                    responseObj = JSON.parse(responseObj);
                    console.log(error);
                    this.enviando = false;
                    if (error.response) {
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            window.location = "/";
                        }
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            html: responseObj.message,
                            showConfirmButton: false,
                            timer: 2000,
                        });
                    }
                });
        },
        cargaImagen(e) {
            this.caja.imagen = e.target.files[0];
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaCaja() {
            this.errors = [];
            this.caja.tipo = "NORMAL";
            this.caja.tipo_movimiento = "";
            this.caja.concepto_id = "";
            this.caja.monto = "";
            this.caja.responsable_id = "";
            this.caja.nro_factura = "";
            this.caja.fecha = "";
            this.caja.descripcion = "";
            this.caja.a_favor = "";
            this.caja.nro = "";
            this.caja.user_id = "";
            this.caja.nombre = "";
        },
    },
};
</script>

<style></style>
