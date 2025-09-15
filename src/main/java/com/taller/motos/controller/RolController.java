package com.taller.motos.controller;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Rol;
import com.taller.motos.service.RolService;

@RestController
@RequestMapping("/roles")
public class RolController {
    
    private final RolService rolService;

    public RolController(RolService rolService) {
        this.rolService = rolService;
    }

    @GetMapping
    public ResponseEntity<?> getRols() {
        try {
            List<Rol> rols = rolService.getAllRols();
            return ResponseEntity.ok(rols);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error rols" + e.getMessage());
        }
    }

    @PostMapping()
    public ResponseEntity<?> crearRol(@RequestBody Rol rol) {
        try {
            Rol nuevo = rolService.saveRol(rol);
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al  rol: " + e.getMessage());
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<?> actualizarRol(@PathVariable Long id, @RequestBody Rol rol) {
        try {
            Rol actualizado = rolService.updateRol(id, rol);
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
    public ResponseEntity<?> eliminarRol(@PathVariable Long id){
        try {
            rolService.deleteRol(id);
            return ResponseEntity.ok("Usuario eliminado correctamente");
        } catch (EmptyResultDataAccessException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No se encontro el usuario con el id: " + id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al eliminar usuario: " + e.getMessage());
        }
    }
}
