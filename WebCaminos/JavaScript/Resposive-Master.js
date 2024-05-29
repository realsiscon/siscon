$(document).ready(function () {
    modificar();
});

$(window).resize(function () {
    modificar();
});

function modificar() {
    if ($("#contenedor").css('width') == '980px') {
        $('#navegador').css('display', '');
        $('#bienvenida_usuario').css('display', '');
        $('#notificaciones').css('display', '');
        $('#navegador').css('padding-left', '10px');
        cerrarlabelsmart();
        cerrar_cuenta();
        cerrar_dpf();
        cerrar_prestamo();
        cerrar_tarjeta();
        cerrar_tarjeta_credito();
    } else if ($("#contenedor").css('width') == '768px') {
        $('#navegador').css({ 'display': 'none', 'position': '', 'border-right': '', 'padding-left': '10px', 'top': '', 'width': '200px' });
        $('#navegador ul li a').css({ 'width': '200px', 'background-position': '175px center' });
        $('#ul_notificaciones li a').css({ 'width': '160px', 'background-position': 'right 5px center' });

        $('#hplTraspasos').css({ 'width': '120px', 'padding-right': '50px' });
        $('#hptPrestamo').css({ 'width': '120px', 'padding-right': '50px' });
        
        $('#navegador ul li a ul li a').css('width', '200px');
        $('#bienvenida_usuario').css('display', '');
        $('#notificaciones').css('display', '');
        cerrar_cuenta();
        cerrar_dpf();
        cerrar_prestamo();
        cerrar_tarjeta();
        cerrar_tarjeta_credito();
        cerrarlabelsmart();
    } else if ($("#contenedor").css('width') == '320px') {
        $('#logo_fassil_escritorio').attr('onclick', 'mostrar_menu_smart()');
    }
}

var menu_activo = false;
function mostrar_tablet_menu() {
    if (menu_activo == false) {
        $('#navegador').css('display', 'block');
        $('#bienvenida_usuario').css('display', 'none');
        $('#notificaciones').css('display', 'none');
        $('#navegador').css('padding-left', '0');
        $('#navegador').css('margin-top', '0');
        $('.cuerpo_holder').css({ 'position': 'absolute', 'z-index': '-2' });

        $('#segunda_cabecera_1').css({ 'position': 'absolute', 'z-index': '-2' });
        
        menu_activo = true;

        $("#globo_notificaciones_tablet").css('visibility', 'hidden');
        sw_t = false;
    } else {
        $('#navegador').css('display', 'none');
        $('.cuerpo_holder').css({ 'position': '', 'z-index': '' });

        $('#segunda_cabecera_1').css({ 'position': '', 'z-index': '' });
        menu_activo = false;
    }
}

var smart_menu_a = false;
function mostrar_menu_smart() {
    if (smart_menu_a == false) {
        smartphone();

        $("#globo_notificaciones_smart").css('visibility', 'hidden');
        $('#navegador').css('margin-top', '0');
        sw_s = false;
        smart_menu_a = true;
    } else {
        tablet();
        smart_menu_a = false;
    }
}

function smartphone() {
    $('#navegador').css({ 'display': 'block', 'position': 'absolute', 'border-right': '0', 'padding-left': '0', 'top': '74px', 'width': '320px', 'z-index': '1' });
    $('#navegador ul li a').css({ 'width': '320px', 'background-position': '275px center' });
    $('#navegador ul li a ul li a').css('width', '320px');
    $('#bienvenida_usuario').css('display', 'none');
    $('#notificaciones').css('display', 'none');
}

function tablet() {
    $('#navegador').css({ 'display': 'none', 'position': '', 'border-right': '', 'padding-left': '10px', 'top': '', 'width': '200px' });
    $('#navegador ul li a').css({ 'width': '200px', 'background-position': '175px center' });
    $('#navegador ul li a ul li a').css('width', '200px');
    $('#bienvenida_usuario').css('display', '');
    $('#notificaciones').css('display', '');
}


function cerrarlabelsmart() {
    $('.titulo_grilla_smart').css('display', 'none');
}

