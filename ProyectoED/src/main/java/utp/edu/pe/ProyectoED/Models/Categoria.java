package utp.edu.pe.ProyectoED.Models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Categoria {
    private int id;
    private String nombre;
    private String descripcion;
}
