package com.example.rentaautos.Entity;

//@Entity
//@Table(name = "credenciales_usuario")
public class CredencialesUsuario {

    private int idusuario;

    //@JoinColumn(name = "idusuario", insertable = false, updatable = false)
    private Usuario usuario;

    private String correo;
    private String contraseña_encriptada;

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña_encriptada() {
        return contraseña_encriptada;
    }

    public void setContraseña_encriptada(String contraseña_encriptada) {
        this.contraseña_encriptada = contraseña_encriptada;
    }
}
