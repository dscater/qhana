<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Solicitud de Pedidos > Modificar</h1>
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
                                    :solicitud_pedido="oSolicitudPedido"
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
            oSolicitudPedido: {
                id: 0,
                codigo: "",
                cliente_id: "",
                fecha_recepcion: "",
                solicitud_detalles: [],
            },
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getSolicitudPedido();
    },
    methods: {
        getSolicitudPedido() {
            axios
                .get(main_url + "/admin/solicitud_pedidos/" + this.id)
                .then((response) => {
                    this.oSolicitudPedido = response.data.solicitud_pedido;
                });
        },
    },
};
</script>

<style></style>
