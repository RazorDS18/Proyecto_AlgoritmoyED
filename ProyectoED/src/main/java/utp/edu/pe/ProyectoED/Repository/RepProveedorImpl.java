package utp.edu.pe.ProyectoED.Repository;

import org.springframework.stereotype.Repository;
import utp.edu.pe.ProyectoED.Models.Proveedor;
import utp.edu.pe.ProyectoED.Patterns.ConexionBD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
@Repository
public class RepProveedorImpl implements IRepProveedor {

    @Override
    public List<Proveedor> Listar() {
        String sql ="select * from dbo.Proveedor";
        List<Proveedor> proveedors = new ArrayList<Proveedor>();
        try (
                Connection con = ConexionBD.getConexion();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
        )
        {
            while (rs.next()) {
                Proveedor pro = new Proveedor();
                pro.setId(rs.getInt(1));
                pro.setNombre(rs.getString(2));
                pro.setDescripcion(rs.getString(3));
                pro.setRuc(rs.getString(4));
                pro.setTelefono(rs.getString(5));
                pro.setDireccion(rs.getString(6));
                pro.setGmail(rs.getString(7));
                pro.setFechaDeIngreso(rs.getDate(8));
                pro.setFechaDeSalida(rs.getDate(9));
                pro.setEstado(rs.getInt(10));

                proveedors.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return proveedors;
    }
}
