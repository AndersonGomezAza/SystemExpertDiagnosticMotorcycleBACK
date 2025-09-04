package com.taller.motos.service;

import com.taller.motos.entity.RelacionRegla;
import com.taller.motos.repository.RelacionReglaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RelacionReglaService {

    private final RelacionReglaRepository relacionReglaRepository;

    public RelacionReglaService(RelacionReglaRepository relacionReglaRepository) {
        this.relacionReglaRepository = relacionReglaRepository;
    }

    // Crear nueva relación
    public RelacionRegla crearRelacion(RelacionRegla relacion) {
        return relacionReglaRepository.save(relacion);
    }

    // Obtener todas las relaciones
    public List<RelacionRegla> obtenerTodas() {
        return relacionReglaRepository.findAll();
    }

    // Obtener por id
    public RelacionRegla obtenerPorId(Long id) {
        return relacionReglaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Relación no encontrada"));
    }

    // Actualizar relación
    public RelacionRegla actualizarRelacion(Long id, RelacionRegla relacionActualizada) {
        RelacionRegla relacion = obtenerPorId(id);
        relacion.setRegla(relacionActualizada.getRegla());
        relacion.setSintoma(relacionActualizada.getSintoma());
        relacion.setFalla(relacionActualizada.getFalla());
        relacion.setSolucion(relacionActualizada.getSolucion());
        return relacionReglaRepository.save(relacion);
    }

    // Eliminar relación
    public void eliminarRelacion(Long id) {
        relacionReglaRepository.deleteById(id);
    }
}
