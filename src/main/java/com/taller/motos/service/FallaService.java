package com.taller.motos.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.taller.motos.entity.Falla;
import com.taller.motos.repository.FallaRepository;

@Service
public class FallaService {
    
    private FallaRepository fallaRepository;

    public FallaService(FallaRepository fallaRepository){
        this.fallaRepository = fallaRepository;
    }

    public List<Falla> getAllFalla(){
        return fallaRepository.findAll();
    }

    public Falla saveFalla(Falla falla){
        return fallaRepository.save(falla);
    }

    public Falla updateFalla(Long id, Falla falla){
        Optional<Falla> fallaEncontrado = fallaRepository.findById(id);

        if(fallaEncontrado.isPresent()){

            Falla f = fallaEncontrado.get();

            if(falla.getNombre() !=null){
                f.setNombre(falla.getNombre());
            }
            if(falla.getDescripcion() !=null){
                f.setDescripcion(falla.getDescripcion());
            }
            if(falla.getNivel_gravedad() !=null){
                f.setNivel_gravedad(falla.getNivel_gravedad());
            }

            return fallaRepository.save(f);
        } else {
            throw new RuntimeException("No se encontro ninguna falla con id: " + id );
        }

    }

    public void deleteFalla(Long id){
        fallaRepository.deleteById(id);
    }
}
