package utp.edu.pe.ProyectoED.Controller;


import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utp.edu.pe.ProyectoED.Models.Administrador;
import utp.edu.pe.ProyectoED.Models.Cliente;
import utp.edu.pe.ProyectoED.Models.Producto;
import utp.edu.pe.ProyectoED.Services.ServiceProductoImpl;

import java.util.List;

@RestController

@RequestMapping("/apirestproductos")

public class ProductoRestController {

    @Autowired
    private ServiceProductoImpl serviceProducto;

    @Operation(summary = "Obtener la lista de los productos")
    @GetMapping("/Listar")
    public List<Producto> Listar() {
        return serviceProducto.Listar();
    }
}
