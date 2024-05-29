package utp.edu.pe.ProyectoED.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utp.edu.pe.ProyectoED.Models.Administrador;
import utp.edu.pe.ProyectoED.Repository.IRepAdmin;

import java.util.List;

@Service
public class ServiceAdminImpl {

    @Autowired
    private IRepAdmin repAdmin;

    public List<Administrador> ListarAdministradores() {
        return repAdmin.Listar();
    }

    public Administrador CrearAdministrador(Administrador administrador) {
        return repAdmin.Crear(administrador);
    }

    public Administrador BuscarPorDOI(String doi) {
        return repAdmin.BuscarPorDOI(doi);
    }

    public void ActualizarAdministrador(Administrador administrador) {
        repAdmin.Actualizar(administrador);
    }

    public void EliminarAdministrador(String doi) {
        repAdmin.Eliminar(doi);
    }

}
