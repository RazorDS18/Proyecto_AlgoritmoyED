package utp.edu.pe.ProyectoED.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utp.edu.pe.ProyectoED.Models.CyV.Compra;
import utp.edu.pe.ProyectoED.Repository.CyV.IRepCompra;

import java.util.List;
@Service

public class ServiceCompraImpl {
    @Autowired
    private IRepCompra repCompra;

    public List<Compra> Listar(){
        return repCompra.ListarCompras();
    }

}
