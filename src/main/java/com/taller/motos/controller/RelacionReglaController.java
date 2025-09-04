package com.taller.motos.controller;

import com.taller.motos.entity.RelacionRegla;
import com.taller.motos.service.RelacionReglaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/relacion-regla")
public class RelacionReglaController {

    private final RelacionReglaService relacionReglaService;

    public RelacionReglaController(RelacionReglaService relacionReglaService) {
        this.relacionReglaService = relacionReglaService;
    }

    @PostMapping
    public ResponseEntity<RelacionRegla> crear(@RequestBody RelacionRegla relacion) {
        return ResponseEntity.ok(relacionReglaService.crearRelacion(relacion));
    }

    @GetMapping
    public ResponseEntity<List<RelacionRegla>> obtenerTodas() {
        return ResponseEntity.ok(relacionReglaService.obtenerTodas());
    }

    @GetMapping("/{id}")
    public ResponseEntity<RelacionRegla> obtenerPorId(@PathVariable Long id) {
        return ResponseEntity.ok(relacionReglaService.obtenerPorId(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<RelacionRegla> actualizar(@PathVariable Long id, @RequestBody RelacionRegla relacion) {
        return ResponseEntity.ok(relacionReglaService.actualizarRelacion(id, relacion));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        relacionReglaService.eliminarRelacion(id);
        return ResponseEntity.noContent().build();
    }
}
