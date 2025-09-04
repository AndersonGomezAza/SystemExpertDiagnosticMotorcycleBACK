package com.taller.motos.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "diagnostico")
public class Diagnostico {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_diagnostico;

    private Date fecha;
    private String estado; 
    
    @ManyToOne
    @JoinColumn(name = "id_moto", nullable = false)
    private Motocicleta motocicleta;  // Relación con la motocicleta

    // Relación con Sintomas
    @ManyToMany
    @JoinTable(
        name = "Diagnostico_Sintoma",
        joinColumns = @JoinColumn(name = "id_diagnostico"),
        inverseJoinColumns = @JoinColumn(name = "id_sintoma")
    )
    private List<Sintoma> sintomas;

    // Relación con Fallas
    @ManyToMany
    @JoinTable(
        name = "Diagnostico_Falla",
        joinColumns = @JoinColumn(name = "id_diagnostico"),
        inverseJoinColumns = @JoinColumn(name = "id_falla")
    )
    private List<Falla> fallas;

    // Relación con Causas
    @ManyToMany
    @JoinTable(
        name = "Diagnostico_Causa",
        joinColumns = @JoinColumn(name = "id_diagnostico"),
        inverseJoinColumns = @JoinColumn(name = "id_causa")
    )
    private List<Causa> causas;

    // Relación con Soluciones
    @ManyToMany
    @JoinTable(
        name = "Diagnostico_Solucion",
        joinColumns = @JoinColumn(name = "id_diagnostico"),
        inverseJoinColumns = @JoinColumn(name = "id_solucion")
    )
    private List<Solucion> soluciones;

    // Constructor vacío
    public Diagnostico(){}

    // Constructor completo
    public Diagnostico(Long id_diagnostico, Date fecha, String estado, Motocicleta motocicleta,
                       List<Sintoma> sintomas, List<Falla> fallas,
                       List<Causa> causas, List<Solucion> soluciones) {
        this.id_diagnostico = id_diagnostico;
        this.fecha = fecha;
        this.estado = estado;
        this.motocicleta = motocicleta;
        this.sintomas = sintomas;
        this.fallas = fallas;
        this.causas = causas;
        this.soluciones = soluciones;
    }

    // Getters y Setters
    public Long getId_diagnostico() {
        return id_diagnostico;
    }

    public void setId_diagnostico(Long id_diagnostico) {
        this.id_diagnostico = id_diagnostico;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Motocicleta getMotocicleta() {
        return motocicleta;
    }

    public void setMotocicleta(Motocicleta motocicleta) {
        this.motocicleta = motocicleta;
    }

    public List<Sintoma> getSintomas() {
        return sintomas;
    }

    public void setSintomas(List<Sintoma> sintomas) {
        this.sintomas = sintomas;
    }

    public List<Falla> getFallas() {
        return fallas;
    }

    public void setFallas(List<Falla> fallas) {
        this.fallas = fallas;
    }

    public List<Causa> getCausas() {
        return causas;
    }

    public void setCausas(List<Causa> causas) {
        this.causas = causas;
    }

    public List<Solucion> getSoluciones() {
        return soluciones;
    }

    public void setSoluciones(List<Solucion> soluciones) {
        this.soluciones = soluciones;
    }
}
