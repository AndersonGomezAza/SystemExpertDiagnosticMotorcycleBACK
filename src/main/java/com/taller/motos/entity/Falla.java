package com.taller.motos.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Pattern;

@Entity
@Table(name = "falla")
public class Falla {
    
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id_falla;

    public String nombre;
    public String descripcion;

    @Pattern(
        regexp = "Bajo|Medio|Alto|Crítico",
        message = "El nivel de gravedad debe ser: Bajo, Medio, Alto o Crítico"
    )
    private String nivel_gravedad;

    public Falla () {}
    
    public Falla(Long id_falla, String nombre, String descripcion,
            @Pattern(regexp = "Bajo|Medio|Alto|Crítico", message = "El nivel de gravedad debe ser: Bajo, Medio, Alto o Crítico") String nivel_gravedad) {
        this.id_falla = id_falla;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.nivel_gravedad = nivel_gravedad;
    }
    public Long getId_falla() {
        return id_falla;
    }
    public void setId_falla(Long id_falla) {
        this.id_falla = id_falla;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public String getNivel_gravedad() {
        return nivel_gravedad;
    }
    public void setNivel_gravedad(String nivel_gravedad) {
        this.nivel_gravedad = nivel_gravedad;
    } 

    
}
