package com.taller.motos.repository;

import org.springframework.data.jpa.repository.*;

import com.taller.motos.entity.Causa;

public interface CausaRepository extends JpaRepository<Causa, Long>{}
