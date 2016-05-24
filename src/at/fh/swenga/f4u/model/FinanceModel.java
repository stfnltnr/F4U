package at.fh.swenga.f4u.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;

public class FinanceModel implements java.io.Serializable {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private boolean incoming;
	private boolean outgoing;
	
	@NotNull(message = "{0} is required")
	private Date bookDate;
	
	@NotNull(message = "{0} is required")
	private double value;
	
	private String notes;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	FinanceModel finance;
	
	@Version
	long version;
	
	public FinanceModel() {
	}
	
	public FinanceModel(int id, boolean incoming, boolean outgoing, Date bookDate, double value, String notes) {
		super();
		this.id = id;
		this.incoming = incoming;
		this.outgoing = outgoing;
		this.bookDate = bookDate;
		this.value = value;
		this.notes = notes;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isIncoming() {
		return incoming;
	}

	public void setIncoming(boolean incoming) {
		this.incoming = incoming;
	}

	public boolean isOutgoing() {
		return outgoing;
	}

	public void setOutgoing(boolean outgoing) {
		this.outgoing = outgoing;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
