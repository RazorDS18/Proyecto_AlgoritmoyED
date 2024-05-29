package utp.edu.pe.ProyectoED.Controller;


import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utp.edu.pe.ProyectoED.Models.Administrador;
import utp.edu.pe.ProyectoED.Services.ServiceAdminImpl;

import java.util.List;

@RestController

@RequestMapping("/Administradores")
public class AdminRestController {

    @Autowired
    private ServiceAdminImpl serviceAdmin;

    @GetMapping("/Listar")
    public List<Administrador> listarAdministradores() {
        return serviceAdmin.ListarAdministradores();
    }

    @GetMapping("/Buscar/{doi}")
    public Administrador buscarPorDOI(@PathVariable String doi) {
        return serviceAdmin.BuscarPorDOI(doi);
    }

    @PostMapping("/Crear")
    public Administrador crearAdministrador(@RequestBody Administrador administrador) {
        return serviceAdmin.CrearAdministrador(administrador);
    }

    @PutMapping("/Actualizar/{doi}")
    public void actualizarAdministrador(@PathVariable String doi, @RequestBody Administrador administrador) {
        administrador.setDOI(doi);
        serviceAdmin.ActualizarAdministrador(administrador);
    }

    @DeleteMapping("/Eliminar/{doi}")
    public void eliminarAdministrador(@PathVariable String doi) {
        serviceAdmin.EliminarAdministrador(doi);
    }


}
