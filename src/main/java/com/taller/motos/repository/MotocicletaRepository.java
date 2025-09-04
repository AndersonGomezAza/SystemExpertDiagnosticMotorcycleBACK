package com.taller.motos.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taller.motos.entity.Motocicleta;

public interface MotocicletaRepository extends JpaRepository<Motocicleta, Long> {
    List<Motocicleta> findByPlacaContainingIgnoreCase(String placa);
}