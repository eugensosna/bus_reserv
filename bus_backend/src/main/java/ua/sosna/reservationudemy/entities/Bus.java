package ua.sosna.reservationudemy.entities;

import jakarta.annotation.Generated;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Bus {
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	private Long busId;
	
	private String busName;
	
	private String busType;
	
	private int totalSeat;
	
	@Column(unique = true)
	private String busNumer;

}
