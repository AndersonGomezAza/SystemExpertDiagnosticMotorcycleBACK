package com.taller.motos.auth;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import com.taller.motos.entity.Rol;
import com.taller.motos.entity.Usuario;
import com.taller.motos.repository.UsuarioRepository;


@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder passwordEncoder; // ✅ inyectamos el encoder
    private final UsuarioRepository usuarioRepository;

    public AuthController(AuthenticationManager authenticationManager, PasswordEncoder passwordEncoder, UsuarioRepository usuarioRepository ) {
        this.authenticationManager = authenticationManager;
        this.passwordEncoder = passwordEncoder;
        this.usuarioRepository = usuarioRepository;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        String email = loginRequest.getEmail();
        String password = loginRequest.getPassword();
        try {
            
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(email, password)
            );

            // 🔥 Buscar usuario en la BD
            Usuario usuario = usuarioRepository.findByEmail(email)
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

            // 🔥 Generar token
            String token = JwtUtil.generateToken(authentication.getName());

            // 🔥 Datos del usuario autenticado
            Map<String, Object> usuarioData = new HashMap<>();
            usuarioData.put("id", usuario.getId_usuario());
            usuarioData.put("nombre", usuario.getNombre_usuario());
            usuarioData.put("email", usuario.getEmail());
            usuarioData.put("telefono", usuario.getTelefono());
            usuarioData.put("direccion", usuario.getDireccion());
            usuarioData.put("fechaRegistro", usuario.getFecha_registro());
            usuarioData.put("ultimoLogin", usuario.getUltimo_login());
            usuarioData.put("roles", usuario.getRol().stream().map(Rol::getNombre).toList());

            // 🔥 Respuesta final
            Map<String, Object> response = new HashMap<>();
            response.put("mensaje", "✅ Login exitoso");
            response.put("token", token);
            response.put("usuario", usuarioData);

            // 🔥 Actualizar último login
            usuario.setUltimo_login(LocalDateTime.now());
            usuarioRepository.save(usuario);

            return ResponseEntity.ok(response);

        } catch (BadCredentialsException e) {
            Map<String, String> response = new HashMap<>();
            response.put("titulo", "❌ Error de autenticación");
            response.put("mensaje", "Credenciales inválidas. Verifica tu usuario y contraseña.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);

        } catch (LockedException e) {
            Map<String, String> response = new HashMap<>();
            response.put("titulo", "❌ Cuenta bloqueada");
            response.put("mensaje", "Tu cuenta ha sido bloqueada. Contacta al administrador.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(response);

        } catch (Exception e) {
            Map<String, String> response = new HashMap<>();
            response.put("titulo", "❌ Error inesperado");
            response.put("mensaje", "Ocurrió un error inesperado. Intenta más tarde.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    // Endpoint temporal para generar hash
    @PostMapping("/hash")
    public String generateHash(@RequestParam String rawPassword) {
        return passwordEncoder.encode(rawPassword);
    }
}