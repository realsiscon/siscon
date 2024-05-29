function CustomAlert() {
    this.render = function (dialog) {
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH + "px";
        dialogbox.style.left = (winW / 2) - (550 * .5) + "px";
        dialogbox.style.top = "100px";
        dialogbox.style.display = "block";
        document.getElementById('dialogboxhead').innerHTML = "Acknowledge This Message";
        document.getElementById('dialogboxbody').innerHTML = dialog;
        document.getElementById('dialogboxfoot').innerHTML = '<button onclick="Alert.ok()">OK</button>';
    }
    this.ok = function () {
        document.getElementById('dialogbox').style.display = "none";
        document.getElementById('dialogoverlay').style.display = "none";
    }
}
var Alert = new CustomAlert();

function validar() {

    var localidad = $("#ContentPlaceHolder_drpLocalidad option:selected").text();
    var agencia = $("#ContentPlaceHolder_drpAgencia option:selected").text();

    if (localidad == "Seleccionar..") {
        $("#ContentPlaceHolder_lblMensajeError").html('Debe seleccionar los datos para el envío de la factura.');
        return false;
    }
    if (agencia == "Seleccionar..") {
        $("#ContentPlaceHolder_lblMensajeError").html('Debe seleccionar los datos para el envío de la factura.');
        return false;
    }
    else {
        return true;
    }
}

function validarSmart() {

    var localidad = $("#ContentPlaceHolder_drpLocalidadSmart option:selected").text();
    var agencia = $("#ContentPlaceHolder_drpAgenciaSmart option:selected").text();

    if (localidad == "Seleccionar..") {
        $("#ContentPlaceHolder_lblMensajeErrorSmart").html('Debe seleccionar los datos para el envío de la factura.');
        return false;
    }
    if (agencia == "Seleccionar..") {
        $("#ContentPlaceHolder_lblMensajeErrorSmart").html('Debe seleccionar los datos para el envío de la factura.');
        return false;
    }
    else {
        return true;
    }
}

function CustomConfirm() {
    this.render = function () {
        if (validar()) {
            var winW = window.innerWidth;
            var winH = window.innerHeight;
            var dialogoverlay = document.getElementById('dialogoverlay');
            var dialogbox = document.getElementById('dialogbox');
            dialogoverlay.style.display = "block";
            dialogoverlay.style.height = winH + "px";
            dialogbox.style.left = (winW / 2) - (450 * .5) + "px";
            dialogbox.style.top = (winH / 3) + "px";
            dialogbox.style.display = "block";

            var agencia = $("#ContentPlaceHolder_drpAgencia option:selected").text();

            document.getElementById('dialogboxhead').innerHTML = "";
            document.getElementById('dialogboxbody').innerHTML = "Su factura estará disponible en la agencia " + agencia + " ¿Confirma que desea realizar la transacción?";
            document.getElementById('dialogboxfoot').innerHTML = '<button id="btnYes" class="il_botones2" style="float:left; width:150px" onclick="return Confirm.yes()">Aceptar</button> <button style="float:right; width:150px" class="il_botones2" onclick="return Confirm.no()">Cancelar</button>';
            $('#btnYes').focus();
            return false;
        } else {
            return false;
        }
    }

    this.no = function () {
        document.getElementById('dialogbox').style.display = "none";
        document.getElementById('dialogoverlay').style.display = "none";
        return false;
    }
    this.yes = function () {
        document.getElementById('dialogbox').style.display = "none";
        document.getElementById('dialogoverlay').style.display = "none";

        $.blockUI({
            message: $('#Block_div'),
            css:
            {
                padding: 0,
                margin: 0,
                textAlign: 'center',
                fontSize: 12,
                cursor: 'auto',
                border: 'none',
                background: 'none'
            }
        });
    }
}
var Confirm = new CustomConfirm();

function CustomConfirmSmart() {
    this.render = function () {
        validarSmart();
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH + "px";
        dialogbox.style.left = (winW / 2) - (245 * .5) + "px";
        dialogbox.style.top = (winH / 3) + "px";
        dialogbox.style.display = "block";

        var agencia = $("#ContentPlaceHolder_drpAgenciaSmart option:selected").text();

        document.getElementById('dialogboxhead').innerHTML = "";
        document.getElementById('dialogboxbody').innerHTML = "Su factura estará disponible en la agencia " + agencia + " ¿Confirma que desea realizar la transacción?";
        document.getElementById('dialogboxfoot').innerHTML = '<button class="il_botones2" style="float:none; width:180px;margin-bottom: 10px;" onclick="return ConfirmSmart.yes()">Aceptar</button> <button style="float:none; width:180px" class="il_botones2" onclick="return ConfirmSmart.no()">Cancelar</button>';
        return false;
    }

    this.no = function () {
        document.getElementById('dialogbox').style.display = "none";
        document.getElementById('dialogoverlay').style.display = "none";
        return false;
    }
    this.yes = function () {
        document.getElementById('dialogbox').style.display = "none";
        document.getElementById('dialogoverlay').style.display = "none";

        $.blockUI({
            message: $('#Block_div'),
            css:
            {
                padding: 0,
                margin: 0,
                textAlign: 'center',
                fontSize: 12,
                cursor: 'auto',
                border: 'none',
                background: 'none'
            }
        });
    }
}
var ConfirmSmart = new CustomConfirmSmart();