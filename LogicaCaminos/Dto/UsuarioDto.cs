
namespace LogicaSiscon.Dto
{
    public class UsuarioDto
    {
        public int cod_usuario { get; set; }
        public string login { get; set; }
        public string password { get; set; }
        public int id_personal { get; set; }
        public int estado { get; set; }
        public int secuencia { get; set; }
        public string NombreCompleto { get; set; }
        public string descEstado { get; set; }
    }
}
