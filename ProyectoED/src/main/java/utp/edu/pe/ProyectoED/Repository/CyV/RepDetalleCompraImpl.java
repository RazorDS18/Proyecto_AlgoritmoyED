package utp.edu.pe.ProyectoED.Repository.CyV;

import utp.edu.pe.ProyectoED.Models.CyV.DetalleCompra;

import java.util.List;

public class RepDetalleCompraImpl implements IRepDetalleCompra {

    @Override
    public List<DetalleCompra> ListarDetallesCompra() {
        return List.of();
    }

    @Override
    public int CrearDetalleCompra(DetalleCompra detalle) {
        return 0;
    }

    @Override
    public int ModificarDetalleCompra(DetalleCompra detalle) {
        return 0;
    }

    @Override
    public DetalleCompra BuscarDetalleCompraPorId(int id) {
        return null;
    }

    @Override
    public int EliminarDetalleCompra(int id) {
        return 0;
    }
}
