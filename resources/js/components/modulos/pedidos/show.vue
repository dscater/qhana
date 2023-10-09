<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Pedidos - Ver pedido</h1>
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
                                    <div class="col-md-12">
                                        <p>
                                            <strong>Cliente: </strong>
                                            {{ oPedido.nombres }}
                                            {{ oPedido.apellidos }}
                                        </p>
                                        <p>
                                            <strong>Teléfono/Celular: </strong>
                                            {{ oPedido.fono }}
                                        </p>
                                        <p>
                                            <strong
                                                >País/Estado/Ciudad:
                                            </strong>
                                            {{ oPedido.pec }}
                                        </p>
                                        <table
                                            class="table table-bordered table-striped"
                                        >
                                            <thead class="bg-warning">
                                                <tr>
                                                    <th>Producto</th>
                                                    <th>Cantidad</th>
                                                    <th>Precio</th>
                                                    <th>Subtotal</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr
                                                    v-for="item in oPedido.detalle_pedidos"
                                                >
                                                    <td>
                                                        {{
                                                            item.producto.nombre
                                                        }}
                                                    </td>
                                                    <td>{{ item.cantidad }}</td>
                                                    <td>{{ item.precio }}</td>
                                                    <td>{{ item.subtotal }}</td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="text-md font-weight-bold bg-dark"
                                                        colspan="3"
                                                    >
                                                        TOTAL
                                                    </td>
                                                    <td
                                                        class="text-md font-weight-bold bg-dark"
                                                    >
                                                        {{
                                                            oPedido.monto_total
                                                        }}
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-3">
                                        <button
                                            class="btn btn-default btn-block btn-flat"
                                            @click="
                                                $router.push({
                                                    name: 'pedidos.index',
                                                })
                                            "
                                        >
                                            <i class="fa fa-arrow-left"></i>
                                            Volver
                                        </button>
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
    props: ["id"],
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oPedido: {
                id: 0,
                nombre: "",
                descripcion: "",
            },
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getPedido();
    },
    methods: {
        // Listar Pedidos
        getPedido() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/pedidos/" + this.id;
            axios.get(url).then((res) => {
                this.oPedido = res.data.pedido;
            });
        },
    },
};
</script>

<style></style>
