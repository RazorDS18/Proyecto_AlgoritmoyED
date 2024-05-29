package utp.edu.pe.ProyectoED.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utp.edu.pe.ProyectoED.Models.Empleado;
import utp.edu.pe.ProyectoED.Models.Vehiculo;
import utp.edu.pe.ProyectoED.Repository.IRepEmpleado;
import utp.edu.pe.ProyectoED.Repository.IRepVehiculo;

import java.util.List;

@Service
public class ServiceVehiculoImpl {

    @Autowired
    private IRepVehiculo repVehiculo;

    public List<Vehiculo> Listar() {
        return repVehiculo.Listar();
    }
}
