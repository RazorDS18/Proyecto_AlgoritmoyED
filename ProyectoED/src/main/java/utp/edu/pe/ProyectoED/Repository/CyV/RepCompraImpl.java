package utp.edu.pe.ProyectoED.Repository.CyV;

import org.springframework.stereotype.Repository;
import utp.edu.pe.ProyectoED.Models.CyV.Compra;
import utp.edu.pe.ProyectoED.Models.CyV.DetalleCompra;
import utp.edu.pe.ProyectoED.Models.Producto;
import utp.edu.pe.ProyectoED.Models.Proveedor;
import utp.edu.pe.ProyectoED.Patterns.ConexionBD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RepCompraImpl implements IRepCompra{

    @Override
    public List<Compra> ListarCompras() {
        String sql ="SELECT c.id as compra_Id, c.FechaCompra as compra_FechaCompra, c.Total as compra_Total, c.Estado AS compra_Estado,\n" +
                "       p.id AS proveedor_Id, p.nombre as proveedor_Nombre, p.ruc as proveedor_RUC,\n" +
                "       dc.id AS detalle_Id, dc.Cantidad AS detalle_Cantidad, dc.Precio as detalle_PrecioUnitario, dc.Total AS detalle_Total,\n" +
                "       pv.id AS producto_Id, pv.nombre AS producto_Nombre\n" +
                "FROM Compra c\n" +
                "INNER JOIN Proveedor p ON c.ProveedorID = p.id\n" +
                "INNER JOIN DetalleCompra dc ON c.id = dc.CompraID\n" +
                "INNER JOIN Producto pv ON dc.ProductoID = pv.id;";
        List<Compra> compras = new ArrayList<Compra>();
        try (
                Connection con = ConexionBD.getConexion();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
        )
        {
            while (rs.next()) {
                Compra compra = new Compra();
                compra.setId(rs.getInt(1));
                compra.setFecha(rs.getDate(2));
                compra.setTotal(rs.getDouble(3));
                compra.setEstado(rs.getBoolean(4));
                Proveedor proveedor = new Proveedor();
                proveedor.setId(rs.getInt("proveedor_Id"));
                proveedor.setNombre(rs.getString("proveedor_Nombre"));
                proveedor.setRuc(rs.getString("proveedor_RUC"));
                compra.setProveedor(proveedor);
                DetalleCompra detalleCompra = new DetalleCompra();
                detalleCompra.setId(rs.getInt("detalle_Id"));
                detalleCompra.setCantidad(rs.getInt("detalle_Cantidad"));
                detalleCompra.setPrecioUnitario(rs.getDouble("detalle_PrecioUnitario"));
                detalleCompra.setTotal(rs.getDouble("detalle_Total"));
                Producto producto = new Producto();
                producto.setId(rs.getInt("producto_Id"));
                producto.setNombre(rs.getString("producto_Nombre"));
                detalleCompra.setProducto(producto);
                compra.setDetalleCompra(detalleCompra);
                compras.add(compra);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return compras;
    }

    @Override
    public int CrearCompra(Compra compra) {
        return 0;
    }

    @Override
    public int ModificarCompra(Compra compra) {
        return 0;
    }

    @Override
    public Compra BuscarCompraPorId(int id) {
        return null;
    }

    @Override
    public int EliminarCompra(int id) {
        return 0;
    }

    @Override
    public List<DetalleCompra> ListarDetallesCompra(int idCompra) {
        return List.of();
    }

    @Override
    public int AgregarDetalleCompra(int idCompra, DetalleCompra detalle) {
        return 0;
    }

    @Override
    public int EliminarDetalleCompra(int idCompra, int idDetalle) {
        return 0;
    }
}
