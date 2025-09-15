package com.taller.motos.controller;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Causa;
import com.taller.motos.service.CausaService;


@RestController
@RequestMapping("/causas")
public class CausaController {
    
    private final CausaService causaService;

    public CausaController (CausaService causaService){
        this.causaService = causaService;
    }

    @GetMapping
    public ResponseEntity<?> getCausas() {
        try {
            List<Causa> causas = causaService.getAllCausas();
            return ResponseEntity.ok(causas);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error causas" + e.getMessage());
        }
    }

    @PostMapping()
    public ResponseEntity<?> crearCausa(@RequestBody Causa causa) {
        try {
            Causa nuevo = causaService.saveCausa(causa);
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al  causa: " + e.getMessage());
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> actualizarCausa(@PathVariable Long id, @RequestBody Causa causa) {
        try {
            Causa actualizado = causaService.updateCausa(id, causa);
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
    public ResponseEntity<?> eliminarCausa(@PathVariable Long id){
        try {
            causaService.deleteCausa(id);
            return ResponseEntity.ok("Usuario eliminado correctamente");
        } catch (EmptyResultDataAccessException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No se encontro el usuario con el id: " + id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al eliminar usuario: " + e.getMessage());
        }
    }
    
}
