package utp.edu.pe.ProyectoED.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utp.edu.pe.ProyectoED.Models.Empleado;
import utp.edu.pe.ProyectoED.Repository.IRepEmpleado;

import java.util.List;

@Service
public class ServiceEmpleadoImpl {

    @Autowired
    private IRepEmpleado repEmpleado;

    public List<Empleado> Listar() {
        return repEmpleado.Listar();
    }

}
