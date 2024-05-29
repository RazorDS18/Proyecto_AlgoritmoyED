package utp.edu.pe.ProyectoED.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utp.edu.pe.ProyectoED.Models.Cliente;
import utp.edu.pe.ProyectoED.Models.Producto;
import utp.edu.pe.ProyectoED.Repository.IRepProducto;

import java.util.List;

@Service
public class ServiceProductoImpl {

    @Autowired
    private IRepProducto repProducto;

    public List<Producto> Listar() {
        return repProducto.Listar();
    }

}
