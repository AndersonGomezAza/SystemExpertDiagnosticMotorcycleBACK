package com.taller.motos.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.taller.motos.entity.Motocicleta;
import com.taller.motos.repository.MotocicletaRepository;

@Service
public class MotocicletaService {
    
    private MotocicletaRepository motocicletaRepository;

    public MotocicletaService(MotocicletaRepository motocicletaRepository) {
        this.motocicletaRepository = motocicletaRepository;
    }

    public List<Motocicleta> getAllMotocicletas (){
        return motocicletaRepository.findAll();
    }

    public Motocicleta saveMotocicleta(Motocicleta motocicleta){
        return motocicletaRepository.save(motocicleta);
    }

    public Motocicleta updateMotocicleta(Long id, Motocicleta motocicleta){
        Optional<Motocicleta> motocicletaExistente = motocicletaRepository.findById(id);

        if (motocicletaExistente.isPresent()) {
            Motocicleta u = motocicletaExistente.get();

            if (motocicleta.getAnio() != null) {
                u.setAnio(motocicleta.getAnio());
            }
            if (motocicleta.getCilindraje() != null) {
                u.setCilindraje(motocicleta.getCilindraje());
            }
            if (motocicleta.getColor() != null) {
                u.setColor(motocicleta.getColor());
            }
            if (motocicleta.getCombustible() != null) {
                u.setCombustible(motocicleta.getCombustible());
            }
            if (motocicleta.getMarca() != null) {
                u.setMarca(motocicleta.getMarca());
            }
            if (motocicleta.getModelo() != null) {
                u.setModelo(motocicleta.getModelo());
            }
            if (motocicleta.getPlaca() != null) {
                u.setPlaca(motocicleta.getPlaca());
            }
            if (motocicleta.getTipo_motor() != null) {
                u.setTipo_motor(motocicleta.getTipo_motor());
            }
            return motocicletaRepository.save(u);
        } else {
            throw new RuntimeException("Motocicleta no encontrado con id " + id);
        }
    }

    public void deleteMotocicleta(Long id){
        motocicletaRepository.deleteById(id);
    }
}
