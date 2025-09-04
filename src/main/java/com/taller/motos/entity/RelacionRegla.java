package com.taller.motos.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "relacion_regla")
public class RelacionRegla {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_relacion")
    private Long idRelacion;

    @ManyToOne
    @JoinColumn(name = "id_regla", nullable = false)
    private Regla regla;

    @ManyToOne
    @JoinColumn(name = "id_sintoma")
    private Sintoma sintoma;

    @ManyToOne
    @JoinColumn(name = "id_falla")
    private Falla falla;

    @ManyToOne
    @JoinColumn(name = "id_solucion")
    private Solucion solucion;

    // Getters y Setters
    public Long getIdRelacion() { return idRelacion; }
    public void setIdRelacion(Long idRelacion) { this.idRelacion = idRelacion; }

    public Regla getRegla() { return regla; }
    public void setRegla(Regla regla) { this.regla = regla; }

    public Sintoma getSintoma() { return sintoma; }
    public void setSintoma(Sintoma sintoma) { this.sintoma = sintoma; }

    public Falla getFalla() { return falla; }
    public void setFalla(Falla falla) { this.falla = falla; }

    public Solucion getSolucion() { return solucion; }
    public void setSolucion(Solucion solucion) { this.solucion = solucion; }
}
