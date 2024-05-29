
function MostrarMovimientos(p_obj, id)
{ 
      p_obj, id
      if( p_obj.style.display == "" ) 
      {
        p_obj.style.display = "none";
        var imagen = 'MasImagen' + id 
        document.all(imagen).src = "Imagenes/icon_expandir.png";
      }
      else
      {
        p_obj.style.display = "";
        var imagen = 'MasImagen' + id
        document.all(imagen).src = "Imagenes/icon_colapsar.png";
      }
      return(false);
}
function UnicoRadioButton(nameregex, current)
{
   re = new RegExp(nameregex);
   for(i = 0; i < document.forms[0].elements.length; i++)
   {
      elm = document.forms[0].elements[i]
      if (elm.type == 'radio')
      {
         if (re.test(elm.name))
         {
            elm.checked = false;
         }
      }
   }
   current.checked = true;
}

function ColapsarPanelExternas() {
    
    for (i = 0; i < document.forms[0].elements.length; i++) {
        elm = document.forms[0].elements[i]
        if (elm.type == 'text')  {
            if (elm.name == 'ctl00$ContentPlaceHolder1$txtNuevaCuenta') {
                elm.value = '';
            }
            if (elm.name == 'ctl00$ContentPlaceHolder1$TextBoxTitular') {
                elm.value = '';
            }
            if (elm.name == 'ctl00$ContentPlaceHolder1$TextBoxCI') {
                elm.value = '';
            }
        }
        if (elm.id == 'ctl00_ContentPlaceHolder1_DropDownListTipoCuenta') {

            elm.selectedIndex = 0;
        }
        if (elm.id == 'ctl00_ContentPlaceHolder1_DropDownListEntidadDestino') {
            elm.selectedIndex = 0;
        }
    }   
} 

function abrirPopUp(url)
{
     var izq = (screen.width -800)/ 2;
     var arr = (screen.height -900 )/ 2;
     var look='location=no,status=yes,toolbar=yes,scrollbars=yes,resizable=no,width=' + 800 + ',height=' + 550 + ',top='+arr+',left='+izq+','    	 
     popwin = window.open(url, "", look);
     popwin.location.href = url;
     popwin.focus();
     return false;
} 
function numerosYpunto(myfield, e, dec)
{
    var key;
    var keychar;
    if (window.event)
        key = window.event.keyCode;
    else if (e)
        key = e.which;
    else
        return true;
    
    keychar = String.fromCharCode(key);
    // control keys
    if ((key==null) || (key==0) || (key==8) || (key==9) || (key==13) || (key==27) || (key==46) )
        return true;
    // numbers
    else if ((("0123456789").indexOf(keychar) > -1))
        return true;
    // decimal point jump
    else if (dec && (keychar == "."))
    {
        myfield.form.elements[dec].focus();                                                                 
        return false;
    }
    else
    return false;
}
function numeros(myfield, e, dec)
{
    var key;
    var keychar;
    if (window.event)
        key = window.event.keyCode;
    else if (e)
        key = e.which;
    else
        return true;
    
    keychar = String.fromCharCode(key);
    // control keys
    if ((key==null) || (key==0) || (key==8) || (key==9) || (key==13) || (key==27))
        return true;
    // numbers
    else if ((("0123456789").indexOf(keychar) > -1))
        return true;
    // decimal point jump
    else if (dec && (keychar == "."))
    {
        myfield.form.elements[dec].focus();                                                                 
        return false;
    }
    else
    return false;
}
function ConfirmWin(cuenta) 
{
     var response = window.confirm("La cuenta Nro. " + cuenta + " ya esta registrada en la Planilla,a desea continuar?");
     if (response) 
     {
          window.alert("Presionaste ACEPTAR.");
     }
     else 
     {
          window.alert("Presionaste CANCELAR.");
     }
}
function confirm_JSCargaAutomatica(Form1)
{

	if (document.getElementById(Form1)) 
	{
		var form = document.getElementById(Form1);
	} else 
	{
		return;
	}

	// CONFIRM REQUIRES ONE ARGUMENT
	var message = "Please confirm it is OK to proceed...";

	// CONFIRM IS BOOLEAN. THAT MEANS THAT
	// IT RETURNS TRUE IF 'OK' IS CLICKED
	// OTHERWISE IT RETURN FALSE
	var return_value = confirm(message);

	// DISPLAY THE RETURNED VALUE IN THE
	// CONFIRM POPUP DEMO TEXT INPUT BOX
	form.txtRespuesta.value = return_value;

	// TEST TO SEE IF TRUE|FALSE RETURNED
	if ( return_value === true ) 
	{
		// YOUR 'OK' SCRIPT GOES HERE
		yourOkFunction();
	} 
	else 
	{
		// YOUR 'CANCEL' SCRIPT GOES HERE
		yourCancelFunction();
	}
}
function Alerta_DeleteCuentaAbono(valor)
{
    alert(valor);
    __doPostBack('ctl00$ContentPlaceHolder1$btnAcceptElminarCuentaAbono','');
}
function ConfirmSubmit(valor)
{
    var agree=confirm(valor);
    if (agree)
      __doPostBack('ctl00$ContentPlaceHolder1$btnAceptar','');
    else
      __doPostBack('ctl00$ContentPlaceHolder1$btnCancelar','');
}  

