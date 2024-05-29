package utp.edu.pe.ProyectoED.Controller;


import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utp.edu.pe.ProyectoED.Models.Cliente;
import utp.edu.pe.ProyectoED.Models.Empleado;
import utp.edu.pe.ProyectoED.Models.Vehiculo;
import utp.edu.pe.ProyectoED.Services.ServiceEmpleadoImpl;
import utp.edu.pe.ProyectoED.Services.ServiceVehiculoImpl;

import java.util.List;

@RestController

@RequestMapping("/apirestvehiculos")
public class VehiculoRestController {

    @Autowired
    private ServiceVehiculoImpl serviceVehiculo;

    @Operation(summary = "Obtener la lista de vehiculos")
    @GetMapping("/Listar")
    public List<Vehiculo> Listar() {
        return serviceVehiculo.Listar();
    }

}
