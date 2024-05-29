package utp.edu.pe.ProyectoED.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utp.edu.pe.ProyectoED.Models.Proveedor;
import utp.edu.pe.ProyectoED.Repository.IRepProveedor;

import java.util.List;

@Service
public class ServiceProveedorImpl {

    @Autowired
    private IRepProveedor repProveedor;

    public List<Proveedor> Listar() {
        return repProveedor.Listar();
    }

}
