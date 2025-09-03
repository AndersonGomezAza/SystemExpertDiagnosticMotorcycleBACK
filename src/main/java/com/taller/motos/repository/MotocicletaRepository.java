package com.taller.motos.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.taller.motos.entity.Motocicleta;

public interface MotocicletaRepository extends JpaRepository<Motocicleta, Long> {}