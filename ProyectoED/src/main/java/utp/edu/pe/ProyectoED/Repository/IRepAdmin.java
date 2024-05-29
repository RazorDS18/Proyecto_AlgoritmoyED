package utp.edu.pe.ProyectoED.Repository;

import utp.edu.pe.ProyectoED.Models.Administrador;

import java.util.List;

public interface IRepAdmin {

    List<Administrador> Listar();

    Administrador BuscarPorDOI(String DOI);

    Administrador Crear(Administrador administrador);

    void Actualizar(Administrador administrador);

    void Eliminar(String DOI);

}
