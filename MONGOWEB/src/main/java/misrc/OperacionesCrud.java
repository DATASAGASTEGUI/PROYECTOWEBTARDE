package misrc;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.bson.Document;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Set;
import java.util.TreeMap;

public class OperacionesCrud {

    private MongoDatabase conexion_mo;
    private Connection conexion_my;

    public OperacionesCrud(int x) {//1: MONGODB  2:MYSQL

        if (x == 1) {
            MongoClient cliente = new MongoClient("localhost", 27017);
            conexion_mo = cliente.getDatabase("colegio");
        }

        if (x == 2) {
            String url = "jdbc:mysql://localhost:3306/colegio";  //protocolo-IP-PUERTO-BD
            String usuario = "root";
            String clave = "12345678";
            try {
                Class.forName("com.mysql.jdbc.Driver");//Registrar el driver
                conexion_my = DriverManager.getConnection(url, usuario, clave);
            } catch (Exception e) {
                conexion_my = null;
            }
        }
    }

    public Map<String, Alumno> getHashMapAlumno(int x) { //1: MONGODB  2:MYSQL
        Map<String, Alumno> alumnos_hm = new HashMap<>();

        if (x == 1) {
            try {
                MongoCollection<Document> coleccion = conexion_mo.getCollection("alumno");
                MongoCursor<Document> cursor = coleccion.find().iterator();
                while (cursor.hasNext()) {
                    Document documento = cursor.next();
                    List lista = new ArrayList(documento.values());
                    String idAlumno = (String) lista.get(1);
                    String nombre = (String) lista.get(2);
                    int edad = (int) lista.get(3);
                    double estatura = (double) lista.get(4);
                    String foto = (String) lista.get(5);

                    Alumno alumno = new Alumno(idAlumno, nombre, edad, estatura, foto);
                    alumnos_hm.put(idAlumno, alumno);
                }
            } catch (Exception e) {
                alumnos_hm = null;
            }
        }

        if (x == 2) {
            String query = "SELECT * FROM Alumno";
            try {
                PreparedStatement ps = conexion_my.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String idAlumno = rs.getString(1);
                    String nombre = rs.getString(2);
                    int edad = rs.getInt(3);
                    double estatura = rs.getDouble(4);
                    String foto = rs.getString(5);
                    Alumno alumno = new Alumno(idAlumno, nombre, edad, estatura, foto);
                    alumnos_hm.put(alumno.getIdAlumno(), alumno);
                }
            } catch (Exception e) {
                alumnos_hm = null;
            }

        }

        return alumnos_hm;
    }

    public boolean insetarAlumno(Alumno alumno) {
        boolean bandera = true;
        try {
            String idAlumno = alumno.getIdAlumno();
            String nombre = alumno.getNombre();
            int edad = alumno.getEdad();
            double estatura = alumno.getEstatura();
            String foto = alumno.getFoto();

            Document documento = new Document("idAlumno", idAlumno)
                    .append("nombre", nombre)
                    .append("edad", edad)
                    .append("estatura", estatura)
                    .append("foto", foto);

            MongoCollection<Document> coleccion = conexion_mo.getCollection("alumno");
            coleccion.insertOne(documento);
        } catch (Exception e) {
            bandera = false;
        }
        return bandera;
    }

    public String getCodigo() {
        Map<String, Alumno> alumnos_hm = getHashMapAlumno(1);

        Map<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);

        Set<String> claves = alumnos_hm.keySet();

        String codigo = "";
        int numero = 0;

        for (String k : claves) {
            codigo = k;
            System.out.println(codigo);
        }

        numero = Integer.parseInt(codigo.substring(1)) + 1;

        return "A" + numero; //A12
    }

}

/*
//metodo para obtener el Id del Alumno
     public String getCodigo() {
         Map<String,Alumno> alumno_hm = getHashMapAlumno(1);
         TreeMap<String,Alumno> alumno_tm = new TreeMap<>(alumno_hm);
          Set <String> claves = alumno_tm.keySet();
          
          // para obtener la última posición
          
          String codigo="";     
          for (String k: claves){
            codigo = k;
          }
       int numero =  Integer.parseInt(codigo.substring(1))+1;
         
         
       return "A"+numero; 
     }

*/