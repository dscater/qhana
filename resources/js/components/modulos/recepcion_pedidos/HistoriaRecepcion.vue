<template>
    <div class="col-12">
        <div class="row">
            <div class="col-12">
                <div class="card" v-show="index == 0">
                    <div class="card-body">
                        <div class="form-group col-md-4">
                            <label
                                :class="{
                                    'text-danger': errors['fecha_' + index],
                                }"
                                >Fecha de Recepción*</label
                            >
                            <input
                                type="date"
                                placeholder="Fecha de Recepción"
                                class="form-control"
                                :class="{
                                    'is-invalid': errors['fecha_' + index],
                                }"
                                v-model="historia_recepcion.fecha"
                                clearable
                            />
                            <span
                                class="error invalid-feedback"
                                v-if="errors['fecha_' + index]"
                                v-text="errors['fecha_' + index][0]"
                            ></span>
                        </div>
                        <div class="col-md-12" style="overflow: auto">
                            <table
                                class="table table-bordered table-striped table_productos"
                            >
                                <thead class="bg-warning text-white">
                                    <tr>
                                        <th class="text-center">
                                            Detalle Producto
                                        </th>
                                        <th class="text-center"></th>
                                        <th class="text-center bg-purple">
                                            Total Asignado
                                        </th>
                                        <th class="text-center bg-olive">
                                            Restante Asignado
                                        </th>
                                        <th class="text-center">Recepción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template
                                        v-if="
                                            historia_recepcion
                                                .historia_recepcion_detalles
                                                .length > 0
                                        "
                                    >
                                        <template
                                            v-for="(
                                                item, index
                                            ) in historia_recepcion.historia_recepcion_detalles"
                                        >
                                            <tr>
                                                <td rowspan="2">
                                                    <div
                                                        class="descripcion_producto"
                                                    >
                                                        <div
                                                            class="desc codigo"
                                                        >
                                                            <strong
                                                                >Código: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .codigo
                                                            }}</span>
                                                        </div>
                                                        <div
                                                            class="desc descripcion"
                                                        >
                                                            <strong
                                                                >Descripción: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .descripcion
                                                            }}</span>
                                                        </div>
                                                        <div class="desc talla">
                                                            <strong
                                                                >Talla: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .talla
                                                            }}</span>
                                                        </div>
                                                        <div
                                                            class="desc cantidad"
                                                        >
                                                            <strong
                                                                >Cantidad: </strong
                                                            ><span
                                                                class="badge badge-primary text-md"
                                                                >{{
                                                                    item
                                                                        .solicitud_detalle
                                                                        .cantidad
                                                                }}</span
                                                            >
                                                        </div>
                                                        <div
                                                            class="desc elaborado"
                                                        >
                                                            <strong
                                                                >Elaborado: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .elaborado
                                                            }}</span>
                                                        </div>
                                                        <div
                                                            class="desc titulo"
                                                        >
                                                            <strong
                                                                >Título: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .titulo
                                                            }}</span>
                                                        </div>
                                                        <div
                                                            class="desc codigo_color"
                                                        >
                                                            <strong
                                                                >Color Código: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .codigo_color
                                                            }}</span>
                                                        </div>
                                                        <div class="desc peso">
                                                            <strong
                                                                >Peso: </strong
                                                            ><span
                                                                class="badge badge-info text-md"
                                                                >{{
                                                                    item
                                                                        .solicitud_detalle
                                                                        .peso_restante
                                                                }}</span
                                                            >
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>CANTIDAD</td>
                                                <td
                                                    class="text-center bg-purple"
                                                >
                                                    <span
                                                        class="badge badge-primary text-lg"
                                                        >{{
                                                            item
                                                                .recepcion_detalle
                                                                .cantidad
                                                        }}</span
                                                    >
                                                </td>
                                                <td
                                                    class="text-center bg-olive"
                                                >
                                                    <span
                                                        class="badge badge-primary text-lg"
                                                        >{{
                                                            item
                                                                .recepcion_detalle
                                                                .cantidad_restante
                                                        }}</span
                                                    >
                                                </td>
                                                <td>
                                                    <input
                                                        type="number"
                                                        step="0.01"
                                                        class="form-control"
                                                        :class="{
                                                            'is-invalid':
                                                                errors[
                                                                    'cantidad_' +
                                                                        index
                                                                ],
                                                        }"
                                                        v-model="item.cantidad"
                                                        @keyup="
                                                            calculaCantidadRestante(
                                                                index
                                                            )
                                                        "
                                                        @change="
                                                            calculaCantidadRestante(
                                                                index
                                                            )
                                                        "
                                                        :disabled="
                                                            item
                                                                .recepcion_detalle
                                                                .cantidad_res_aux <=
                                                            0
                                                        "
                                                    />
                                                    <span
                                                        class="error invalid-feedback"
                                                        v-if="
                                                            errors[
                                                                'cantidad_' +
                                                                    index
                                                            ]
                                                        "
                                                        v-text="
                                                            errors[
                                                                'cantidad_' +
                                                                    index
                                                            ][0]
                                                        "
                                                    ></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>PESO</td>
                                                <td
                                                    class="text-center bg-purple"
                                                >
                                                    <span
                                                        class="badge badge-info text-lg"
                                                        >{{
                                                            item
                                                                .recepcion_detalle
                                                                .peso
                                                        }}</span
                                                    >
                                                </td>
                                                <td
                                                    class="text-center bg-olive"
                                                >
                                                    <span
                                                        class="badge badge-info text-lg"
                                                        >{{
                                                            item
                                                                .recepcion_detalle
                                                                .peso_restante
                                                        }}</span
                                                    >
                                                </td>
                                                <td>
                                                    <input
                                                        type="number"
                                                        step="0.01"
                                                        class="form-control"
                                                        :class="{
                                                            'is-invalid':
                                                                errors[
                                                                    'peso_' +
                                                                        index
                                                                ],
                                                        }"
                                                        v-model="item.peso"
                                                        @keyup="
                                                            calculaPesoRestante(
                                                                index
                                                            )
                                                        "
                                                        @change="
                                                            calculaPesoRestante(
                                                                index
                                                            )
                                                        "
                                                        :disabled="
                                                            item
                                                                .recepcion_detalle
                                                                .peso_res_aux <=
                                                            0
                                                        "
                                                    />
                                                    <span
                                                        class="error invalid-feedback"
                                                        v-if="
                                                            errors[
                                                                'peso_' + index
                                                            ]
                                                        "
                                                        v-text="
                                                            errors[
                                                                'peso_' + index
                                                            ][0]
                                                        "
                                                    ></span>
                                                </td>
                                            </tr>
                                        </template>
                                    </template>
                                    <template v-else>
                                        <tr>
                                            <td colspan="3" class="text-center">
                                                NO SE ENCONTRARÓN PRODUCTOS
                                            </td>
                                        </tr>
                                    </template>
                                    <template></template>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12" v-show="index == 1">
                <h5 class="text-center">Recepciones anteriores</h5>
            </div>
            <div class="col-12" v-show="index > 0">
                <div class="card">
                    <div class="card-body">
                        <div class="form-group col-md-4">
                            <p>
                                <strong>Fecha de Recepción:</strong>
                                {{ historia_recepcion.fecha }}
                            </p>
                        </div>
                        <div class="col-md-12" style="overflow: auto">
                            <table
                                class="table table-bordered table-striped table_productos"
                            >
                                <thead class="bg-warning text-white">
                                    <tr>
                                        <th class="text-center">
                                            Detalle Producto
                                        </th>
                                        <th class="text-center"></th>
                                        <th class="text-center bg-purple">
                                            Total Asignado
                                        </th>
                                        <th class="text-center bg-lightblue">
                                            Recibido
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template
                                        v-if="
                                            historia_recepcion
                                                .historia_recepcion_detalles
                                                .length > 0
                                        "
                                    >
                                        <template
                                            v-for="(
                                                item, index
                                            ) in historia_recepcion.historia_recepcion_detalles"
                                        >
                                            <tr>
                                                <td rowspan="2">
                                                    <div
                                                        class="descripcion_producto"
                                                    >
                                                        <div
                                                            class="desc codigo"
                                                        >
                                                            <strong
                                                                >Código: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .codigo
                                                            }}</span>
                                                        </div>
                                                        <div
                                                            class="desc descripcion"
                                                        >
                                                            <strong
                                                                >Descripción: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .descripcion
                                                            }}</span>
                                                        </div>
                                                        <div class="desc talla">
                                                            <strong
                                                                >Talla: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .talla
                                                            }}</span>
                                                        </div>
                                                        <div
                                                            class="desc cantidad"
                                                        >
                                                            <strong
                                                                >Cantidad: </strong
                                                            ><span
                                                                class="badge badge-primary text-md"
                                                                >{{
                                                                    item
                                                                        .solicitud_detalle
                                                                        .cantidad
                                                                }}</span
                                                            >
                                                        </div>
                                                        <div
                                                            class="desc elaborado"
                                                        >
                                                            <strong
                                                                >Elaborado: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .elaborado
                                                            }}</span>
                                                        </div>
                                                        <div
                                                            class="desc titulo"
                                                        >
                                                            <strong
                                                                >Título: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .titulo
                                                            }}</span>
                                                        </div>
                                                        <div
                                                            class="desc codigo_color"
                                                        >
                                                            <strong
                                                                >Color Código: </strong
                                                            ><span>{{
                                                                item
                                                                    .solicitud_detalle
                                                                    .codigo_color
                                                            }}</span>
                                                        </div>
                                                        <div class="desc peso">
                                                            <strong
                                                                >Peso: </strong
                                                            ><span
                                                                class="badge badge-info text-md"
                                                                >{{
                                                                    item
                                                                        .solicitud_detalle
                                                                        .peso_restante
                                                                }}</span
                                                            >
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>CANTIDAD</td>
                                                <td
                                                    class="text-center bg-purple"
                                                >
                                                    <span
                                                        class="badge badge-primary text-lg"
                                                        >{{
                                                            item
                                                                .recepcion_detalle
                                                                .cantidad
                                                        }}</span
                                                    >
                                                </td>
                                                <td
                                                    class="text-center bg-lightblue"
                                                >
                                                    <span
                                                        class="badge badge-primary text-lg"
                                                        >{{
                                                            item.cantidad
                                                        }}</span
                                                    >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>PESO</td>
                                                <td
                                                    class="text-center bg-purple"
                                                >
                                                    <span
                                                        class="badge badge-info text-lg"
                                                        >{{
                                                            item
                                                                .recepcion_detalle
                                                                .peso
                                                        }}</span
                                                    >
                                                </td>
                                                <td
                                                    class="text-center bg-lightblue"
                                                >
                                                    <span
                                                        class="badge badge-info text-lg"
                                                        >{{ item.peso }}</span
                                                    >
                                                </td>
                                            </tr>
                                        </template>
                                    </template>
                                    <template v-else>
                                        <tr>
                                            <td colspan="3" class="text-center">
                                                NO SE ENCONTRARÓN PRODUCTOS
                                            </td>
                                        </tr>
                                    </template>
                                    <template></template>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        index: {
            type: Number,
            default: 0,
        },
        accion: {
            type: String,
            default: "nuevo",
        },
        errors: {
            type: [Object, Array],
            validator: function (value) {
                return typeof value === "object" || typeof value === "array";
            },
        },
        historia_recepcion: {
            type: Object,
            default: {
                id: 0,
                recepcion_pedido_id: 0,
                user_id: 0,
                solicitud_pedido_id: 0,
                distribucion_pedido_id: 0,
                cantidad: 0,
                peso: 0,
                fecha: "",
                historia_recepcion_detalles: [],
                recepcion_detalle: {
                    recepcion_pedido_id: 0,
                    solicitud_detalle_id: 0,
                    cantidad: 0,
                    cantidad_restante: 0,
                    cantidad_res_aux: 0,
                    peso: 0,
                    peso_restante: 0,
                    peso_res_aux: 0,
                },
            },
        },
    },
    data() {
        return {};
    },
    methods: {
        calculaCantidadRestante(index) {
            let valor = this.historia_recepcion.historia_recepcion_detalles[
                index
            ].cantidad
                ? this.historia_recepcion.historia_recepcion_detalles[index]
                      .cantidad
                : 0;

            let restante =
                this.historia_recepcion.historia_recepcion_detalles[index]
                    .recepcion_detalle.cantidad_res_aux;
            if (this.accion == "edit") {
                restante =
                    parseFloat(restante) +
                    this.historia_recepcion.historia_recepcion_detalles[index]
                        .cantidad_aux;
            }

            if (valor <= restante) {
                this.historia_recepcion.historia_recepcion_detalles[
                    index
                ].recepcion_detalle.cantidad_restante =
                    parseFloat(restante) - parseFloat(valor);
            } else {
                Swal.fire({
                    icon: "error",
                    title:
                        "La cantidad ingresada supera al disponible de: " +
                        restante,
                    showConfirmButton: true,
                    confirmButtonColor: "#c57a40",
                    confirmButtonText: "Aceptar",
                });
                this.historia_recepcion.historia_recepcion_detalles[
                    index
                ].recepcion_detalle.cantidad_restante = 0;
                this.historia_recepcion.historia_recepcion_detalles[
                    index
                ].cantidad = restante;
            }
        },
        calculaPesoRestante(index) {
            let valor = this.historia_recepcion.historia_recepcion_detalles[
                index
            ].peso
                ? this.historia_recepcion.historia_recepcion_detalles[index]
                      .peso
                : 0;

            let restante =
                this.historia_recepcion.historia_recepcion_detalles[index]
                    .recepcion_detalle.peso_res_aux;
            if (this.accion == "edit") {
                restante =
                    parseFloat(restante) +
                    this.historia_recepcion.historia_recepcion_detalles[index]
                        .peso_aux;
            }

            if (valor <= restante) {
                this.historia_recepcion.historia_recepcion_detalles[
                    index
                ].recepcion_detalle.peso_restante =
                    parseFloat(restante) - parseFloat(valor);
            } else {
                Swal.fire({
                    icon: "error",
                    title:
                        "El peso ingresado supera al disponible de: " +
                        restante,
                    showConfirmButton: true,
                    confirmButtonColor: "#c57a40",
                    confirmButtonText: "Aceptar",
                });
                this.historia_recepcion.historia_recepcion_detalles[
                    index
                ].recepcion_detalle.peso_restante = 0;
                this.historia_recepcion.historia_recepcion_detalles[
                    index
                ].peso = restante;
            }
        },
    },
};
</script>
