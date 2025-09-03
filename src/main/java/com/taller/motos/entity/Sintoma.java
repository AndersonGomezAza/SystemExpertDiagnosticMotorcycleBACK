package com.taller.motos.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "sintoma")
public class Sintoma {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_sintoma;

    public String descripcion;
    public String categoria;

    public Sintoma () {}

    public Sintoma(Long id_sintoma, String descripcion, String categoria) {
        this.id_sintoma = id_sintoma;
        this.descripcion = descripcion;
        this.categoria = categoria;
    }

    public Long getId_sintoma() {
        return id_sintoma;
    }

    public void setId_sintoma(Long id_sintoma) {
        this.id_sintoma = id_sintoma;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    
}
