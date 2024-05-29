swTraspasos = false;
swTransferencias = false;
swACH = false;
swSolicitudes = false;
swHabilitacion = false;
swPrestamos = false;
swInstituciones = false;
swPlanillas = false;
swServicios = false;
swTarjetasCredito = false;
swVehiculos = false;
swInmuebles = false;

$(document).ready(function () {
    if ($("#contenedor").css('width') == '320px') {
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
});

function verTraspasosPendientes() {
    if (swTraspasos == false) {
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("1");

        $("#GrillaTraspasoPendiente").css('display', 'block');
        $("#GrillaTraspasoPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloTraspasoPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloTraspasoPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloTraspasoPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swTraspasos = true;

        if ($("#ContentPlaceHolder_imgAutorizarTraspaso").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpConceptoSTraspaso').chosen('destroy');
        loadCombos();
    } else {
        cerrarTraspasosPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verTrasferenciasPendientes() {
    if (swTransferencias == false) {
        cerrarTraspasosPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("2");

        $("#GrillaTransferenciaPendiente").css('display', 'block');
        $("#GrillaTransferenciaPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloTransferenciaPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloTransferenciaPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloTransferenciaPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swTransferencias = true;

        if ($("#ContentPlaceHolder_imgAutorizarTransferencia").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpConceptoSTransferencia').chosen('destroy');
        loadCombos();
    } else {
        cerrarTransferenciasPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verACHPendientes() {
    if (swACH == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("3");

        $("#GrillaACHPendiente").css('display', 'block');
        $("#GrillaACHPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloACHPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloACHPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloACHPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swACH = true;

        if ($("#ContentPlaceHolder_imgAutorizarACH").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpnroAutorizacionSACH').chosen('destroy');
        loadCombos();
    } else {
        cerrarACHPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verSolicitudesPendientes() {
    if (swSolicitudes == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("4");

        $("#GrillaSolicitudPendiente").css('display', 'block');
        $("#GrillaSolicitudPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloSolicitudPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloSolicitudPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloSolicitudPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swSolicitudes = true;

        if ($("#ContentPlaceHolder_imgAutorizarSolicitud").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpRecogeSolicitud').chosen('destroy');
        loadCombos();
    } else {
        cerrarSolicitudesPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verHabilitacionPendientes() {   
    if (swHabilitacion == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("5");

        $("#GrillaHabilitacionPendiente").css('display', 'block');
        $("#GrillaHabilitacionPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloHabilitacionPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloHabilitacionPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloHabilitacionPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swHabilitacion = true;

        if ($("#ContentPlaceHolder_imgAutorizarHabilitacion").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_updHabilitacionP').chosen('destroy');
        loadCombos();
    } else {
        cerrarHabilitacionPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verPrestamosPendientes() {
    if (swPrestamos == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("6");

        $("#GrillaPrestamoPendiente").css('display', 'block');
        $("#GrillaPrestamoPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloPrestamoPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloPrestamoPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloPrestamoPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swPrestamos = true;

        if ($("#ContentPlaceHolder_imgAutorizarPrestamo").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_updPrestamosP').chosen('destroy');
        loadCombos();
    } else {
        cerrarPrestamosPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verInstitucionesPendientes() {  
    if (swInstituciones == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("7");

        $("#GrillaInstitucionesPendiente").css('display', 'block');
        $("#GrillaInstitucionesPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloInstitucionesPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloInstitucionesPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloInstitucionesPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swInstituciones = true;

        if ($("#ContentPlaceHolder_imgAutorizarInstitucion").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpnroAutorizacionSInstitucion').chosen('destroy');
        loadCombos();
    } else {
        cerrarInstitucionesPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verPlanillasPendientes() {  
    if (swPlanillas == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("8");

        $("#GrillaPlanillasPendiente").css('display', 'block');
        $("#GrillaPlanillasPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloPlanillasPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloPlanillasPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloPlanillasPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swPlanillas = true;

        if ($("#ContentPlaceHolder_imgAutorizarPlanillas").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpnroAutorizacionSPlanilla').chosen('destroy');
        loadCombos();
    } else {
        cerrarPlanillasPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verServiciosPendientes() {
    if (swServicios == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("9");

        $("#GrillaServiciosPendiente").css('display', 'block');
        $("#GrillaServiciosPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloServiciosPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloServiciosPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloServiciosPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swServicios = true;

        if ($("#ContentPlaceHolder_imgAutorizarServicios").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpnroAutorizacionSPagoServicios').chosen('destroy');
        loadCombos();
    } else {
        cerrarServiciosPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function verTarjetasCreditoPendientes() {
    if (swTarjetasCredito == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarVehiculosPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("10");

        $("#GrillaTarjetaCreditoPendiente").css('display', 'block');
        $("#GrillaTarjetaCreditoPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloTarjetaCreditoPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloTarjetaCreditoPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloTarjetaCreditoPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swTarjetasCredito = true;

        if ($("#ContentPlaceHolder_imgAutorizarCredito").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }

    } else {
        cerrarTarjetasCreditoPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}


function verVehiculosPendientes() {   
    if (swVehiculos == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarInmueblesPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("11");

        $("#GrillaVehiculosPendiente").css('display', 'block');
        $("#GrillaVehiculosPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloVehiculosPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloVehiculosPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloVehiculosPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swVehiculos = true;

        if ($("#ContentPlaceHolder_imgAutorizarVehiculos").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpnroAutorizacionSVehiculos').chosen('destroy');
        loadCombos();
    } else {
        cerrarVehiculosPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}


function verInmueblesPendientes() {
    if (swInmuebles == false) {
        cerrarTraspasosPendientes();
        cerrarTransferenciasPendientes();
        cerrarACHPendientes();
        cerrarSolicitudesPendientes();
        cerrarHabilitacionPendientes();
        cerrarPrestamosPendientes();
        cerrarInstitucionesPendientes();
        cerrarPlanillasPendientes();
        cerrarServiciosPendientes();
        cerrarTarjetasCreditoPendientes();
        cerrarVehiculosPendientes();

        $("#ContentPlaceHolder_swAutorizacion").val("12");

        $("#GrillaInmueblesPendiente").css('display', 'block');
        $("#GrillaInmueblesPendiente").css('margin-bottom', '15px');
        $("#ContentPlaceHolder_TituloInmueblesPendiente").css('border-bottom-left-radius', '0');
        $("#ContentPlaceHolder_TituloInmueblesPendiente").css('border-bottom-right-radius', '0');
        $("#ContentPlaceHolder_TituloInmueblesPendiente").css('background-image', 'url("Slices/flecha doble_bco.png"');
        swInmuebles = true;

        if ($("#ContentPlaceHolder_imgAutorizarInmuebles").attr('src') == 'Imagenes/check.png') {
            $("#ContentPlaceHolder_clave_ctas_terceros").show();
        } else {
            $("#ContentPlaceHolder_clave_ctas_terceros").hide();
        }
        $('#ContentPlaceHolder_PdrpnroAutorizacionSInmuebles').chosen('destroy');
        loadCombos();
    } else {
        cerrarInmueblesPendientes();
        $("#ContentPlaceHolder_swAutorizacion").val("0");
        $("#ContentPlaceHolder_clave_ctas_terceros").hide();
    }
}

function cerrarTraspasosPendientes() {
    $("#GrillaTraspasoPendiente").css('display', 'none');
    $("#GrillaTraspasoPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloTraspasoPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloTraspasoPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloTraspasoPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swTraspasos = false;
}

function cerrarTransferenciasPendientes() {
    $("#GrillaTransferenciaPendiente").css('display', 'none');
    $("#GrillaTransferenciaPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloTransferenciaPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloTransferenciaPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloTransferenciaPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swTransferencias = false;
}

function cerrarACHPendientes() {
    $("#GrillaACHPendiente").css('display', 'none');
    $("#GrillaACHPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloACHPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloACHPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloACHPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swACH = false;
}

function cerrarSolicitudesPendientes() {
    $("#GrillaSolicitudPendiente").css('display', 'none');
    $("#GrillaSolicitudPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloSolicitudPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloSolicitudPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloSolicitudPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swSolicitudes = false;
}

function cerrarHabilitacionPendientes() {
    $("#GrillaHabilitacionPendiente").css('display', 'none');
    $("#GrillaHabilitacionPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloHabilitacionPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloHabilitacionPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloHabilitacionPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swHabilitacion = false;
}

function cerrarPrestamosPendientes() {
    $("#GrillaPrestamoPendiente").css('display', 'none');
    $("#GrillaPrestamoPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloPrestamoPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloPrestamoPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloPrestamoPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swPrestamos = false;
}

function cerrarInstitucionesPendientes() {
    $("#GrillaInstitucionesPendiente").css('display', 'none');
    $("#GrillaInstitucionesPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloInstitucionesPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloInstitucionesPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloInstitucionesPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swInstituciones = false;
}

function cerrarPlanillasPendientes() {
    $("#GrillaPlanillasPendiente").css('display', 'none');
    $("#GrillaPlanillasPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloPlanillasPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloPlanillasPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloPlanillasPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swPlanillas = false;
}

function cerrarServiciosPendientes() {
    $("#GrillaServiciosPendiente").css('display', 'none');
    $("#GrillaServiciosPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloServiciosPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloServiciosPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloServiciosPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swServicios = false;
}

function cerrarTarjetasCreditoPendientes() {
    $("#GrillaTarjetaCreditoPendiente").css('display', 'none');
    $("#GrillaTarjetaCreditoPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloTarjetaCreditoPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloTarjetaCreditoPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloTarjetaCreditoPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swTarjetasCredito = false;
}

function cerrarVehiculosPendientes() {
    $("#GrillaVehiculosPendiente").css('display', 'none');
    $("#GrillaVehiculosPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloVehiculosPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloVehiculosPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloVehiculosPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swVehiculos = false;
}

function cerrarInmueblesPendientes() {
    $("#GrillaInmueblesPendiente").css('display', 'none');
    $("#GrillaInmueblesPendiente").css('margin-bottom', '0');
    $("#ContentPlaceHolder_TituloInmueblesPendiente").css('border-bottom-left-radius', '7px');
    $("#ContentPlaceHolder_TituloInmueblesPendiente").css('border-bottom-right-radius', '7px');
    $("#ContentPlaceHolder_TituloInmueblesPendiente").css('background-image', 'url("Slices/flecha doble_bco - abajo.png"');
    swInmuebles = false;
}