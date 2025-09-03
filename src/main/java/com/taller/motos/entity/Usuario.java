package com.taller.motos.entity;

import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idUsuario;

    private String nombre_usuario;
    private String email;
    private String password_hash;
    private String telefono;
    private String direccion;
    private Date fecha_registro;
    private Date ultimo_login;

    @ManyToOne
    @JoinColumn(name = "id_rol", nullable = false)
    private Rol rol;

    public Usuario() {}

    public Usuario(Long idUsuario, Rol rol, String nombre_usuario, String email, String password_hash, String telefono,
            String direccion, Date fecha_registro, Date ultimo_login) {
        this.idUsuario = idUsuario;
        this.nombre_usuario = nombre_usuario;
        this.email = email;
        this.password_hash = password_hash;
        this.telefono = telefono;
        this.direccion = direccion;
        this.fecha_registro = fecha_registro;
        this.ultimo_login = ultimo_login;
        this.rol = rol;
    }

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword_hash() {
        return password_hash;
    }

    public void setPassword_hash(String password_hash) {
        this.password_hash = password_hash;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public Date getUltimo_login() {
        return ultimo_login;
    }

    public void setUltimo_login(Date ultimo_login) {
        this.ultimo_login = ultimo_login;
    }

    
}