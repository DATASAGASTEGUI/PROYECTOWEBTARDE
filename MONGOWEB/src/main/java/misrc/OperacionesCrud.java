package misrc;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.bson.Document;

public class OperacionesCrud {

    private MongoDatabase conexion;

    public OperacionesCrud() {
        MongoClient cliente = new MongoClient("localhost", 27017);
        conexion = cliente.getDatabase("colegio");
    }

    public Map<String, Alumno> getHashMapAlumno() {
        Map<String, Alumno> alumnos_hm = new HashMap<>();
        try {
            MongoCollection<Document> coleccion = conexion.getCollection("alumno");
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
        return alumnos_hm;
    }
}
