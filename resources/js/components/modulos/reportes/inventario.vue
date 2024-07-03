<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Reportes - Inventario de Productos</h1>
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
                                                            errors.admin_producto_id,
                                                    }"
                                                    >Seleccionar*</label
                                                >
                                                <el-select
                                                    v-model="
                                                        oReporte.admin_producto_id
                                                    "
                                                    filterable
                                                    placeholder="Seleccionar"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.admin_producto_id,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in listProductos"
                                                        :key="item.id"
                                                        :label="item.full_name"
                                                        :value="item.id"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="
                                                        errors.admin_producto_id
                                                    "
                                                    v-text="
                                                        errors
                                                            .admin_producto_id[0]
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
                                                    placeholder="Tipo"
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
                admin_producto_id: "todos",
                tipo: "PDF",
            },
            aFechas: [],
            enviando: false,
            textoBtn: "Generar Reporte",
            listFiltro: ["Todos", "Ingresos", "Egresos", "Rango de fechas"],
            listProductos: [],
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getConceptos();
    },
    methods: {
        limpiarFormulario() {
            this.oReporte.admin_producto_id = "todos";
        },
        getConceptos() {
            axios.get(main_url + "/admin/admin_productos").then((response) => {
                this.listProductos = response.data.admin_productos;
                this.listProductos.unshift({
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
                    main_url + "/admin/reportes/inventario",
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
                            "inventario_productos.xlsx"
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
