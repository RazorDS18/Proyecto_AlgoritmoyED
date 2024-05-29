package utp.edu.pe.ProyectoED.Repository.CyV;

import utp.edu.pe.ProyectoED.Models.CyV.Compra;
import utp.edu.pe.ProyectoED.Models.CyV.DetalleCompra;

import java.util.List;

public interface IRepCompra {

    List<Compra> ListarCompras();
    int CrearCompra(Compra compra);
    int ModificarCompra(Compra compra);
    Compra BuscarCompraPorId(int id);
    int EliminarCompra(int id);

    List<DetalleCompra> ListarDetallesCompra(int idCompra);
    int AgregarDetalleCompra(int idCompra, DetalleCompra detalle);
    int EliminarDetalleCompra(int idCompra, int idDetalle);

}
