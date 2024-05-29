$(document).ready(function () {
    $("#checkbox").css("background", "none");
    $("#keyboard li").attr('onclick', '');
    $("#keyboard li").css('cursor', 'default');
    $("#txtContrasena1").val("");
    $("#txtContrasena1").focus();
    //Cambio Clave Acceso Primera Vez
    $("#txtClaveAnterior").val("");
    $("#txtClaveNueva").val("");
    $("#txtClaveConfirma").val("");
    $("#ContentPlaceHolder_txtClaveAnterior").val("");
    $("#ContentPlaceHolder_txtClaveNueva").val("");
    $("#ContentPlaceHolder_txtClaveConfirma").val("");
    //Cambio Clave Transaccional Primera Vez
    $("#txtTransAnterior").focus();
    $("#txtTransAnterior").val("");
    $("#txtTransNueva").val("");
    $("#txtTransConfirmar").val("");
    $("#ContentPlaceHolder_txtTransAnterior").focus();
    $("#ContentPlaceHolder_txtTransAnterior").val("");
    $("#ContentPlaceHolder_txtTransNueva").val("");
    $("#ContentPlaceHolder_txtTransConfirmar").val("");
});

sw = false;

function check() {
    if (sw != true) {
        $("#keyboard").css('display', '');
        $("#checkbox").css("background", "url(Imagenes/icon_check.png) no-repeat center");
        $("#keyboard li").attr('onclick', 'tecla_oprimida(this.id)');
        $("#shift").attr('onclick', 'shift()');
        $("#borrar").attr('onclick', 'borrar()');
        $("#espacio").attr('onclick', 'espacio()');
        $("#keyboard li").css('cursor', 'pointer');
        $("#txtContrasena1").prop('disabled', 'disabled');
        $("#txtContrasena1").val("");

        //Cambio Clave Acceso Primera Vez
        $("#txtClaveAnterior").prop('readonly', 'true');
        $("#txtClaveAnterior").val("");
        $("#txtClaveNueva").prop('readonly', 'true');
        $("#txtClaveNueva").val("");
        $("#txtClaveConfirma").prop('readonly', 'true');
        $("#txtClaveConfirma").val("");
        $("#txtClaveAnterior").focus();

        $("#ContentPlaceHolder_txtClaveAnterior").prop('readonly', 'true');
        $("#ContentPlaceHolder_txtClaveAnterior").val("");
        $("#ContentPlaceHolder_txtClaveNueva").prop('readonly', 'true');
        $("#ContentPlaceHolder_txtClaveNueva").val("");
        $("#ContentPlaceHolder_txtClaveConfirma").prop('readonly', 'true');
        $("#ContentPlaceHolder_txtClaveConfirma").val("");
        $("#ContentPlaceHolder_txtClaveAnterior").focus();

        cadena = "";
        cadena_anterior = ""; cadena_nueva = ""; cadena_confirma = "";
        sw = true;
    } else {
        $("#keyboard").css('display', 'none');
        $("#checkbox").css("background", "none");
        $("#keyboard li").attr('onclick', '');
        $("#keyboard li").css('cursor', 'default');
        $("#txtContrasena1").prop('disabled', '');
        $("#txtContrasena1").val("");
        $("#txtContrasena1").focus();

        //Cambio Clave Acceso Primera Vez
        $("#txtClaveAnterior").removeProp('readonly');
        $("#txtClaveAnterior").val("");
        $("#txtClaveNueva").removeProp('readonly');
        $("#txtClaveNueva").val("");
        $("#txtClaveConfirma").removeProp('readonly');
        $("#txtClaveConfirma").val("");
        $("#txtClaveAnterior").focus();

        $("#ContentPlaceHolder_txtClaveAnterior").removeProp('readonly');
        $("#ContentPlaceHolder_txtClaveAnterior").val("");
        $("#ContentPlaceHolder_txtClaveNueva").removeProp('readonly');
        $("#ContentPlaceHolder_txtClaveNueva").val("");
        $("#ContentPlaceHolder_txtClaveConfirma").removeProp('readonly');
        $("#ContentPlaceHolder_txtClaveConfirma").val("");
        $("#ContentPlaceHolder_txtClaveAnterior").focus();

        sw = false;
    }
}

