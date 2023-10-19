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
                    <div class="col-md-4">
                        <div class="card" v-if="oMovimientoCaja">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4
                                            class="w-100 font-weight-bold text-center"
                                        >
                                            Movimiento de Caja
                                        </h4>
                                        <p>
                                            <strong>Fecha: </strong>
                                            {{
                                                getFormatoFecha(
                                                    oMovimientoCaja.fecha
                                                )
                                            }}
                                        </p>
                                        <p>
                                            <strong>Hora: </strong>
                                            {{ oMovimientoCaja.hora }}
                                        </p>
                                        <p>
                                            <strong>Total Bs.: </strong>
                                            <span
                                                class="font-weight-bold text-md badge badge-warning"
                                                >{{
                                                    oMovimientoCaja.total
                                                }}</span
                                            >
                                        </p>
                                        <p>
                                            <strong>Ingresos Bs.: </strong>
                                            <span
                                                class="font-weight-bold text-md badge badge-success"
                                                >{{
                                                    oMovimientoCaja.ingresos
                                                }}</span
                                            >
                                        </p>
                                        <p>
                                            <strong>Egresos Bs.: </strong>
                                            <span
                                                class="font-weight-bold text-md badge badge-danger"
                                                >{{
                                                    oMovimientoCaja.egresos
                                                }}</span
                                            >
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card" v-else>
                            <div class="card-body">
                                <h4 class="w-100 font-weight-bold text-center">
                                    Cargando...
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card" v-if="oMovimientoCaja">
                            <div class="card-header">
                                <h4 class="w-100 font-weight-bold text-center">
                                    Detalle Movimientos
                                </h4>
                            </div>
                            <div class="card-body bg-dark">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div
                                            class="card"
                                            v-for="item in oMovimientoCaja.cajas"
                                        >
                                            <div class="card-body bg-white">
                                                <p>
                                                    <strong>Fecha: </strong>
                                                    {{
                                                        getFormatoFecha(
                                                            item.fecha
                                                        )
                                                    }}
                                                </p>
                                                <p>
                                                    <strong>Tipo: </strong>
                                                    <span
                                                        class="badge text-md"
                                                        :class="[
                                                            item.tipo ==
                                                            'RECIBO'
                                                                ? 'badge-warning'
                                                                : 'badge-dark',
                                                        ]"
                                                    >
                                                        {{ item.tipo }}
                                                    </span>
                                                </p>
                                                <p>
                                                    <strong
                                                        >Movimiento:
                                                    </strong>
                                                    <span
                                                        class="badge text-md"
                                                        :class="[
                                                            item.tipo_movimiento ==
                                                            'INGRESO'
                                                                ? 'badge-success'
                                                                : 'badge-danger',
                                                        ]"
                                                    >
                                                        {{
                                                            item.tipo_movimiento
                                                        }}
                                                    </span>
                                                </p>
                                                <p>
                                                    <strong>Concepto: </strong>
                                                    {{ item.concepto.nombre }}
                                                </p>
                                                <p>
                                                    <strong>Monto Bs.: </strong>
                                                    {{ item.monto }}
                                                </p>
                                                <p>
                                                    <strong
                                                        >Descripción:
                                                    </strong>
                                                    {{ item.descripcion }}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card" v-else>
                            <div class="card-body">
                                <h4 class="w-100 font-weight-bold text-center">
                                    Cargando...
                                </h4>
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
    props: ["id"],
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oMovimientoCaja: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getMovimientoCaja();
    },
    methods: {
        getMovimientoCaja() {
            axios
                .get(main_url + "/admin/movimiento_cajas/" + this.id)
                .then((response) => {
                    this.oMovimientoCaja = response.data.movimiento_caja;
                });
        },
    },
};
</script>

<style>
.contenedor_cajas .info_saldo {
    position: relative;
}
</style>
