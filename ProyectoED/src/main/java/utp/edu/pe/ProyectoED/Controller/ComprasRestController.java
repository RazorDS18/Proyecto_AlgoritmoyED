package utp.edu.pe.ProyectoED.Controller;


import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utp.edu.pe.ProyectoED.Models.CyV.Compra;
import utp.edu.pe.ProyectoED.Services.ServiceCompraImpl;

import java.util.List;

@RestController

@RequestMapping("/apirestcompras")
public class ComprasRestController {

    @Autowired
    private ServiceCompraImpl serviceCompra;

    @Operation(summary = "Obtener la lista de compras")
    @GetMapping("/Listar")
    public List<Compra> Listar() {
        return serviceCompra.Listar();
    }

}
