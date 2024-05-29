package utp.edu.pe.ProyectoED.Repository;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.stereotype.Repository;
import utp.edu.pe.ProyectoED.Models.Cliente;
import utp.edu.pe.ProyectoED.Models.Vehiculo;
import utp.edu.pe.ProyectoED.Patterns.ConexionBD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@JsonInclude(JsonInclude.Include.NON_NULL)
@Repository
public class RepVehiculoImpl implements IRepVehiculo {

    @Override
    public List<Vehiculo> Listar() {
        String sql = "select v.*,c.id, c.nombres, c.apellidos, c.doi " +
                "from dbo.Vehiculo v  JOIN dbo.Cliente c " +
                "ON v.cliente_id = c.id";
        List<Vehiculo> vehiculos = new ArrayList<>();
        try (
                Connection con = ConexionBD.getConexion();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
        ) {
            while (rs.next()) {
                Vehiculo vh = new Vehiculo();
                vh.setId(rs.getInt(1));
                vh.setMarca(rs.getString(2));
                vh.setModelo(rs.getString(3));
                vh.setTipo(rs.getString(4));
                vh.setPlaca(rs.getString(5));
                vh.setCliente_id(rs.getInt(6));
                vh.setEstado(rs.getInt(7));
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("Id"));
                cliente.setNames(rs.getString("Nombres"));
                cliente.setLastnames(rs.getString("Apellidos"));
                cliente.setDoi(rs.getString("DOI"));
                vh.setCliente(cliente);
                vehiculos.add(vh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehiculos;
    }
}
