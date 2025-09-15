package com.taller.motos.controller;

import java.util.*;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Motocicleta;
import com.taller.motos.service.MotocicletaService;

@RestController
@RequestMapping("/motocicletas")
public class MotocicletaController {
    
    private final MotocicletaService motocicletaService;

    public MotocicletaController(MotocicletaService motocicletaService) {
        this.motocicletaService = motocicletaService;
    }

    @GetMapping
    public ResponseEntity<?> getMotocicletas() {
        try {
            List<Motocicleta> motocicletas = motocicletaService.getAllMotocicletas();
            return ResponseEntity.ok(motocicletas);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al obtener motocicletas: " + e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> crearMotocicleta(@RequestBody Motocicleta motocicleta) {
        try {
            Motocicleta nuevo = motocicletaService.saveMotocicleta(motocicleta);
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al crear motocicleta: " + e.getMessage());
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> actualizarMotocicleta(@PathVariable Long id, @RequestBody Motocicleta motocicleta) {
        try {
            Motocicleta actualizado = motocicletaService.updateMotocicleta(id, motocicleta);
            return ResponseEntity.ok(actualizado);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("Error: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error inesperado: " + e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> eliminarMotocicleta(@PathVariable Long id){
        try {
            motocicletaService.deleteMotocicleta(id);
            return ResponseEntity.ok("Motocicleta eliminado correctamente");
        } catch (EmptyResultDataAccessException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No se encontro el motocicleta con el id: " + id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al eliminar motocicleta: " + e.getMessage());
        }
    }


}
