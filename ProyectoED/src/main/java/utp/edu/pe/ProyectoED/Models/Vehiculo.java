package utp.edu.pe.ProyectoED.Models;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Vehiculo {
    private int id;
    private String marca;
    private String modelo;
    private String tipo;
    private String placa;
    private int estado;
    private  int cliente_id;
    Cliente cliente;
}
