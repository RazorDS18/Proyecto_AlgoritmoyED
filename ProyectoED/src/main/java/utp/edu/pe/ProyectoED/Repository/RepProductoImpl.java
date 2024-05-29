package utp.edu.pe.ProyectoED.Repository;

import org.springframework.stereotype.Repository;
import utp.edu.pe.ProyectoED.Models.Producto;
import utp.edu.pe.ProyectoED.Patterns.ConexionBD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RepProductoImpl implements IRepProducto {

    @Override
    public List<Producto> Listar() {
        String sql ="select * from Producto";
        List<Producto> productos = new ArrayList<Producto>();
        try (
                Connection con = ConexionBD.getConexion();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
            )
        {
                while (rs.next()) {
                    Producto pv = new Producto();
                    pv.setId(rs.getInt(1));
                    pv.setNombre(rs.getString(2));
                    pv.setDescripcion(rs.getString(3));
                    pv.setMarca(rs.getString(4));
                    pv.setFechaDeIngreso(rs.getDate(5));
                    pv.setStock(rs.getInt(6));
                    pv.setPrecio(rs.getDouble(7));
                    pv.setEstado(rs.getInt(8));
                    pv.setCategoria(rs.getInt(9));
                    pv.setProveedor(rs.getInt(10));
                    productos.add(pv);
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }
}
