package com.taller.motos.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "causa")
public class Causa {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_causa;

    public String descripcion;

    public Causa () {}

    public Causa ( Long id_causa, String descripcion ){
        this.id_causa = id_causa;
        this.descripcion = descripcion;
    }

    public Long getId_causa() {
        return id_causa;
    }

    public void setId_causa(Long id_causa) {
        this.id_causa = id_causa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    
}
