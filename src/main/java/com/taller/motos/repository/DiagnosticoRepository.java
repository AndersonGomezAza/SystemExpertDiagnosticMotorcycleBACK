package com.taller.motos.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taller.motos.entity.Diagnostico;

public interface DiagnosticoRepository extends JpaRepository<Diagnostico,Long>{

    List<Diagnostico> findByMotocicletaUsuarioIdUsuario(Long idUsuario);
    List<Diagnostico> findByMotocicletaIdMoto(Long idMoto);
    List<Diagnostico> findByMotocicletaPlaca(String placa);

}
