<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar portal - Contactos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 mb-2">
                        <router-link
                            :to="{ name: 'admin_portal.index' }"
                            class="btn btn-default btn-flat btn-block"
                        >
                            <i class="fa fa-arrow-left"></i>
                            Volver
                        </router-link>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-dark">
                                <h4 class="card-title font-weight-bold">
                                    INFORMACIÓN DE CONTACTO
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.direccion,
                                            }"
                                            >Dirección*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Dirección"
                                            :class="{
                                                'is-invalid': errors.direccion,
                                            }"
                                            v-model="oContacto.direccion"
                                            autosize
                                        >
                                            >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.direccion"
                                            v-text="errors.direccion[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.fonos,
                                            }"
                                            >Teléfonos*</label
                                        >
                                        <el-input
                                            placeholder="Teléfonos"
                                            :class="{
                                                'is-invalid': errors.fonos,
                                            }"
                                            v-model="oContacto.fonos"
                                        >
                                            >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.fonos"
                                            v-text="errors.fonos[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.correo,
                                            }"
                                            >Correo*</label
                                        >
                                        <el-input
                                            placeholder="Correo"
                                            :class="{
                                                'is-invalid': errors.correo,
                                            }"
                                            v-model="oContacto.correo"
                                        >
                                            >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.correo"
                                            v-text="errors.correo[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.mapa,
                                            }"
                                            >Mapa*</label
                                        >
                                        <el-input
                                            placeholder="Mapa"
                                            :class="{
                                                'is-invalid': errors.mapa,
                                            }"
                                            v-model="oContacto.mapa"
                                        >
                                            >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.mapa"
                                            v-text="errors.mapa[0]"
                                        ></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <!-- Map -->
                                        <div
                                            id="google_map"
                                            data-map-x="40.691446"
                                            data-map-y="-73.886787"
                                        ></div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="col-md-3">
                                    <button
                                        class="btn btn-warning btn-flat btn-block"
                                        @click="actualizaInformacion()"
                                    >
                                        <i class="fa fa-save"></i> Guardar
                                        cambios
                                    </button>
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
    components: {},
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
            oContacto: {
                direccion: "",
                fonos: "",
                correo: "",
                mapa: "",
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getContacto();
    },
    methods: {
        getContacto() {
            let url = main_url + "/admin/contactos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.contacto) {
                    this.oContacto = res.data.contacto;
                } else {
                    
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/contactos";
                let formdata = new FormData();
                formdata.append(
                    "direccion",
                    this.oContacto.direccion ? this.oContacto.direccion : ""
                );
                formdata.append(
                    "fonos",
                    this.oContacto.fonos ? this.oContacto.fonos : ""
                );
                formdata.append(
                    "correo",
                    this.oContacto.correo ? this.oContacto.correo : ""
                );
                formdata.append(
                    "mapa",
                    this.oContacto.mapa ? this.oContacto.mapa : ""
                );
                axios
                    .post(url, formdata)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.oContacto = res.data.contactos;
                        this.errors = [];
                    })
                    .catch((error) => {
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
    },
};
</script>

<style>
#google_map {
    height: 400px;
}
</style>
