package com.taller.motos.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "regla")
public class Regla {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_regla")
    private Long idRegla;

    public String condicion;
    public String accion;

    public Regla (){}

    public Regla(Long idRegla, String condicion, String accion) {
        this.idRegla = idRegla;
        this.condicion = condicion;
        this.accion = accion;
    }

    public Long getIdRegla() {
        return idRegla;
    }

    public void setIdRegla(Long idRegla) {
        this.idRegla = idRegla;
    }

    public String getCondicion() {
        return condicion;
    }

    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    
}
