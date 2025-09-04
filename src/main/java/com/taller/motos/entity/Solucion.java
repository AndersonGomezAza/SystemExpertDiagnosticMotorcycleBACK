package com.taller.motos.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "solucion")
public class Solucion {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_solucion;

    public String descripcion;
    public String tiempo_estimado;
    public Long costo_estimado;


    public Solucion () {}


    public Solucion(Long id_solucion, String descripcion, String tiempo_estimado, Long costo_estimado) {
        this.id_solucion = id_solucion;
        this.descripcion = descripcion;
        this.tiempo_estimado = tiempo_estimado;
        this.costo_estimado = costo_estimado;
    }


    public Long getId_solucion() {
        return id_solucion;
    }


    public void setId_solucion(Long id_solucion) {
        this.id_solucion = id_solucion;
    }


    public String getDescripcion() {
        return descripcion;
    }


    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    public String getTiempo_estimado() {
        return tiempo_estimado;
    }


    public void setTiempo_estimado(String tiempo_estimado) {
        this.tiempo_estimado = tiempo_estimado;
    }


    public Long getCosto_estimado() {
        return costo_estimado;
    }


    public void setCosto_estimado(Long costo_estimado) {
        this.costo_estimado = costo_estimado;
    }

    
}