//-----------------Cuenta------------------------------
var sw_cuenta = false; 
function abrir_cuenta() {
    $('#pc_smartphone').css('display', 'block');
    $('#ver_detalle').css('display', 'block');

    $('#ContentPlaceHolder_id_cuenta').css('background-image', 'url("Slices/flecha doble_bco.png")');

    $('#ContentPlaceHolder_id_cuenta').css('border-bottom-left-radius', '0px');
    $('#ContentPlaceHolder_id_cuenta').css('border-bottom-right-radius', '0px');
    sw_cuenta = true;


}

function cerrar_cuenta() {
    if (sw_detalle == true) {
        $('#ContentPlaceHolder_detalle_pc_smartphone').css('display', 'none');

        $('#ver_detalle').css('background-image', 'url("Slices/flecha doble_gris_abajo.png")');
        $('#ver_detalle').css('border-bottom-left-radius', '7px');
        $('#ver_detalle').css('border-bottom-right-radius', '7px');
        $('#ver_detalle').css('border-bottom', '1px solid #8F9094');
        sw_detalle = false;
    }
    $('#pc_smartphone').css('display', 'none');
    $('#ver_detalle').css('display', 'none');

    $('#ContentPlaceHolder_id_cuenta').css('background-image', 'url("Slices/flecha doble_bco - abajo.png")');
    $('#ContentPlaceHolder_id_cuenta').css('border-radius', '7px');

    sw_cuenta = false;
}

function ver_cuenta() {
    if (sw_cuenta == false) {
        abrir_cuenta();
        $('#ContentPlaceHolder_drpCuentaS').chosen('destroy');
        $('#ContentPlaceHolder_drpAccionS').chosen('destroy');
        loadCombos();
        //cerrar_prestamo();
        //cerrar_dpf();
        //cerrar_tarjeta();
        //cerrar_tarjeta_credito();
        
    } else {
        cerrar_cuenta();   
    }
}

var sw_detalle = false;
function ver_detalle() {
    if (sw_detalle == false) {
        $('#ContentPlaceHolder_detalle_pc_smartphone').css('display', 'block');

        $('#ver_detalle').css('background-image', 'url("Slices/flecha doble_gris.png")');
        $('#ver_detalle').css('border-bottom-left-radius', '0px');
        $('#ver_detalle').css('border-bottom-right-radius', '0px');
        $('#ver_detalle').css('border-bottom', '0');
        sw_detalle = true;
    } else {
        $('#ContentPlaceHolder_detalle_pc_smartphone').css('display', 'none');

        $('#ver_detalle').css('background-image', 'url("Slices/flecha doble_gris_abajo.png")');
        $('#ver_detalle').css('border-bottom-left-radius', '7px');
        $('#ver_detalle').css('border-bottom-right-radius', '7px');
        $('#ver_detalle').css('border-bottom', '1px solid #8F9094');
        sw_detalle = false;
    }
}

//----------------------------------------------------------


//-----------------Tarjetas------------------------------
var sw_tarjeta = false;
function abrir_tarjeta() {
    $('#tarjeta_smartphone').css('display', 'block');
    $('#ver_detalle_tarjeta').css('display', 'block');

    $('#ContentPlaceHolder_id_tarjeta').css('background-image', 'url("Slices/flecha doble_bco.png")');

    $('#ContentPlaceHolder_id_tarjeta').css('border-bottom-left-radius', '0px');
    $('#ContentPlaceHolder_id_tarjeta').css('border-bottom-right-radius', '0px');
    sw_tarjeta = true;
}

function cerrar_tarjeta() {
    if (sw_detalle_tarjeta == true) {
        $('#ContentPlaceHolder_detalle_tarjeta_smartphone').css('display', 'none');

        $('#ver_detalle_tarjeta').css('background-image', 'url("Slices/flecha doble_gris_abajo.png")');
        $('#ver_detalle_tarjeta').css('border-bottom-left-radius', '7px');
        $('#ver_detalle_tarjeta').css('border-bottom-right-radius', '7px');
        $('#ver_detalle_tarjeta').css('border-bottom', '1px solid #8F9094');
        sw_detalle_tarjeta = false;
    }
    $('#tarjeta_smartphone').css('display', 'none');
    $('#ver_detalle_tarjeta').css('display', 'none');

    $('#ContentPlaceHolder_id_tarjeta').css('background-image', 'url("Slices/flecha doble_bco - abajo.png")');
    $('#ContentPlaceHolder_id_tarjeta').css('border-radius', '7px');

    sw_tarjeta = false;
}

