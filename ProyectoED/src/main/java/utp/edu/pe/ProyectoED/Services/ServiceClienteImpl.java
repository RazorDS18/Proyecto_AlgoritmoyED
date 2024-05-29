package utp.edu.pe.ProyectoED.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utp.edu.pe.ProyectoED.Models.Cliente;
import utp.edu.pe.ProyectoED.Models.Empleado;
import utp.edu.pe.ProyectoED.Repository.IRepCliente;

import java.util.List;

@Service
public class ServiceClienteImpl {

    @Autowired
    private IRepCliente repCliente;

    public List<Cliente> Listar() {
        return repCliente.Listar();
    }
}
