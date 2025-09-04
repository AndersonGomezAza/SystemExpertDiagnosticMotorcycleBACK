package com.taller.motos.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.taller.motos.entity.Diagnostico;
import com.taller.motos.entity.Motocicleta;
import com.taller.motos.entity.Usuario;
import com.taller.motos.repository.DiagnosticoRepository;
import com.taller.motos.repository.MotocicletaRepository;
import com.taller.motos.repository.UsuarioRepository;

@Service
public class DiagnosticoService {

    private final DiagnosticoRepository diagnosticoRepository;
    private final UsuarioRepository usuarioRepository;
    private final MotocicletaRepository motocicletaRepository;

    public DiagnosticoService(DiagnosticoRepository diagnosticoRepository, 
                              MotocicletaRepository motocicletaRepository,
                              UsuarioRepository usuarioRepository) {
        this.diagnosticoRepository = diagnosticoRepository;
        this.usuarioRepository = usuarioRepository;
        this.motocicletaRepository = motocicletaRepository;
    }

    public List<Diagnostico> getDiagnosticos(Long idUsuario, Long idMoto, String placa) {
    if (idUsuario != null) {
        // Validar usuario
        Usuario usuario = usuarioRepository.findById(idUsuario)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        return diagnosticoRepository.findByMotocicletaUsuarioIdUsuario(usuario.getId_usuario());
    } else if (idMoto != null) {
        // Validar moto
        Motocicleta moto = motocicletaRepository.findById(idMoto)
                .orElseThrow(() -> new RuntimeException("Moto no encontrada"));
        return diagnosticoRepository.findByMotocicletaIdMoto(moto.getId_moto());
    } else if (placa != null) {
        // Buscar todas las motos cuya placa contenga el texto
        List<Motocicleta> motos = motocicletaRepository.findByPlacaContainingIgnoreCase(placa);

        if (motos.isEmpty()) {
            throw new RuntimeException("No se encontraron motos con esa placa");
        }

        // Traer todos los diagnósticos de las motos encontradas
        List<Diagnostico> diagnosticos = new ArrayList<>();
        for (Motocicleta moto : motos) {
            diagnosticos.addAll(diagnosticoRepository.findByMotocicletaIdMoto(moto.getId_moto()));
        }

        return diagnosticos;
    } else {
        // Si no hay filtros, devuelve todos
        return diagnosticoRepository.findAll();
    }
}

    // Obtener un diagnóstico por ID
    public Optional<Diagnostico> getDiagnosticoById(Long id) {
        return diagnosticoRepository.findById(id);
    }

    // Crear un nuevo diagnóstico
    public Diagnostico createDiagnostico(Diagnostico diagnostico, Long idMoto) {
        // Traer la motocicleta
        Motocicleta moto = motocicletaRepository.findById(idMoto)
                .orElseThrow(() -> new RuntimeException("Motocicleta no encontrada"));

        diagnostico.setMotocicleta(moto);

        // Persistir diagnóstico con relaciones N:N
        return diagnosticoRepository.save(diagnostico);
    }

    // Actualizar un diagnóstico existente
    public Optional<Diagnostico> updateDiagnostico(Long id, Diagnostico diagnosticoDetails, Long idMoto) {
        return diagnosticoRepository.findById(id).map(diagnostico -> {

            // Actualizar campos básicos
            diagnostico.setEstado(diagnosticoDetails.getEstado());
            diagnostico.setFecha(diagnosticoDetails.getFecha());

            // Actualizar motocicleta si se proporciona
            if (idMoto != null) {
                Motocicleta moto = motocicletaRepository.findById(idMoto)
                        .orElseThrow(() -> new RuntimeException("Motocicleta no encontrada"));
                diagnostico.setMotocicleta(moto);
            }

            // Actualizar relaciones N:N
            diagnostico.setSintomas(diagnosticoDetails.getSintomas());
            diagnostico.setFallas(diagnosticoDetails.getFallas());
            diagnostico.setCausas(diagnosticoDetails.getCausas());
            diagnostico.setSoluciones(diagnosticoDetails.getSoluciones());

            return diagnosticoRepository.save(diagnostico);
        });
    }

    // Eliminar un diagnóstico
    public void deleteDiagnostico(Long id) {
        diagnosticoRepository.deleteById(id);
    }
}
