package com.taller.motos.service;

import com.taller.motos.entity.Rol;
import com.taller.motos.repository.RolRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RolService {

    private final RolRepository rolRepository;

    public RolService(RolRepository rolRepository) {
        this.rolRepository = rolRepository;
    }

    public List<Rol> getAllRols() {
        return rolRepository.findAll();
    }

    public Rol saveRol(Rol Rol) {
        return rolRepository.save(Rol);
    }

    public Rol updateRol(Long id, Rol Rol) {
        Optional<Rol> RolExistente = rolRepository.findById(id);

        if (RolExistente.isPresent()) {
            Rol r = RolExistente.get();

            if (Rol.getNombre() != null) {
                r.setNombre(Rol.getNombre());
            }
            if (Rol.getDescripcion() != null) {
                r.setDescripcion(Rol.getDescripcion());
            }
            return rolRepository.save(r);
        } else {
            throw new RuntimeException("Rol no encontrado con id " + id);
        }
    }

    public void deleteRol(Long id){
        rolRepository.deleteById(id);
    }
}