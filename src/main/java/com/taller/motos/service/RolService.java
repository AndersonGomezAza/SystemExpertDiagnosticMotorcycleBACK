package com.taller.motos.service;

import com.taller.motos.entity.Rol;
import com.taller.motos.repository.RolRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RolService {

    private final RolRepository RolRepository;

    public RolService(RolRepository RolRepository) {
        this.RolRepository = RolRepository;
    }

    public List<Rol> getAllRols() {
        return RolRepository.findAll();
    }

    public Rol saveRol(Rol Rol) {
        return RolRepository.save(Rol);
    }

    public Rol updateRol(Long id, Rol Rol) {
        Optional<Rol> RolExistente = RolRepository.findById(id);

        if (RolExistente.isPresent()) {
            Rol u = RolExistente.get();

            if (Rol.getNombre() != null) {
                u.setNombre(Rol.getNombre());
            }
            if (Rol.getDescripcion() != null) {
                u.setDescripcion(Rol.getDescripcion());
            }
            return RolRepository.save(u);
        } else {
            throw new RuntimeException("Rol no encontrado con id " + id);
        }
    }
}