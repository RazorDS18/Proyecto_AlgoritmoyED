package utp.edu.pe.ProyectoED.Patterns;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    private static String url = "jdbc:sqlserver://localhost:1433;databaseName=LavadoV;TrustServerCertificate=true";

    //private static String url="jdbc:sqlserver://localhost;databaseName=LavadoV;authenticationScheme=NTLM;integratedSecurity=true;domain=CMACICA.COM:PE;encrypt=true;TrustServerCertificate=true";
    private static String userName = "MarcoED";
    private static String password = "123";
    private static Connection con;

    public static Connection getConexion() throws SQLException {
        con = DriverManager.getConnection(url, userName, password);
        return con;
    }

    public static Connection setConection(String url, String userName, String password) throws SQLException {
        con = DriverManager.getConnection(url);
        return con;
    }


}
