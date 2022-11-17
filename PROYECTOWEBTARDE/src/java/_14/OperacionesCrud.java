package _14;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class OperacionesCrud {

    private Connection conexion;

    public OperacionesCrud(String db) {
        String url = "jdbc:mysql://localhost:3306/" + db;//protocolo-IP-PUERTO-BD
        String usuario = "root";
        String clave = "12345678";
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (Exception e) {

        }
    }

    public Map<String, Alumno> getHashMapAlumno() {

        Map<String, Alumno> alumnos_hm = new HashMap<>();

        String query = "SELECT * FROM Alumno";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String codigo = rs.getString(1);
                String nombre = rs.getString(2);
                int edad = rs.getInt(3);
                double estatura = rs.getDouble(4);
                String foto = rs.getString(5);
                Alumno alumno = new Alumno(codigo, nombre, edad, estatura, foto);
                alumnos_hm.put(alumno.getCodigo(), alumno);
            }
        } catch (Exception e) {
            alumnos_hm = null;
        }
        return alumnos_hm;
    }

    /*    
    public Zoologico getObjetoZoologico(String idZoo) {
        Zoologico zoologico = null;
        String query = "SELECT * FROM Zoologico WHERE idZoo = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, idZoo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String idZoo1 = rs.getString(1);
                String descripcion = rs.getString(2);
                String ciudad = rs.getString(3);
                double superficie = rs.getDouble(4);
                double presupuesto = rs.getDouble(5);
                String pais = rs.getString(6);

                zoologico = new Zoologico(idZoo1, descripcion, ciudad, superficie, presupuesto, pais);
            }
        } catch (Exception e) {

        }
        return zoologico;
    }

    public boolean insertarObjetoZoologico(Zoologico zoologico) {
        boolean bandera = true;
        String query = "INSERT INTO Zoologico VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, zoologico.getIdZoo());
            ps.setString(2, zoologico.getDescripcion());
            ps.setString(3, zoologico.getCiudad());
            ps.setDouble(4, zoologico.getSuperficie());
            ps.setDouble(5, zoologico.getPresupuesto());
            ps.setString(6, zoologico.getPais());
            ps.executeUpdate();
        } catch (Exception e) {
            bandera = false;
        }
        return bandera;
    }

    public boolean eliminarZoologico(String idZooEliminar) {
        boolean bandera = true;
        String query1 = "DELETE FROM Animal WHERE idZoo = ?";
        String query2 = "DELETE FROM Zoologico WHERE idZoo = ?";
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(query1); //Hijos
            ps.setString(1, idZooEliminar);
            ps.executeUpdate();
            
            ps = conexion.prepareStatement(query2); //Padre
            ps.setString(1, idZooEliminar);
            ps.executeUpdate();
            
        } catch (Exception e) {
            bandera = false;
        }
        return bandera;
    }
    
    public boolean actualizarZoologico(Zoologico zNuevo) {
        boolean bandera = true;
        String query = "UPDATE Zoologico SET descripcion = ?,\n" +
"                     ciudad = ?,\n" +
"                     superficie = ?,\n" +
"                     presupuesto = ?,\n" +
"                     pais = ? \n" +
"WHERE idZoo = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, zNuevo.getDescripcion());
            ps.setString(2, zNuevo.getCiudad());
            ps.setDouble(3, zNuevo.getSuperficie());
            ps.setDouble(4, zNuevo.getPresupuesto());
            ps.setString(5, zNuevo.getPais());
            ps.setString(6, zNuevo.getIdZoo());
            ps.executeUpdate();
        }catch(Exception e) {
           bandera = false; 
        }
        return bandera;
    }
     */
}