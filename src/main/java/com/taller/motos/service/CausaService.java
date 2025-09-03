package com.taller.motos.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.taller.motos.entity.Causa;
import com.taller.motos.repository.CausaRepository;

@Service
public class CausaService {
    
    private final CausaRepository causaRepository;

    public CausaService (CausaRepository causaRepository ){
        this.causaRepository = causaRepository;
    }

    public List<Causa> getAllCausas () {
        return causaRepository.findAll();
    }

    public Causa saveCausa( Causa causa ){
        return causaRepository.save(causa);
    }

    public Causa updateCausa (Long id, Causa causa){
        Optional<Causa> causaEncontrada = causaRepository.findById(id);
        if (causaEncontrada.isPresent()) {
            Causa c = causaEncontrada.get();

            if (causa.getDescripcion() != null) {
                c.setDescripcion(causa.getDescripcion());
            }

            return causaRepository.save(c);
        } else {
            throw new RuntimeException("No se encontro la causa con id: " + id);
        }
    }

    public void deleteCausa(Long id){
        causaRepository.deleteById(id);
    }

}
