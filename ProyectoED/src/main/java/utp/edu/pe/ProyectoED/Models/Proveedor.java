package utp.edu.pe.ProyectoED.Models;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Proveedor {
    private int id;
    private String nombre;
    private String descripcion;
    private String ruc;
    private String telefono;
    private String direccion;
    private String gmail;
    private Date fechaDeIngreso;
    private Date fechaDeSalida;
    private int estado;
}
