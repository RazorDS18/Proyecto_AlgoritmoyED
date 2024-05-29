package utp.edu.pe.ProyectoED.Models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Empleado {

    private int id;
    private String user;
    private String pw;
    private String names;
    private String lastnames;
    private String doi;
    private String cargo;
    private String gmail;
    private String telefono;
    private int estado;
    private Date fContrato;
    private Date fDespido;
    private double salario;

}
