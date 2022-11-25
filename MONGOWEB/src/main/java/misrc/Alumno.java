package misrc;

public class Alumno {

    private String idAlumno;
    private String nombre;
    private int edad;
    private double estatura;
    private String foto;

    public Alumno() {
    }

    public Alumno(String idAlumno, String nombre, int edad, double estatura, String foto) {
        this.idAlumno = idAlumno;
        this.nombre = nombre;
        this.edad = edad;
        this.estatura = estatura;
        this.foto = foto;
    }

    public String getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(String idAlumno) {
        this.idAlumno = idAlumno;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    @Override
    public String toString() {
        return "Alumno{" + "idAlumno=" + idAlumno + ", nombre=" + nombre + ", edad=" + edad + ", estatura=" + estatura + ", foto=" + foto + '}';
    }

}
