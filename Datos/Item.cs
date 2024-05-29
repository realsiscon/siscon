using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    [Serializable]
    public class Item
    {
        /// <summary>
        /// Variable de Entrada.
        /// </summary>
        public static byte INPUT = 0;
        /// <summary>
        /// Variable de Salida.
        /// </summary>
        public static byte OUTPUT = 1;
        /// <summary>
        /// Variable de Entrada y Salida.
        /// </summary>
        public static byte INPUTOUTPUT = 2;
        /// <summary>
        /// Variable de Retorno de los Procedimientos Almacenados.
        /// </summary>
        public static byte RETUNRVALUE = 3;

        /// <summary>
        /// Nombre del Item o Varible.
        /// </summary>
        public string nombre { get; set; }
        /// <summary>
        /// Valor del Item.
        /// </summary>
        public object valor { get; set; }
        /// <summary>
        /// Direccion esta entre los valores {INPUT, OUTPUT, INPUTOUTPUT, RETURNVALUE}
        /// </summary>
        public byte direccion { get; set; }
        /// <summary>
        /// Tipo de Dato del Valor.
        /// </summary>
        public TIPODATO tipodato { get; set; }
        /// <summary>
        /// Longitud de la Variable, debe ser numerica mayor a Cero(0).
        /// </summary>
        public int longitud { get; set; }
        /// <summary>
        /// Precision indica el numero de decimales, un entero>=0 (entero mayor o igual a cero).
        /// </summary>
        public int cantidad_decimal { get; set; }

        #region Constructores
        public Item() { }

        public Item(string nombre, object valor, TIPODATO tipodato, int longitud, int cantidad_decimal)
        {
            this.nombre = nombre;
            this.valor = valor;
            this.tipodato = tipodato;
            this.cantidad_decimal = cantidad_decimal;
            this.longitud = longitud;
        }

        public Item(string nombre, object valor, byte direccion, TIPODATO tipodato, int longitud, int cantidad_decimal)
        {
            this.nombre = nombre;
            this.valor = valor;
            this.tipodato = tipodato;
            this.cantidad_decimal = cantidad_decimal;
            this.direccion = direccion;
            this.longitud = longitud;
        }

        public Item(string nombre, object valor, TIPODATO tipodato)
        {
            this.nombre = nombre;
            this.valor = valor;
            this.tipodato = tipodato;
        }

        public Item(string nombre, object valor, TIPODATO tipodato, int longitud)
        {
            this.nombre = nombre;
            this.valor = valor;
            this.tipodato = tipodato;
            this.longitud = longitud;
        }

        #endregion


        #region Tipos de Datos
        // Resumen:
        //     Especifica el tipo de datos específico de SQL Server de un campo o una propiedad
        //     para su uso en System.Data.SqlClient.SqlParameter.
        public enum TIPODATO
        {
            // Resumen:
            //     System.Int64. Entero de 64 bits con signo.
            BigInt = 0,
            //
            // Resumen:
            //     System.Array de tipo System.Byte. Secuencia de longitud fija de datos binarios
            //     comprendida entre 1 y 8.000 bytes.
            Binary = 1,
            //
            // Resumen:
            //     System.Boolean. Valor numérico sin signo que puede ser 0, 1 o null.
            Bit = 2,
            //
            // Resumen:
            //     System.String. Secuencia de longitud fija de caracteres no Unicode comprendida
            //     entre 1 y 8.000 caracteres.
            Char = 3,
            //
            // Resumen:
            //     System.DateTime. Datos de fecha y hora cuyo valor está comprendido entre
            //     el 1 de enero de 1753 y el 31 de diciembre de 9999, con una precisión de
            //     3,33 milisegundos.
            DateTime = 4,
            //
            // Resumen:
            //     System.Decimal. Valor numérico de precisión y escala fijas comprendido entre
            //     -10 38 -1 y 10 38 -1.
            Decimal = 5,
            //
            // Resumen:
            //     System.Double. Número de punto flotante comprendido entre -1,79E +308 y 1,79E
            //     +308.
            Float = 6,
            //
            // Resumen:
            //     System.Array de tipo System.Byte. Secuencia de longitud variable de datos
            //     binarios comprendida entre 0 y 2 31 -1 (o 2.147.483.647) bytes.
            Image = 7,
            //
            // Resumen:
            //     System.Int32. Entero de 32 bits con signo.
            Int = 8,
            //
            // Resumen:
            //     System.Decimal. Valor de moneda comprendido entre -2 63 (o -922,337,203,685,477.5808)
            //     y 2 63 -1 (o +922,337,203,685,477.5807), con una precisión de una diezmilésima
            //     de unidad de moneda.
            Money = 9,
            //
            // Resumen:
            //     System.String. Secuencia de longitud fija de caracteres Unicode comprendida
            //     entre 1 y 4.000 caracteres.
            NChar = 10,
            //
            // Resumen:
            //     System.String. Secuencia de longitud variable de datos Unicode con una longitud
            //     máxima de 2 30 - 1 (o 1.073.741.823) caracteres.
            NText = 11,
            //
            // Resumen:
            //     System.String. Secuencia de longitud variable de caracteres Unicode comprendida
            //     entre 1 y 4.000 caracteres. Se produce un error en las conversiones implícitas
            //     si la cadena tiene más de 4.000 caracteres. Establezca explícitamente el
            //     objeto cuando trabaje con cadenas de más de 4.000 caracteres. Utilice System.Data.SqlDbType.NVarChar
            //     cuando la columna de base de datos sea nvarchar(max).
            NVarChar = 12,
            //
            // Resumen:
            //     System.Single. Número de punto flotante comprendido entre -3,40E +38 y 3,40E
            //     +38.
            Real = 13,
            //
            // Resumen:
            //     System.Guid. Identificador único global (GUID).
            UniqueIdentifier = 14,
            //
            // Resumen:
            //     System.DateTime. Datos de fecha y hora cuyo valor está comprendido entre
            //     el 1 de enero de 1900 y el 6 de junio de 2079, con una precisión de un minuto.
            SmallDateTime = 15,
            //
            // Resumen:
            //     System.Int16. Entero de 16 bits con signo.
            SmallInt = 16,
            //
            // Resumen:
            //     System.Decimal. Valor de divisa comprendido entre -214.748,3648 y +214.748,3647,
            //     con una precisión de una diezmilésima de unidad de divisa.
            SmallMoney = 17,
            //
            // Resumen:
            //     System.String. Secuencia de longitud variable de datos no Unicode con una
            //     longitud máxima de 2 31 -1 (o 2.147.483.647) caracteres.
            Text = 18,
            //
            // Resumen:
            //     System.Array de tipo System.Byte. Números binarios generados automáticamente
            //     de los que se garantiza que son únicos en una base de datos. timestamp se
            //     usa normalmente como un mecanismo para agregar marcas de versión a las filas
            //     de tabla. El tamaño de almacenamiento es de 8 bytes.
            Timestamp = 19,
            //
            // Resumen:
            //     System.Byte. Entero de 8 bits sin signo.
            TinyInt = 20,
            //
            // Resumen:
            //     System.Array de tipo System.Byte. Secuencia de longitud variable de datos
            //     binarios comprendida entre 1 y 8.000 bytes. Se produce un error en las conversiones
            //     implícitas si la matriz de bytes tiene más de 8.000 caracteres. Establezca
            //     explícitamente el objeto cuando trabaje con matrices de bytes de más de 8.000
            //     bytes.
            VarBinary = 21,
            //
            // Resumen:
            //     System.String. Secuencia de longitud variable de caracteres no Unicode comprendida
            //     entre 1 y 8.000 caracteres. Utilice System.Data.SqlDbType.VarChar cuando
            //     la columna de base de datos sea varchar(max).
            VarChar = 22,
            //
            // Resumen:
            //     System.Object. Tipo especial de datos que puede contener datos numéricos,
            //     de cadena, binarios o de fecha, así como los valores Empty y Null de SQL
            //     Server, que se supone si no se declara otro tipo.
            Variant = 23,
            //
            // Resumen:
            //     Valor XML. Obtenga el XML como una cadena utilizando el método System.Data.SqlClient.SqlDataReader.GetValue(System.Int32)
            //     o la propiedad System.Data.SqlTypes.SqlXml.Value o como un System.Xml.XmlReader
            //     llamando al método System.Data.SqlTypes.SqlXml.CreateReader().
            Xml = 25,
            //
            // Resumen:
            //     Tipo definido por el usuario (UDT) de SQL Server 2005.
            Udt = 29,
            //
            // Resumen:
            //     Un tipo de datos especial para especificar datos estructurados contenidos
            //     en parámetros con valores de tabla.
            Structured = 30,
            //
            // Resumen:
            //     Datos de fechas que van desde el 1 de enero del año 1 d.C. hasta el 31 de
            //     diciembre de 9999 d.C.
            Date = 31,
            //
            // Resumen:
            //     Datos horarios basados en un reloj de 24 horas. El intervalo de valor horario
            //     está comprendido entre 00:00:00 y 23:59:59,9999999 con una precisión de 100
            //     nanosegundos. Corresponde a un valor time de SQL Server.
            Time = 32,
            //
            // Resumen:
            //     Datos de fecha y hora. El intervalo de valores de fecha comprende desde el
            //     1 de enero de 1 d.C. hasta el 31 de diciembre de 9999 d.C. El intervalo de
            //     valor horario está comprendido entre 00:00:00 y 23:59:59,9999999 con una
            //     precisión de 100 nanosegundos.
            DateTime2 = 33,
            //
            // Resumen:
            //     Datos de fecha y hora con conocimiento de la zona horaria. El intervalo de
            //     valores de fecha comprende desde el 1 de enero de 1 d.C. hasta el 31 de diciembre
            //     de 9999 d.C. El intervalo de valor horario está comprendido entre 00:00:00
            //     y 23:59:59,9999999 con una precisión de 100 nanosegundos. El intervalo horario
            //     es -14: 00 hasta +14:00.
            DateTimeOffset = 34,
        }

        #endregion
    }

}
