package com.taller.motos.controller;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Solucion;
import com.taller.motos.service.SolucionService;

@RestController
@RequestMapping("/soluciones")
public class SolucionController {
    
    private final SolucionService solucionService;

    public SolucionController (SolucionService solucionService){
        this.solucionService = solucionService;
    }

    @GetMapping
    public ResponseEntity<?> getSoluciones(){
        try {
            List<Solucion> soluciones = solucionService.getAllSoluciones();
            return ResponseEntity.ok(soluciones);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error en el servicio Solucion: " + e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> crearSolucion(@RequestBody Solucion solucion) {
        try {
            Solucion nuevo = solucionService.saveSolucion(solucion);
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al  solucion: " + e.getMessage());
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> actualizarSolucion(@PathVariable Long id, @RequestBody Solucion solucion) {
        try {
            Solucion actualizado = solucionService.updateSolucion(id, solucion);
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
    public ResponseEntity<?> eliminarSolucion(@PathVariable Long id){
        try {
            solucionService.deleteSolucion(id);
            return ResponseEntity.ok("Usuario eliminado correctamente");
        } catch (EmptyResultDataAccessException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No se encontro el usuario con el id: " + id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al eliminar usuario: " + e.getMessage());
        }
    }
    
}
