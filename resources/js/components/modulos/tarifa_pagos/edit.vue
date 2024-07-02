<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Tarifa de Pagos por Pedidos > Modificar</h1>
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
                                <Formulario
                                    :tarifa_pago="oTarifaPago"
                                    :accion="'edit'"
                                ></Formulario>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import Formulario from "./Formulario.vue";
export default {
    props: ["id"],
    components: {
        Formulario,
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oTarifaPago: {
                id: 0,
                cliente_id: "",
                solicitud_pedido_id: "",
                cantidad: 0,
                peso: 0,
                mano_obra: 0,
                depreciacion: 0,
                ganancia: 0,
                tipo_registro: "TODOS",
                user_id: null,
                tarifa_detalles: [],
            },
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getTarifaPago();
    },
    methods: {
        getTarifaPago() {
            axios
                .get(main_url + "/admin/tarifa_pagos/" + this.id)
                .then((response) => {
                    this.oTarifaPago = response.data.tarifa_pago;
                });
        },
    },
};
</script>

<style></style>
