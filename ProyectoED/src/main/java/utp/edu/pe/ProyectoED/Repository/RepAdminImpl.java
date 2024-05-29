package utp.edu.pe.ProyectoED.Repository;

import org.springframework.stereotype.Repository;
import utp.edu.pe.ProyectoED.Models.Administrador;
import utp.edu.pe.ProyectoED.Models.Empleado;
import utp.edu.pe.ProyectoED.Patterns.ConexionBD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RepAdminImpl implements IRepAdmin {

    @Override
    public List<Administrador> Listar() {
        String sql ="select * from dbo.Administrador where Estado = 1";
        List<Administrador> admin = new ArrayList<Administrador>();
        try (
                Connection con = ConexionBD.getConexion();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
            )
        {
                while (rs.next()) {
                Administrador adm = new Administrador();
                adm.setId(rs.getInt(1));
                adm.setUsuario(rs.getString(2));
                adm.setContrasenia(rs.getString(3));
                adm.setNombres(rs.getString(4));
                adm.setApellidos(rs.getString(5));
                adm.setDOI(rs.getString(6));
                adm.setCorreo(rs.getString(7));
                adm.setTelefono(rs.getString(8));
                adm.setEstado(rs.getBoolean(9));
                admin.add(adm);
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    @Override
    public Administrador BuscarPorDOI(String DOI) {
        String sql = "{CALL Adm_Buscar(?)}";
        Administrador administrador = null;

        try (
                Connection con = ConexionBD.getConexion();
                CallableStatement stmt = con.prepareCall(sql)
        ) {
            stmt.setString(1, DOI);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                administrador = new Administrador();
                administrador.setId(rs.getInt(1));
                administrador.setUsuario(rs.getString(2));
                administrador.setContrasenia(rs.getString(3));
                administrador.setNombres(rs.getString(4));
                administrador.setApellidos(rs.getString(5));
                administrador.setDOI(rs.getString(6));
                administrador.setCorreo(rs.getString(7));
                administrador.setTelefono(rs.getString(8));
                administrador.setEstado(rs.getBoolean(9));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return administrador;
    }

    @Override
    public Administrador Crear(Administrador administrador) {
        String sql = "{CALL Adm_Agregar(?, ?, ?, ?, ?, ?, ?)}";

        try (
                Connection con = ConexionBD.getConexion();
                CallableStatement stmt = con.prepareCall(sql)
        ) {
            // Establecer los parámetros del CallableStatement
            stmt.setString(1, administrador.getUsuario());
            stmt.setString(2, administrador.getContrasenia());
            stmt.setString(3, administrador.getNombres());
            stmt.setString(4, administrador.getApellidos());
            stmt.setString(5, administrador.getDOI());
            stmt.setString(6, administrador.getCorreo());
            stmt.setString(7, administrador.getTelefono());

            // Ejecutar el procedimiento almacenado
            stmt.executeUpdate();

            return administrador;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void Actualizar(Administrador administrador) {
        String sql = "{CALL Adm_Editar(?, ?, ?, ?, ?, ?, ?, ?)}";

        try (
                Connection con = ConexionBD.getConexion();
                CallableStatement stmt = con.prepareCall(sql)
        ) {
            stmt.setInt(1, administrador.getId());
            stmt.setString(2, administrador.getUsuario());
            stmt.setString(3, administrador.getContrasenia());
            stmt.setString(4, administrador.getNombres());
            stmt.setString(5, administrador.getApellidos());
            stmt.setString(6, administrador.getDOI());
            stmt.setString(7, administrador.getCorreo());
            stmt.setString(8, administrador.getTelefono());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void Eliminar(String DOI) {
        String sql = "{CALL Adm_Eliminar(?)}";

        try (
                Connection con = ConexionBD.getConexion();
                CallableStatement stmt = con.prepareCall(sql)
        ) {
            stmt.setString(1, DOI);
            stmt.executeUpdate();

            System.out.println("Administrador con DOI " + DOI + " eliminado correctamente.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al eliminar el administrador: " + e.getMessage());
        }
    }

}
