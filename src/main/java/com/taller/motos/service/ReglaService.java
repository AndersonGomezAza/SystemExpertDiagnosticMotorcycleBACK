package com.taller.motos.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.taller.motos.entity.Regla;
import com.taller.motos.repository.ReglaRepository;

@Service
public class ReglaService {
    private final ReglaRepository reglaRepository;

    public ReglaService(ReglaRepository reglaRepository) {
        this.reglaRepository = reglaRepository;
    }

    public List<Regla> getAllReglas() {
        return reglaRepository.findAll();
    }

    public Regla saveRegla(Regla Regla) {
        return reglaRepository.save(Regla);
    }

    public Regla updateRegla(Long id, Regla Regla) {
        Optional<Regla> ReglaExistente = reglaRepository.findById(id);

        if (ReglaExistente.isPresent()) {
            Regla r = ReglaExistente.get();

            if (Regla.getCondicion() != null) {
                r.setCondicion(Regla.getCondicion());
            }
            if (Regla.getAccion() != null) {
                r.setAccion(Regla.getAccion());
            }
            return reglaRepository.save(r);
        } else {
            throw new RuntimeException("Regla no encontrado con id " + id);
        }
    }

    public void deleteRegla(Long id){
        reglaRepository.deleteById(id);
    }
}
