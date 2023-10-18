<template>
    <div class="content-wrapper contenedor_cajas">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar Movimientos de Caja</h1>
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
                                <div class="row">
                                    <div class="col-md-3">
                                        <router-link
                                            :to="{
                                                name: 'cajas.MovimientoCajas',
                                            }"
                                            class="btn btn-default btn-flat btn-block"
                                        >
                                            <i class="fa fa-arrow-left"></i>
                                            Volver a Movimiento de Cajas
                                        </router-link>
                                    </div>
                                    <div class="col-md-3">
                                        <router-link
                                            :to="{
                                                name: 'cajas.index',
                                            }"
                                            class="btn btn-warning btn-flat btn-block"
                                        >
                                            <i class="fa fa-cash-register"></i>
                                            Ir a Cajas
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row"></div>
                            </div>
                            <div class="card-body"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    props: ["id"],
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            search: "",
            listRegistros: [],
            showOverlay: false,
            fields: [
                {
                    key: "fecha",
                    label: "Fecha",
                    sortable: true,
                },
                {
                    key: "hora",
                    label: "Hora",
                    sortable: true,
                },
                {
                    key: "ingresos",
                    label: "Ingresos",
                    sortable: true,
                },
                {
                    key: "egresos",
                    label: "Egresos",
                    sortable: true,
                },
                {
                    key: "total",
                    label: "Monto total",
                    sortable: true,
                },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            muestra_modal: false,
            modal_accion: "nuevo",
            currentPage: 1,
            perPage: 5,
            pageOptions: [
                { value: 5, text: "Mostrar 5 Registros" },
                { value: 10, text: "Mostrar 10 Registros" },
                { value: 25, text: "Mostrar 25 Registros" },
                { value: 50, text: "Mostrar 50 Registros" },
                { value: 100, text: "Mostrar 100 Registros" },
                { value: this.totalRows, text: "Mostrar Todo" },
            ],
            totalRows: 10,
            filter: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getMovimientoCajas();
    },
    methods: {
        // Listar Cajas
        getMovimientoCajas() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/movimiento_cajas";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.movimiento_cajas;
                    this.totalRows = res.data.total;
                });
        },
        verCajas(id) {
            this.$router.push({
                name: "movimiento_cajas.cajas",
                params: {
                    id: id,
                },
            });
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
    },
};
</script>

<style>
.contenedor_cajas .info_saldo {
    position: relative;
}
</style>
