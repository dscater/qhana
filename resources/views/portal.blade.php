@inject('configuracion', 'App\Models\Configuracion')
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $configuracion->first()->alias }}</title>
    <style>
    </style>

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/portal.css') }}">
</head>

<body class="sidebar-mini layout-fixed control-sidebar-slide-open layout-navbar-fixed text-sm">
    <div id="app">
        <Portal ruta="{{ route('portal.inicio') }}" logo="{{ asset('imgs/' . $configuracion->first()->logo) }}"
            ruta_asset="{{ asset('') }}" configuracion="{{ $configuracion->first() }}">
        </Portal>
    </div>
    <script>
        var main_url = "{{ url('') }}";
        var app_base = "";
        // var app_base = "qhana"; //habilitar esta linea si existe la carpeta public en el proyecto con el nombre del sistema
    </script>
    <script src="{{ asset('js/jquery.js') }}"></script>
    <script src="{{ asset('js/portal.js') }}"></script>
    <script src="{{ asset('js/app.js') }}"></script>
    {{-- <script src="{{ asset('js/portal_custom.js') }}"></script> --}}
    <script>
        // OPCIONAL
        $('.js-addwish-b2').on('click', function(e) {
            e.preventDefault();
        });

        $('.js-addwish-b2').each(function() {
            var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
            $(this).on('click', function() {
                swal(nameProduct, "is added to wishlist !", "success");

                $(this).addClass('js-addedwish-b2');
                $(this).off('click');
            });
        });

        $('.js-addwish-detail').each(function() {
            var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

            $(this).on('click', function() {
                swal(nameProduct, "is added to wishlist !", "success");

                $(this).addClass('js-addedwish-detail');
                $(this).off('click');
            });
        });

        /*---------------------------------------------*/

        $('.js-addcart-detail').each(function() {
            var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
            $(this).on('click', function() {
                swal(nameProduct, "is added to cart !", "success");
            });
        });
        // FIN OPCIONAL

        $(".js-select2").each(function() {
            $(this).select2({
                minimumResultsForSearch: 20,
                dropdownParent: $(this).next('.dropDownSelect2')
            });
        })

        $('.parallax100').parallax100();

        $('.gallery-lb').each(function() { // the containers for all your galleries
            $(this).magnificPopup({
                delegate: 'a', // the selector for gallery item
                type: 'image',
                gallery: {
                    enabled: true
                },
                mainClass: 'mfp-fade'
            });
        });

        $('.js-pscroll').each(function() {
            $(this).css('position', 'relative');
            $(this).css('overflow', 'hidden');
            var ps = new PerfectScrollbar(this, {
                wheelSpeed: 1,
                scrollingThreshold: 1000,
                wheelPropagation: false,
            });

            $(window).on('resize', function() {
                ps.update();
            })
        });
    </script>
</body>

</html>
