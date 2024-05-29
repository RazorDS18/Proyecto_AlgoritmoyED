package utp.edu.pe.ProyectoED.Models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductoLavado {
    private int id;
    private String nombre;
    private String descripcion;
    private double precio;
    private int duracionMinutos;
}
