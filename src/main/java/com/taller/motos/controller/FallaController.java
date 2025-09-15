package com.taller.motos.controller;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Falla;
import com.taller.motos.service.FallaService;


@RestController
@RequestMapping("/fallas")
public class FallaController {
    
    private final FallaService fallaService;

    public FallaController(FallaService fallaService){
        this.fallaService = fallaService;
    }

    @GetMapping
    public ResponseEntity<?> getFallas() {
        try {
            List<Falla> fallas = fallaService.getAllFalla();
            return ResponseEntity.ok(fallas);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fallas" + e.getMessage());
        }
    }

    @PostMapping()
    public ResponseEntity<?> crearFalla(@RequestBody Falla falla) {
        try {
            Falla nuevo = fallaService.saveFalla(falla);
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al  falla: " + e.getMessage());
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> actualizarFalla(@PathVariable Long id, @RequestBody Falla falla) {
        try {
            Falla actualizado = fallaService.updateFalla(id, falla);
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
    public ResponseEntity<?> eliminarFalla(@PathVariable Long id){
        try {
            fallaService.deleteFalla(id);
            return ResponseEntity.ok("Usuario eliminado correctamente");
        } catch (EmptyResultDataAccessException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No se encontro el usuario con el id: " + id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al eliminar usuario: " + e.getMessage());
        }
    }
    
}
