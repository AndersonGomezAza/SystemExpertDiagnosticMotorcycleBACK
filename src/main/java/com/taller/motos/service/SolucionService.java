package com.taller.motos.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.taller.motos.entity.Solucion;
import com.taller.motos.repository.SolucionRepository;

@Service
public class SolucionService {
    
    private final SolucionRepository solucionRepository;

    public SolucionService (SolucionRepository solucionRepository) {
        this.solucionRepository = solucionRepository;
    }

    public List<Solucion> getAllSoluciones(){
        return solucionRepository.findAll();
    }

    public Solucion saveSolucion(Solucion solucion){
        return solucionRepository.save(solucion);
    }

    public Solucion updateSolucion( Long id, Solucion solucion){
        Optional<Solucion> solucionEncontrada = solucionRepository.findById(id);
        
        if (solucionEncontrada.isPresent()) {
            Solucion s = solucionEncontrada.get();

            if (solucion.getDescripcion() != null) {
                s.setDescripcion(solucion.getDescripcion());
            }
            if (solucion.getCosto_estimado() != null) {
                s.setCosto_estimado(solucion.getCosto_estimado());
            }
            if (solucion.getTiempo_estimado() != null) {
                s.setTiempo_estimado(solucion.getTiempo_estimado());
            }
            return solucionRepository.save(s);
        } else {
            throw new RuntimeException("Solucion no encontrada con el id: "+ id);       
        }
    }

    public void deleteSolucion (Long id){
        solucionRepository.deleteById(id);
    }

}
