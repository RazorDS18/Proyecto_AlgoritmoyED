package utp.edu.pe.ProyectoED.Models.CyV;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import utp.edu.pe.ProyectoED.Models.Producto;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class DetalleCompra {
    private int id;
    private Producto producto;
    private int cantidad;
    private double precioUnitario;
    private  double total;
}
