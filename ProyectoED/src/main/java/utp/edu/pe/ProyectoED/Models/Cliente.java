package utp.edu.pe.ProyectoED.Models;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)

public class Cliente {
    private int id;
    private String user;
    private String pw;
    private String names;
    private String lastnames;
    private String doi;
    private String gmail;
    private String telefono;
    private String direccion;
    private  int estado;
}
