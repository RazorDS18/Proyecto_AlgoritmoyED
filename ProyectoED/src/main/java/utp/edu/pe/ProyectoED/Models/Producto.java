package utp.edu.pe.ProyectoED.Models;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor

@JsonInclude(JsonInclude.Include.NON_DEFAULT)

public class Producto {
    private int id;
    private String nombre;
    private String descripcion;
    private String marca;
    private Date fechaDeIngreso;
    private int stock;
    private double precio;
    private int estado;
    private int categoria;
    private int proveedor;
}
