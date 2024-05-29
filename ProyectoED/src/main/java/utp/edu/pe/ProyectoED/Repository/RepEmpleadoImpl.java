package utp.edu.pe.ProyectoED.Repository;

import org.springframework.stereotype.Repository;
import utp.edu.pe.ProyectoED.Models.Empleado;
import utp.edu.pe.ProyectoED.Patterns.ConexionBD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RepEmpleadoImpl implements IRepEmpleado {

    @Override
    public List<Empleado> Listar() {
        String sql ="select * from dbo.Empleado";
        List<Empleado> empleados = new ArrayList<Empleado>();
        try (
                Connection con = ConexionBD.getConexion();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
            )
        {
                while (rs.next()) {
                Empleado emp = new Empleado();
                emp.setId(rs.getInt(1));
                emp.setUser(rs.getString(2));
                emp.setPw(rs.getString(3));
                emp.setNames(rs.getString(4));
                emp.setLastnames(rs.getString(5));
                emp.setDoi(rs.getString(6));
                emp.setCargo(rs.getString(7));
                emp.setGmail(rs.getString(8));
                emp.setTelefono(rs.getString(9));
                emp.setFContrato(rs.getDate(10));
                emp.setFDespido(rs.getDate(11));
                emp.setSalario(rs.getDouble(12));
                emp.setEstado(rs.getInt(13));
                empleados.add(emp);
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empleados;
    }

}