function ver_tarjeta() {
    if (sw_tarjeta == false) {
        abrir_tarjeta();
        $('#ContentPlaceHolder_drpTarjetaS').chosen('destroy');
        $('#ContentPlaceHolder_drpAccionTarjetaS').chosen('destroy');
        loadCombos();
        //cerrar_cuenta();
        //cerrar_prestamo();
        //cerrar_dpf();
        //cerrar_tarjeta_credito();

    } else {
        cerrar_tarjeta();
    }
}

var sw_detalle_tarjeta = false;
function ver_detalle_tarjeta() {
    if (sw_detalle_tarjeta == false) {
        $('#ContentPlaceHolder_detalle_tarjeta_smartphone').css('display', 'block');

        $('#ver_detalle_tarjeta').css('background-image', 'url("Slices/flecha doble_gris.png")');
        $('#ver_detalle_tarjeta').css('border-bottom-left-radius', '0px');
        $('#ver_detalle_tarjeta').css('border-bottom-right-radius', '0px');
        $('#ver_detalle_tarjeta').css('border-bottom', '0');
        sw_detalle_tarjeta = true;
    } else {
        $('#ContentPlaceHolder_detalle_tarjeta_smartphone').css('display', 'none');

        $('#ver_detalle_tarjeta').css('background-image', 'url("Slices/flecha doble_gris_abajo.png")');
        $('#ver_detalle_tarjeta').css('border-bottom-left-radius', '7px');
        $('#ver_detalle_tarjeta').css('border-bottom-right-radius', '7px');
        $('#ver_detalle_tarjeta').css('border-bottom', '1px solid #8F9094');
        sw_detalle_tarjeta = false;
    }
}
//---------------------------------------------------------


//-----------------Tarjetas Credito------------------------------
var sw_tarjeta_credito = false;
function abrir_tarjeta_credito() {
    $('#tarjeta_credito_smartphone').css('display', 'block');

    //Descomentar esta linea cuando se despliegue Movimientos

    $('#ver_detalle_tarjeta_credito').css('display', 'none');
    //$('#ver_detalle_tarjeta_credito').css('display', 'block');

    $('#ContentPlaceHolder_id_tarjeta_credito').css('background-image', 'url("Slices/flecha doble_bco.png")');

    $('#ContentPlaceHolder_id_tarjeta_credito').css('border-bottom-left-radius', '0px');
    $('#ContentPlaceHolder_id_tarjeta_credito').css('border-bottom-right-radius', '0px');
    sw_tarjeta_credito = true;
}

function cerrar_tarjeta_credito() {
    if (sw_detalle_tarjeta == true) {
        $('#ContentPlaceHolder_detalle_tarjeta_credito_smartphone').css('display', 'none');

        $('#ver_detalle_tarjeta_credito').css('background-image', 'url("Slices/flecha doble_gris_abajo.png")');
        $('#ver_detalle_tarjeta_credito').css('border-bottom-left-radius', '7px');
        $('#ver_detalle_tarjeta_credito').css('border-bottom-right-radius', '7px');
        $('#ver_detalle_tarjeta_credito').css('border-bottom', '1px solid #8F9094');
        sw_detalle_tarjeta_credito = false;
    }
    $('#tarjeta_credito_smartphone').css('display', 'none');
    $('#ver_detalle_tarjeta_credito').css('display', 'none');

    $('#ContentPlaceHolder_id_tarjeta_credito').css('background-image', 'url("Slices/flecha doble_bco - abajo.png")');
    $('#ContentPlaceHolder_id_tarjeta_credito').css('border-radius', '7px');

    sw_tarjeta_credito = false;
}

function ver_tarjeta_credito() {
    if (sw_tarjeta_credito == false) {
        abrir_tarjeta_credito();
        $('#ContentPlaceHolder_drpTarjetaCreditoS').chosen('destroy');
        $('#ContentPlaceHolder_drpAccionTarjetaCreditoS').chosen('destroy');
        loadCombos();
        //cerrar_cuenta();
        //cerrar_prestamo();
        //cerrar_dpf();
        //cerrar_tarjeta();

    } else {
        cerrar_tarjeta_credito();
    }
}

