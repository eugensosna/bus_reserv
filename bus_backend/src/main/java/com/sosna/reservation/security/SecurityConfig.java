package com.sosna.reservation.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;

import com.sosna.reservation.services.CustomUserDetailsService;

@Configuration
public class SecurityConfig {
	@Autowired
	private JWTEntryPoint jwtEntryPoint;
	@Autowired
	private CustomUserDetailsService userDetailsService;
	@Autowired
	private JwtAuthFilter jwtAuthFilter;

	@SuppressWarnings({ "removal", "deprecation" })
	@Bean
	SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {

		http.csrf((csrf) -> csrf.disable())// .cors(withDefaults())
				.sessionManagement(
						(sessionManagement) -> sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
				.authorizeHttpRequests((authorizeHttpRequests) -> authorizeHttpRequests
						.requestMatchers(HttpMethod.POST, "/login").permitAll())
				.authorizeHttpRequests((authorizeHttpRequests) -> authorizeHttpRequests
						.requestMatchers(HttpMethod.POST, "/api/reservation/add").permitAll())
				.authorizeHttpRequests(
						(authorizeHttpRequests) -> authorizeHttpRequests.requestMatchers(("/api/auth/**")).permitAll())
				.authorizeHttpRequests((authorizeHttpRequests) -> authorizeHttpRequests
						.requestMatchers(HttpMethod.POST, "/api/bus/add", "api/schedule/add", "api/route/add")
						.hasRole("ADMIN").anyRequest().authenticated())
				
				.addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)
				.exceptionHandling((exceptionHandling) -> exceptionHandling.authenticationEntryPoint(jwtEntryPoint));
		http.addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);
		http.formLogin(formLogin -> formLogin.loginPage("/login").permitAll());
		http.logout((logout) -> logout.permitAll());
		//http.authorizeRequests((authz)-> authz.)

		return http.build();
	}
	
	@Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration)
            throws Exception {
        return configuration.getAuthenticationManager();
    }

}
