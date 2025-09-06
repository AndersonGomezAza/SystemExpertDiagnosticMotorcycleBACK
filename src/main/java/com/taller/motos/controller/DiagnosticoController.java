package com.taller.motos.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Diagnostico;
import com.taller.motos.service.DiagnosticoService;

@CrossOrigin(origins = "https://localhost:4200" )
@RestController
@RequestMapping("/diagnosticos")
public class DiagnosticoController {
    private final DiagnosticoService diagnosticoService;

    public DiagnosticoController(DiagnosticoService diagnosticoService) {
        this.diagnosticoService = diagnosticoService;
    }

    // Obtener todos los diagnósticos
    @GetMapping()
    public ResponseEntity<List<Diagnostico>> buscarDiagnosticos(
            @RequestParam(required = false) Long idUsuario,
            @RequestParam(required = false) Long idMoto,
            @RequestParam(required = false) String placa) {

        List<Diagnostico> diagnosticos = diagnosticoService.getDiagnosticos(idUsuario, idMoto, placa);
        return ResponseEntity.ok(diagnosticos);
    }

    // Obtener diagnóstico por ID
    @GetMapping("/{id}")
    public ResponseEntity<Diagnostico> getDiagnosticoById(@PathVariable Long id) {
        return diagnosticoService.getDiagnosticoById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // Crear diagnóstico (recibe JSON completo, incluye idMoto)
    @PostMapping
    public ResponseEntity<Diagnostico> createDiagnostico(@RequestBody Diagnostico diagnostico,
                                                         @RequestParam Long idMoto) {
        try {
            Diagnostico created = diagnosticoService.createDiagnostico(diagnostico, idMoto);
            return ResponseEntity.ok(created);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    // Actualizar diagnóstico
    @PutMapping("/{id}")
    public ResponseEntity<Diagnostico> updateDiagnostico(@PathVariable Long id,
                                                         @RequestBody Diagnostico diagnostico,
                                                         @RequestParam(required = false) Long idMoto) {
        return diagnosticoService.updateDiagnostico(id, diagnostico, idMoto)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // Eliminar diagnóstico
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDiagnostico(@PathVariable Long id) {
        diagnosticoService.deleteDiagnostico(id);
        return ResponseEntity.noContent().build();
    }
}
