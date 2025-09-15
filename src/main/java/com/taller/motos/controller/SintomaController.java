package com.taller.motos.controller;

import com.taller.motos.entity.Sintoma;
import com.taller.motos.service.SintomaService;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/sintomas")
public class SintomaController {
    
    private final SintomaService sintomaService;

    public SintomaController(SintomaService sintomaService) {
        this.sintomaService = sintomaService;
    }

    @GetMapping()
    public ResponseEntity<?> getSintomas() {
        try {
            List<Sintoma> sintomas = sintomaService.getAllSintomas();
            return ResponseEntity.ok(sintomas);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al  sintomas: " + e.getMessage());
        }
    }

    @PostMapping()
    public ResponseEntity<?> crearSintoma(@RequestBody Sintoma sintoma) {
        try {
            Sintoma nuevo = sintomaService.saveSintoma(sintoma);
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al  sintoma: " + e.getMessage());
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> actualizarSintoma(@PathVariable Long id, @RequestBody Sintoma sintoma) {
        try {
            Sintoma actualizado = sintomaService.updateSintoma(id, sintoma);
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
    public ResponseEntity<?> eliminarSintoma(@PathVariable Long id){
        try {
            sintomaService.deleteSintoma(id);
            return ResponseEntity.ok("Usuario eliminado correctamente");
        } catch (EmptyResultDataAccessException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No se encontro el usuario con el id: " + id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al eliminar usuario: " + e.getMessage());
        }
    }
    
    
}
