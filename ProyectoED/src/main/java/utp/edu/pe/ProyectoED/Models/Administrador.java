package utp.edu.pe.ProyectoED.Models;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Administrador {

    private int id;
    private String Usuario;
    private String Contrasenia;
    private String Nombres;
    private String Apellidos;
    private String DOI;
    private String Correo;
    private String Telefono;
    private boolean Estado;
}
