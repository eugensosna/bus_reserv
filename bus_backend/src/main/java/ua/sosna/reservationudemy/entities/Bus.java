package ua.sosna.reservationudemy.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Bus {
	private Long busId;
	
	private String busName;
	
	private String busType;
	
	private int totalSeat;
	
	private String busNumer;

}
