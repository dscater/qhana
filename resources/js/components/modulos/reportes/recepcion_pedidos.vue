<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Reportes - Recepción de Pedidos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="ml-auto mr-auto col-md-5">
                                    <form>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label
                                                    :class="{
                                                        'text-danger':
                                                            errors.filtro,
                                                    }"
                                                    >Seleccione*</label
                                                >
                                                <el-select
                                                    v-model="oReporte.filtro"
                                                    filterable
                                                    placeholder="Seleccione"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.filtro,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in listFiltro"
                                                        :key="item"
                                                        :label="item"
                                                        :value="item"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="errors.filtro"
                                                    v-text="errors.filtro[0]"
                                                ></span>
                                            </div>
                                            <div
                                                class="form-group col-md-12"
                                                v-if="
                                                    oReporte.filtro ==
                                                    'Código de Solicitud'
                                                "
                                            >
                                                <label
                                                    :class="{
                                                        'text-danger':
                                                            errors.solicitud_pedido_id,
                                                    }"
                                                    >Tipo*</label
                                                >
                                                <el-select
                                                    v-model="
                                                        oReporte.solicitud_pedido_id
                                                    "
                                                    filterable
                                                    placeholder="Concepto"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.solicitud_pedido_id,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in listSolicitudes"
                                                        :key="item.id"
                                                        :value="item.id"
                                                        :label="item.codigo"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="
                                                        errors.solicitud_pedido_id
                                                    "
                                                    v-text="
                                                        errors
                                                            .solicitud_pedido_id[0]
                                                    "
                                                ></span>
                                            </div>
                                            <div
                                                class="form-group col-md-12"
                                                v-if="
                                                    oReporte.filtro == 'Socios'
                                                "
                                            >
                                                <label
                                                    :class="{
                                                        'text-danger':
                                                            errors.user_id,
                                                    }"
                                                    >Socio*</label
                                                >
                                                <el-select
                                                    v-model="
                                                        oReporte.user_id
                                                    "
                                                    filterable
                                                    placeholder="Socio"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.user_id,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in listSocios"
                                                        :key="item.id"
                                                        :value="item.id"
                                                        :label="item.full_name"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="errors.user_id"
                                                    v-text="
                                                        errors.user_id[0]
                                                    "
                                                ></span>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label
                                                    :class="{
                                                        'text-danger':
                                                            errors.tipo,
                                                    }"
                                                    >Tipo*</label
                                                >
                                                <el-select
                                                    v-model="oReporte.tipo"
                                                    filterable
                                                    placeholder="Concepto"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.tipo,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in [
                                                            'PDF',
                                                            'EXCEL',
                                                        ]"
                                                        :key="item"
                                                        :label="item"
                                                        :value="item"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="errors.tipo"
                                                    v-text="errors.tipo[0]"
                                                ></span>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <el-button
                                                type="warning"
                                                class="bg-warning w-full"
                                                :loading="enviando"
                                                @click="generaReporte()"
                                                >{{ textoBtn }}</el-button
                                            >
                                        </div>
                                        <div class="col-md-12">
                                            <el-button
                                                type="default"
                                                class="w-full mt-1"
                                                @click="limpiarFormulario()"
                                                >Reiniciar</el-button
                                            >
                                        </div>
                                    </div>
                                </div>
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
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            errors: [],
            oReporte: {
                filtro: "Todos",
                solicitud_pedido_id: "todos",
                user_id: "todos",
                tipo: "PDF",
            },
            aFechas: [],
            enviando: false,
            textoBtn: "Generar Reporte",
            listFiltro: ["Todos", "Código de Solicitud", "Socios"],
            listSolicitudes: [],
            listSocios: [],
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getSolicitudes();
        this.getSocios();
    },
    methods: {
        limpiarFormulario() {
            this.oReporte.filtro = "Todos";
        },
        getSolicitudes() {
            axios
                .get(main_url + "/admin/solicitud_pedidos")
                .then((response) => {
                    this.listSolicitudes = response.data.solicitud_pedidos;
                    this.listSolicitudes.unshift({
                        id: "todos",
                        codigo: "TODOS",
                    });
                });
        },
        getSocios() {
            axios
                .get(main_url + "/admin/usuarios/getUsuarioTipoPersonal", {
                    params: {
                        tipo: "SOCIO",
                    },
                })
                .then((response) => {
                    this.listSocios = response.data;
                    this.listSocios.unshift({
                        id: "todos",
                        full_name: "TODOS",
                    });
                });
        },
        generaReporte() {
            this.enviando = true;
            let config = {
                responseType: "blob",
            };
            axios
                .post(
                    main_url + "/admin/reportes/recepcion_pedidos",
                    this.oReporte,
                    config
                )
                .then((res) => {
                    this.errors = [];
                    this.enviando = false;

                    if (this.oReporte.tipo == "PDF") {
                        let pdfBlob = new Blob([res.data], {
                            type: "application/pdf",
                        });
                        let urlReporte = URL.createObjectURL(pdfBlob);
                        window.open(urlReporte);
                    } else {
                        // excel
                        var fileURL = window.URL.createObjectURL(
                            new Blob([res.data])
                        );
                        var fileLink = document.createElement("a");
                        fileLink.href = fileURL;
                        fileLink.setAttribute(
                            "download",
                            "recepcion_pedidos.xlsx"
                        );
                        document.body.appendChild(fileLink);

                        fileLink.click();
                    }
                })
                .catch(async (error) => {
                    let responseObj = await error.response.data.text();
                    responseObj = JSON.parse(responseObj);
                    console.log(error);
                    this.enviando = false;
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = responseObj.errors;
                        }
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: responseObj.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                            window.location = "/";
                        }
                    }
                });
        },
        obtieneFechas() {
            if (this.aFechas) {
                this.oReporte.fecha_ini = this.aFechas[0];
                this.oReporte.fecha_fin = this.aFechas[1];
            } else {
                this.oReporte.fecha_ini = "";
                this.oReporte.fecha_fin = "";
            }
        },
    },
};
</script>

<style></style>
