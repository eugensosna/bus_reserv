package com.sosna.reservation.security;

import java.security.Key;
import java.util.Date;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.sosna.reservation.models.ReservationApiException;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.UnsupportedJwtException;
import io.jsonwebtoken.io.Decoders;
import org.springframework.beans.factory.annotation.Value;
//import lombok.Value;

@Component
@Configuration
public class JwtTokenProvider {
	static final long EXPIRATIONTIME = 86400000;

	@Value("${app.jwt-secret}")
	private String jwtSecretKey;
	@Value("${app-jwt-expiration-milliseconds}")
	private Long expiration;
	static final Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);

	public String generateToken(Authentication authentication) {
		String userName = authentication.getName();
		Date expireDate = new Date(new Date().getTime() + EXPIRATIONTIME);
		return Jwts.builder().setSubject(userName).setIssuedAt(new Date()).setExpiration(expireDate).signWith(key())
				.compact();
	}

	public String getUserName(String token) {
		Claims claims = Jwts.parserBuilder().setSigningKey(key()).build().parseClaimsJws(token).getBody();
		return claims.getSubject();
	}

	public boolean validateToken(String token) {
		try {
			Jwts.parserBuilder().setSigningKey(key()).build().parse(token);
			return true;
		} catch (MalformedJwtException e) {
			throw new ReservationApiException(HttpStatus.BAD_REQUEST, "Invalid Token");
		} catch (ExpiredJwtException e) {
			throw new ReservationApiException(HttpStatus.BAD_REQUEST, "Token Expired");
		} catch (UnsupportedJwtException e) {
			throw new ReservationApiException(HttpStatus.BAD_REQUEST, "Unsupported token");
		} catch (IllegalArgumentException e) {
			throw new ReservationApiException(HttpStatus.BAD_REQUEST, "Invalid argument");
		}
	}

	private Key key() {
		return Keys.hmacShaKeyFor(Decoders.BASE64.decode(jwtSecretKey));
	}

}
