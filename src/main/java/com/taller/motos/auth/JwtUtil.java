package com.taller.motos.auth;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;

import java.security.Key;
import java.nio.charset.StandardCharsets;
import java.util.Date;

public class JwtUtil {

    // 🔒 Clave secreta fija (cambia esto por algo seguro y largo en producción)
    private static final String SECRET_STRING = "MiClaveSecretaMuySegura1234567890"; 
    private static final Key SECRET_KEY = Keys.hmacShaKeyFor(SECRET_STRING.getBytes(StandardCharsets.UTF_8));

    // Tiempo de expiración: 15 minutos
    private static final long EXPIRATION_TIME = 1000 * 60 * 15;

    // Genera un JWT para un username dado
    public static String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SECRET_KEY, SignatureAlgorithm.HS256)
                .compact();
    }

    // Extrae el username del JWT
    public static String extractUsername(String token) {
        try {
            Claims claims = Jwts.parserBuilder()
                    .setSigningKey(SECRET_KEY)
                    .build()
                    .parseClaimsJws(token)
                    .getBody();
            return claims.getSubject();
        } catch (ExpiredJwtException e) {
            System.out.println("El token ha expirado");
            return null;
        } catch (Exception e) {
            System.out.println("Token inválido: " + e.getMessage());
            return null;
        }
    }

    // Verifica si el token es válido y pertenece al username
    public static boolean isTokenValid(String token, String username) {
        String tokenUsername = extractUsername(token);
        return tokenUsername != null && tokenUsername.equals(username) && !isTokenExpired(token);
    }

    // Verifica si el token ha expirado
    private static boolean isTokenExpired(String token) {
        try {
            Date expiration = Jwts.parserBuilder()
                    .setSigningKey(SECRET_KEY)
                    .build()
                    .parseClaimsJws(token)
                    .getBody()
                    .getExpiration();
            return expiration.before(new Date());
        } catch (ExpiredJwtException e) {
            return true;
        } catch (Exception e) {
            return true;
        }
    }
}
