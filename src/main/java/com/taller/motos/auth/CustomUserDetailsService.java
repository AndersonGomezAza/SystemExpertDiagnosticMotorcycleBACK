package com.taller.motos.auth;

import com.taller.motos.entity.Usuario;
import com.taller.motos.repository.UsuarioRepository;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UsuarioRepository usuarioRepository;

    public CustomUserDetailsService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado: " + email));

        // Convertimos los roles de tu entidad a authorities de Spring Security
        Set<GrantedAuthority> authorities = usuario.getRol().stream()
                .map(rol -> new SimpleGrantedAuthority("ROLE_" + rol.getNombre())) // asumiendo que tu entidad Rol tiene un campo `nombre`
                .collect(Collectors.toSet());

        return org.springframework.security.core.userdetails.User.builder()
                .username(usuario.getEmail())                // login con email
                .password(usuario.getPassword_hash())        // ⚡ usa el hash
                .authorities(authorities)                    // roles desde BD
                .build();
    }
}