var sw_detalle_tarjeta_credito = false;
function ver_detalle_tarjeta_credito() {
    if (sw_detalle_tarjeta_credito == false) {
        $('#ContentPlaceHolder_detalle_tarjeta_credito_smartphone').css('display', 'none');
        //Descomentar cuando la tarjeta de credito tenga movimientos
        //$('#ContentPlaceHolder_detalle_tarjeta_credito_smartphone').css('display', 'block');

        $('#ver_detalle_tarjeta_credito').css('background-image', 'url("Slices/flecha doble_gris.png")');
        $('#ver_detalle_tarjeta_credito').css('border-bottom-left-radius', '0px');
        $('#ver_detalle_tarjeta_credito').css('border-bottom-right-radius', '0px');
        $('#ver_detalle_tarjeta_credito').css('border-bottom', '0');
        sw_detalle_tarjeta_credito = true;
    } else {
        $('#ContentPlaceHolder_detalle_tarjeta_credito_smartphone').css('display', 'none');

        $('#ver_detalle_tarjeta_credito').css('background-image', 'url("Slices/flecha doble_gris_abajo.png")');
        $('#ver_detalle_tarjeta_credito').css('border-bottom-left-radius', '7px');
        $('#ver_detalle_tarjeta_credito').css('border-bottom-right-radius', '7px');
        $('#ver_detalle_tarjeta_credito').css('border-bottom', '1px solid #8F9094');
        sw_detalle_tarjeta_credito = false;
    }
}
//---------------------------------------------------------

//---------------Prestamos----------------------------------
function abrir_prestamo() {
    $('#pres_smartphone').css('display', 'block');

    $('#ContentPlaceHolder_id_prestamo').css('background-image', 'url("Slices/flecha doble_bco.png")');
    $('#ContentPlaceHolder_id_prestamo').css('border-bottom-left-radius', '0px');
    $('#ContentPlaceHolder_id_prestamo').css('border-bottom-right-radius', '0px');
    sw_prestamo = true;
}

function cerrar_prestamo() {
    $('#pres_smartphone').css('display', 'none');

    $('#ContentPlaceHolder_id_prestamo').css('background-image', 'url("Slices/flecha doble_bco - abajo.png")');
    $('#ContentPlaceHolder_id_prestamo').css('border-radius', '7px');
    sw_prestamo = false;
}

var sw_prestamo = false;
function ver_prestamo() {
    if (sw_prestamo == false) {
        abrir_prestamo();
        $('#ContentPlaceHolder_drpPrestamosS').chosen('destroy');
        $('#ContentPlaceHolder_drpAccionPrestamoS').chosen('destroy');
        loadCombos();
        //cerrar_cuenta();
        //cerrar_dpf();
        //cerrar_tarjeta();
        //cerrar_tarjeta_credito();
    } else {
        cerrar_prestamo();
    }
}

//----------------------------------------------------------

//--------------------DPF----------------------------------

function abrir_dpf() {
    $('#DPF_smartphone ').css('display', 'block');

    $('#ContentPlaceHolder_id_dpf').css('background-image', 'url("Slices/flecha doble_bco.png")');
    $('#ContentPlaceHolder_id_dpf').css('border-bottom-left-radius', '0px');
    $('#ContentPlaceHolder_id_dpf').css('border-bottom-right-radius', '0px');
    sw_DPF = true;
}

function cerrar_dpf() {
    $('#DPF_smartphone ').css('display', 'none');

    $('#ContentPlaceHolder_id_dpf').css('background-image', 'url("Slices/flecha doble_bco - abajo.png")');
    $('#ContentPlaceHolder_id_dpf').css('border-radius', '7px');
    sw_DPF = false;
}

var sw_DPF = false;
function ver_DPF() {
    if (sw_DPF == false) {
        abrir_dpf();
        $('#ContentPlaceHolder_drpDPFS').chosen('destroy');
        $('#ContentPlaceHolder_drpAccionPDFS').chosen('destroy');
        loadCombos();
        //cerrar_cuenta();
        //cerrar_prestamo();
        //cerrar_tarjeta();
        //cerrar_tarjeta_credito();
    } else {
        cerrar_dpf(); 
    }
}
//----------------------------------------------------------