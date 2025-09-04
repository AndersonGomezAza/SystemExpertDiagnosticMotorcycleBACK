package com.taller.motos.controller;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Regla;
import com.taller.motos.service.ReglaService;

@CrossOrigin(origins = "https://localhost:4200")
@RestController
@RequestMapping("/regla")
public class ReglaController {
    private final ReglaService reglaService;

    public ReglaController(ReglaService reglaService) {
        this.reglaService = reglaService;
    }

    @GetMapping
    public ResponseEntity<?> getReglas() {
        try {
            List<Regla> reglas = reglaService.getAllReglas();
            return ResponseEntity.ok(reglas);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error reglas" + e.getMessage());
        }
    }

    @PostMapping()
    public ResponseEntity<?> crearRegla(@RequestBody Regla regla) {
        try {
            Regla nuevo = reglaService.saveRegla(regla);
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al  regla: " + e.getMessage());
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> actualizarRegla(@PathVariable Long id, @RequestBody Regla regla) {
        try {
            Regla actualizado = reglaService.updateRegla(id, regla);
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
    public ResponseEntity<?> eliminarRegla(@PathVariable Long id){
        try {
            reglaService.deleteRegla(id);
            return ResponseEntity.ok("Regla eliminado correctamente");
        } catch (EmptyResultDataAccessException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No se encontro la Regla con el id: " + id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al eliminar Regla: " + e.getMessage());
        }
    }
}
