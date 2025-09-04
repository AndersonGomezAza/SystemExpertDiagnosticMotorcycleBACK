package com.taller.motos.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "motocicleta")
public class Motocicleta {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_moto")
    private Long idMoto;

    public String marca; 
    public String modelo;
    public Integer anio;
    public String cilindraje;
    public String tipo_motor;
    public String combustible;
    public String placa;
    public String color;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    public Motocicleta () {}

    public Motocicleta(Long idMoto, String marca, String modelo, Integer anio, String cilindraje, String tipo_motor,
            String combustible, String placa, String color, Usuario usuario) {
        this.idMoto = idMoto;
        this.marca = marca;
        this.modelo = modelo;
        this.anio = anio;
        this.cilindraje = cilindraje;
        this.tipo_motor = tipo_motor;
        this.combustible = combustible;
        this.placa = placa;
        this.color = color;
        this.usuario = usuario;
    }

    public Long getId_moto() {
        return idMoto;
    }

    public void setId_moto(Long idMoto) {
        this.idMoto = idMoto;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Integer getAnio() {
        return anio;
    }

    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    public String getCilindraje() {
        return cilindraje;
    }

    public void setCilindraje(String cilindraje) {
        this.cilindraje = cilindraje;
    }

    public String getTipo_motor() {
        return tipo_motor;
    }

    public void setTipo_motor(String tipo_motor) {
        this.tipo_motor = tipo_motor;
    }

    public String getCombustible() {
        return combustible;
    }

    public void setCombustible(String combustible) {
        this.combustible = combustible;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Usuario getUsuarios() {
        return usuario;
    }

    public void setUsuarios(Usuario usuarios) {
        this.usuario = usuarios;
    }

    
}
