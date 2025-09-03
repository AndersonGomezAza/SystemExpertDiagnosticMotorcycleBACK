package com.taller.motos.service;

import com.taller.motos.entity.Usuario;
import com.taller.motos.repository.UsuarioRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;

    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    public List<Usuario> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    public Usuario saveUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    public Usuario updateUsuario(Long id, Usuario usuario) {
        Optional<Usuario> usuarioExistente = usuarioRepository.findById(id);

        if (usuarioExistente.isPresent()) {
            Usuario u = usuarioExistente.get();

            if (usuario.getNombre_usuario() != null) {
                u.setNombre_usuario(usuario.getNombre_usuario());
            }
            if (usuario.getDireccion() != null) {
                u.setDireccion(usuario.getDireccion());
            }
            if (usuario.getEmail() != null) {
                u.setEmail(usuario.getEmail());
            }
            if (usuario.getFecha_registro() != null) {
                u.setFecha_registro(usuario.getFecha_registro());
            }
            if (usuario.getPassword_hash() != null) {
                u.setPassword_hash(usuario.getPassword_hash());
            }
            if (usuario.getRol() != null) {
                u.setRol(usuario.getRol());
            }
            if (usuario.getTelefono() != null) {
                u.setTelefono(usuario.getTelefono());
            }
            if (usuario.getUltimo_login() != null) {
                u.setUltimo_login(usuario.getUltimo_login());
            }
            
            return usuarioRepository.save(u);
        } else {
            throw new RuntimeException("Usuario no encontrado con id " + id);
        }
    }

    public void deleteUsuario(Long id){
        usuarioRepository.deleteById(id);
    }
}