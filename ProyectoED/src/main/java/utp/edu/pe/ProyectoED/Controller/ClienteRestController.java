package utp.edu.pe.ProyectoED.Controller;


import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utp.edu.pe.ProyectoED.Models.Cliente;
import utp.edu.pe.ProyectoED.Services.ServiceClienteImpl;


import java.util.List;

@RestController

@RequestMapping("/apirestclientes")
public class ClienteRestController {

    @Autowired
    private ServiceClienteImpl serviceCliente;
    @Operation(summary = "Obtener la lista de clientes")
    @GetMapping("/Listar")
    public List<Cliente> Listar() {
        return serviceCliente.Listar();
    }

}
