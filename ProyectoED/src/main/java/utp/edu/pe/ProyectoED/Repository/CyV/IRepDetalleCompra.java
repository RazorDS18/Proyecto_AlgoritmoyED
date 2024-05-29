package utp.edu.pe.ProyectoED.Repository.CyV;

import utp.edu.pe.ProyectoED.Models.CyV.DetalleCompra;

import java.util.List;

public interface IRepDetalleCompra {

    List<DetalleCompra> ListarDetallesCompra();
    int CrearDetalleCompra(DetalleCompra detalle);
    int ModificarDetalleCompra(DetalleCompra detalle);
    DetalleCompra BuscarDetalleCompraPorId(int id);
    int EliminarDetalleCompra(int id);

}
