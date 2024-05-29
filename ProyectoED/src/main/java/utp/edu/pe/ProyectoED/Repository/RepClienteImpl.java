package utp.edu.pe.ProyectoED.Repository;

import org.springframework.stereotype.Repository;
import utp.edu.pe.ProyectoED.Models.Administrador;
import utp.edu.pe.ProyectoED.Models.Cliente;
import utp.edu.pe.ProyectoED.Models.Vehiculo;
import utp.edu.pe.ProyectoED.Patterns.ConexionBD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RepClienteImpl implements IRepCliente {

    @Override
    public List<Cliente> Listar() {
        String sql ="select * from dbo.Cliente";
        List<Cliente> clientes = new ArrayList<Cliente>();
        try (
                Connection con = ConexionBD.getConexion();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
            )
        {
                while (rs.next()) {
                    Cliente cl = new Cliente();
                    cl.setId(rs.getInt(1));
                    cl.setUser(rs.getString(2));
                    cl.setPw(rs.getString(3));
                    cl.setNames(rs.getString(4));
                    cl.setLastnames(rs.getString(5));
                    cl.setDoi(rs.getString(6));
                    cl.setGmail(rs.getString(7));
                    cl.setTelefono(rs.getString(8));
                    cl.setDireccion(rs.getString(9));
                    cl.setEstado(rs.getInt(10));

                    clientes.add(cl);
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clientes;
    }
}