function Confirmar(valor)
{
    var agree = confirm(valor);
    if (agree)
        __doPostBack('ctl00$ContentPlaceHolder1$Aceptar', '');
    else {
        __doPostBack('ctl00$ContentPlaceHolder1$Cancelar', '');      
    }
}
function Confirmation()
{
   if(confirm('Are you sure you want to continue?'))
//     {return true;}
    document.bgColor = "red";
       else
     {return false;}
} 
function SetearObjeto()
{
//    var enlace = document.getElementById("enlace");

//    document.getElementById("enlace").href = "Http//:www.google.com";
//    var enlace = document.getElementById("enlace");
//    alert(enlace.href);
    
    var agree=confirm('SI o NO?');
    if (agree)
       document.getElementById("enlace").href = "OK";
    else
       document.getElementById("enlace").href = "FALSE";
      
    alert(enlace.href);
    
}

function oNumero(numero)

      {

//Propiedades 

this.valor = numero || 0

this.dec = -1;

//Métodos 

this.formato = numFormat;

this.ponValor = ponValor;

//Definición de los métodos


function ponValor(cad)

{

if (cad =='-' || cad=='+') return

if (cad.length ==0) return

if (cad.indexOf('.') >=0)

    this.valor = parseFloat(cad);

else 

    this.valor = parseInt(cad);

} 

function numFormat(dec, miles)

{

var num = this.valor, signo=3, expr;

var cad = ""+this.valor;

var ceros = "", pos, pdec, i;

for (i=0; i < dec; i++)

ceros += '0';

pos = cad.indexOf('.')

if (pos < 0)

    cad = cad+"."+ceros;

else

    {

    pdec = cad.length - pos -1;

    if (pdec <= dec)

        {

        for (i=0; i< (dec-pdec); i++)

            cad += '0';

        }

    else

        {

        num = num*Math.pow(10, dec);

        num = Math.round(num);

        num = num/Math.pow(10, dec);

        cad = new String(num);

        }

    }

pos = cad.indexOf('.')

if (pos < 0) pos = cad.lentgh

if (cad.substr(0,1)=='-' || cad.substr(0,1) == '+') 

       signo = 4;

if (miles && pos > signo)

    do{

        expr = /([+-]?\d)(\d{3}[\.\,]\d*)/

        cad.match(expr)

        cad=cad.replace(expr, RegExp.$1+','+RegExp.$2)

        }

while (cad.indexOf(',') > signo)

    if (dec<0) cad = cad.replace(/\./,'')

        return cad;

}

}
