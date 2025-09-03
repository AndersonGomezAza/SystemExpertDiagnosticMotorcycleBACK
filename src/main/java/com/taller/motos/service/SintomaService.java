package com.taller.motos.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.taller.motos.entity.Sintoma;
import com.taller.motos.repository.SintomaRepository;

@Service
public class SintomaService {
    
    private final SintomaRepository sintomaRepository;

    public SintomaService(SintomaRepository sintomaRepository) {
        this.sintomaRepository = sintomaRepository;
    }

    public List<Sintoma> getAllSintomas(){
        return sintomaRepository.findAll();
    }

    public Sintoma saveSintoma(Sintoma sintoma){
        return sintomaRepository.save(sintoma);
    }

    public Sintoma updateSintoma(Long id, Sintoma sintoma){
        Optional<Sintoma> sintomaExistente = sintomaRepository.findById(id);

        if (sintomaExistente.isPresent()) {
            Sintoma s = sintomaExistente.get();

            if (sintoma.getCategoria() != null) {
                s.setCategoria(sintoma.getCategoria());
            }
            if (sintoma.getDescripcion() != null) {
                s.setDescripcion(sintoma.getDescripcion());
            }

            return sintomaRepository.save(s);
        } else {
            throw new RuntimeException("Sintoma no encontrado con id " + id);
        }
    }

    public void deleteSintoma(Long id){
        sintomaRepository.deleteById(id);
    }
}
