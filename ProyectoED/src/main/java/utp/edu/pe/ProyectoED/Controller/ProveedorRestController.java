package utp.edu.pe.ProyectoED.Controller;


import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utp.edu.pe.ProyectoED.Models.Proveedor;
import utp.edu.pe.ProyectoED.Services.ServiceProveedorImpl;

import java.util.List;

@RestController

@RequestMapping("/apirestproveedores")
public class ProveedorRestController {

    @Autowired
    private ServiceProveedorImpl serviceProveedor;

    @Operation(summary = "Obtener la lista de proveedores")
    @GetMapping("/Listar")
    public List<Proveedor> Listar() {
        return serviceProveedor.Listar();
    }


}
