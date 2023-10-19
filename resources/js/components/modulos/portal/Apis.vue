<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar portal - Apis</h1>
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
                                    ENVÍO DE CORREOS
                                    <a href="https://support.google.com/mail/answer/185833?hl=es#:~:text=En%20%22Iniciar%20sesi%C3%B3n%20en%20Google,Selecciona%20Generar." class="text-white"
                                        target="_blank"><i class="fa fa-question-circle"></i
                                    ></a>
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.correo,
                                            }"
                                            >Correo (Gmail)*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Correo"
                                            :class="{
                                                'is-invalid': errors.correo,
                                            }"
                                            v-model="oApi.correo"
                                            autosize
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
                                                'text-danger': errors.nombre,
                                            }"
                                            >Nombre*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Nombre"
                                            :class="{
                                                'is-invalid': errors.nombre,
                                            }"
                                            v-model="oApi.nombre"
                                            autosize
                                        >
                                            >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.nombre"
                                            v-text="errors.nombre[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.password,
                                            }"
                                            >Contraseña*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Contraseña"
                                            :class="{
                                                'is-invalid': errors.password,
                                            }"
                                            v-model="oApi.password"
                                            autosize
                                        >
                                            >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.password"
                                            v-text="errors.password[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    MAPA DE GOOGLE MAPS
                                    <a href="https://developers.google.com/maps/gmp-get-started?hl=es-419" class="text-white" target="_blank"
                                        ><i class="fa fa-question-circle"></i
                                    ></a>
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.api_google,
                                            }"
                                            >Key Api de Google Maps*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Api de Google Maps"
                                            :class="{
                                                'is-invalid': errors.api_google,
                                            }"
                                            v-model="oApi.api_google"
                                            autosize
                                        >
                                            >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.api_google"
                                            v-text="errors.api_google[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div> -->
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
            oApi: {
                correo: "",
                nombre: "",
                password: "",
                api_google: "",
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getApi();
    },
    methods: {
        getApi() {
            let url = main_url + "/admin/apis";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.api) {
                    this.oApi = res.data.api;
                } else {
                    this.oApi = {
                        correo: "correosyseventos@gmail.com",
                        nombre: "QHANA",
                        password: "gywdptczpyhtkghm",
                        api_google: "AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes",
                    };
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/apis";
                axios
                    .post(url, this.oApi)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.oApi = res.data.api;
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
