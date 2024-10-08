package com.sosna.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class MyfirstflutterprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyfirstflutterprojectApplication.class, args);
	}
	
	@GetMapping("/hello/{name}")
	public String helloWorld(@PathVariable("name") String name) {
		return "Hello "+name;
	}
	
	@GetMapping("/player")
	public Player getPlayer() {
		return new Player("Loinell Messi", 35);
	}
	
	@GetMapping("/players")
	public List<Player> getPlayers(){
		final List<Player> players = new ArrayList<Player>();
		players.add(getPlayer());
		return players;
	}

}
