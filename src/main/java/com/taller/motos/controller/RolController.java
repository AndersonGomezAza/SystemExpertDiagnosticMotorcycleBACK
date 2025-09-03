package com.taller.motos.controller;

import java.util.List;

import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Rol;
import com.taller.motos.service.RolService;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/roles")
public class RolController {
    
    private final RolService rolService;

    public RolController(RolService rolService) {
        this.rolService = rolService;
    }

    @GetMapping
    public List<Rol> getRol() {
        return rolService.getAllRols();
    }

    @PostMapping
    public Rol crearRol(@RequestBody Rol rol) {
        return rolService.saveRol(rol);
    }

    @PatchMapping("/{id}")
    public Rol actualizarRol(@PathVariable Long id, @RequestBody Rol rol) {
        return rolService.updateRol(id, rol);
    }
}
