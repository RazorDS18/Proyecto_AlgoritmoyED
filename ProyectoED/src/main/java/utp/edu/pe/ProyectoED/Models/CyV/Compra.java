package utp.edu.pe.ProyectoED.Models.CyV;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import utp.edu.pe.ProyectoED.Models.Proveedor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Compra {

    private int id;
    private Date fecha;
    private double total;
    private boolean estado;
    private Proveedor proveedor;
    private DetalleCompra detalleCompra;
}
