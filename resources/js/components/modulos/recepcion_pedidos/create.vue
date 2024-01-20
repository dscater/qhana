<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Recepción de Pedidos > Nuevo</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <Formulario
                    :recepcion_pedido="oRecepcionPedido"
                    :accion="'nuevo'"
                ></Formulario>
            </div>
        </section>
    </div>
</template>

<script>
import Formulario from "./Formulario.vue";
export default {
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
            oRecepcionPedido: {
                id: 0,
                user_id: "",
                solicitud_pedido_id: "",
                distribucion_pedido_id: "",
                fecha_recepcion: "",
                recepcion_detalles: [],
                historia_recepcions: [],
            },
        };
    },
    mounted() {
        this.loadingWindow.close();
    },
    methods: {},
};
</script>

<style></style>
