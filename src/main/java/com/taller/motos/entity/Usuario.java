package com.taller.motos.entity;

import java.time.LocalDateTime;
import java.util.*;

import jakarta.persistence.*;

@Entity
@Table(name = "usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")
    private Long idUsuario;
    @Column(nullable = false, length = 50)
    private String nombre_usuario;
    @Column(nullable = false, unique = true, length = 100)
    private String email;
    @Column(nullable = false, length = 255)
    private String password_hash;
    @Column(length = 20)
    private String telefono;
    @Column(length = 255)
    private String direccion;
    @Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private java.time.LocalDateTime fecha_registro;
    private java.time.LocalDateTime ultimo_login;
    @ManyToMany()
    @JoinTable(
        name = "usuario_rol",  // usa tu tabla intermedia existente
        joinColumns = @JoinColumn(name = "idUsuario"),
        inverseJoinColumns = @JoinColumn(name = "id_rol")
    )
    private Set<Rol> rol = new HashSet<>();

    public Usuario() {}

    public Usuario(Long idUsuario, String nombre_usuario, String email, String password_hash, String telefono,
            String direccion, LocalDateTime fecha_registro, LocalDateTime ultimo_login, Set<Rol> rol) {
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

    public Long getId_usuario() {
        return idUsuario;
    }

    public void setId_usuario(Long idUsuario) {
        this.idUsuario = idUsuario;
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

    public java.time.LocalDateTime getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(java.time.LocalDateTime fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public java.time.LocalDateTime getUltimo_login() {
        return ultimo_login;
    }

    public void setUltimo_login(java.time.LocalDateTime ultimo_login) {
        this.ultimo_login = ultimo_login;
    }

    public Set<Rol> getRol() {
        return rol;
    }

    public void setRol(Set<Rol> rol) {
        this.rol = rol;
    }

    

    
}