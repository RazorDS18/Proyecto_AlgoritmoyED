package utp.edu.pe.ProyectoED.Controller;


import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utp.edu.pe.ProyectoED.Models.Empleado;
import utp.edu.pe.ProyectoED.Services.ServiceEmpleadoImpl;

import java.util.List;

@RestController

@RequestMapping("/apirestempleados")
public class EmpleadoRestController {

    @Autowired
    private ServiceEmpleadoImpl serviceEmpleado;

    @Operation(summary = "Obtener la lista de empleados")
    @GetMapping("/Listar")
    public List<Empleado> Listar() {
        return serviceEmpleado.Listar();
    }

}
