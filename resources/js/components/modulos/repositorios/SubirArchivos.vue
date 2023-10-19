<template>
    <div class="content-wrapper contenedor_repositorio_archivos">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar Repositorio - Archivos</h1>
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
                                                name: 'repositorios.index',
                                            }"
                                            class="btn btn-default btn-flat btn-block"
                                        >
                                            <i class="fa fa-arrow-left"></i>
                                            Volver a Repositorios
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card" v-if="oRepositorio">
                            <div class="card-header bg-warning">
                                <h4 class="font-weight-bold">
                                    {{ oRepositorio.descripcion }}
                                </h4>
                            </div>
                            <div class="card-body">
                                <el-upload
                                    class="upload-demo"
                                    drag
                                    :action="''"
                                    :before-upload="beforeUpload"
                                    :file-list="fileList"
                                    list-type="picture"
                                    multiple
                                    :before-remove="confirmaEliminacion"
                                >
                                    <i class="el-icon-upload"></i>
                                    <div class="el-upload__text">
                                        Suelta tu archivo aquí o
                                        <em>haz clic para cargar</em>
                                    </div>
                                    <div slot="tip" class="el-upload__tip">
                                        Los archivos no deben pesar mas de 4096
                                        KB
                                    </div>
                                    <template v-slot:file="item">
                                        <div class="custom-file-item">
                                            <img
                                                v-if="
                                                    item.file.tipo == 'imagen'
                                                "
                                                :src="item.file.url"
                                                alt=""
                                                class="el-upload-list__item-thumbnail"
                                            />
                                            <img
                                                v-if="item.file.tipo == 'video'"
                                                :src="url_icono_videos"
                                                alt=""
                                                class="el-upload-list__item-thumbnail"
                                            />
                                            <img
                                                v-if="item.file.tipo == 'audio'"
                                                :src="url_icono_audios"
                                                alt=""
                                                class="el-upload-list__item-thumbnail"
                                            />
                                            <img
                                                v-if="item.file.tipo == 'archivo'"
                                                :src="url_icono_archivos"
                                                alt=""
                                                class="el-upload-list__item-thumbnail"
                                            />
                                            <a
                                                :href="item.file.url"
                                                target="_blank"
                                                class="el-upload-list__item-name"
                                                ><i class="el-icon-document"></i
                                                >{{ item.file.archivo }} </a
                                            ><label
                                                class="el-upload-list__item-status-label"
                                                ><i
                                                    class="el-icon-upload-success el-icon-check"
                                                ></i></label
                                            ><i
                                                class="el-icon-close"
                                                @click="handleRemove(item.file)"
                                            ></i
                                            ><i class="el-icon-close-tip"
                                                >Pulse Eliminar para retirar</i
                                            >
                                        </div>
                                    </template>
                                </el-upload>
                            </div>
                        </div>
                        <div class="card" v-else>
                            <div class="card-body">
                                <h4 class="font-weight-bold w-100 text-center">
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
            url_subir_archivo:
                main_url + "/admin/repositorio_archivos/store/" + this.id,
            oRepositorio: null,
            fileList: [],
            url_icono_videos: main_url + "/imgs/video-player.png",
            url_icono_audios: main_url + "/imgs/volume.png",
            url_icono_archivos: main_url + "/imgs/documents.png",
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getRepositorio();
    },
    methods: {
        getRepositorio() {
            axios
                .get(main_url + "/admin/repositorios/" + this.id)
                .then((response) => {
                    this.oRepositorio = response.data.repositorio;
                    this.fileList = this.oRepositorio.repositorio_archivos;
                });
        },
        handleRemove(file) {
            const index = this.fileList.indexOf(file); // Encuentra el índice del archivo en la lista
            Swal.fire({
                title: "¿Quierés eliminar este archivo?",
                html: `<strong>${file.archivo}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#c57a40",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post(
                            main_url + "/admin/repositorio_archivos/" + file.id,
                            {
                                _method: "DELETE",
                            }
                        )
                        .then((res) => {
                            if (index !== -1) {
                                this.fileList.splice(index, 1); // Elimina el archivo de la lista
                                this.fileList = fileList; // Actualiza la lista de archivos
                            }
                            this.getRepositorio();
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
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
                }
            });
        },
        handlePreview(file) {
            console.log(file);
        },
        beforeUpload(file) {
            const maxSizeInKB = 4096; // Peso máximo permitido en kilobytes (4096 KB)
            // if (file.size / 1024 <= maxSizeInKB) {
            const formData = new FormData();
            formData.append("file", file);
            let config = {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            };
            axios
                .post(this.url_subir_archivo, formData, config)
                .then((response) => {
                    this.getRepositorio();
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

            return false;
            // } else {
            //     // El archivo supera el peso máximo permitido, muestra un mensaje de error
            //     this.$message.error(
            //         "El archivo supera el tamaño máximo permitido de 4096 KB"
            //     );
            //     return false;
            // }
        },
    },
};
</script>

<style>
.contenedor_repositorio_archivos .el-upload,
.contenedor_repositorio_archivos .el-upload-dragger {
    width: 100%;
}
</style>
