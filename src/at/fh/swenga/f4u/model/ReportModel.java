package at.fh.swenga.f4u.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

public class ReportModel implements java.io.Serializable {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotNull(message = "{0} is required")
	private String bezeichnung;
	
	@NotNull(message = "{0} is required")
	private Date dayOfCreation;
	
	public ReportModel() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBezeichnung() {
		return bezeichnung;
	}

	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}

	public Date getDayOfCreation() {
		return dayOfCreation;
	}

	public void setDayOfCreation(Date dayOfCreation) {
		this.dayOfCreation = dayOfCreation;
	}

}
