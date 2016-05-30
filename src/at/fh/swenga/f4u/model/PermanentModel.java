//package at.fh.swenga.f4u.model;
//
//import java.util.Date;
//
//import javax.persistence.Column;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.validation.constraints.NotNull;
//
//public class PermanentModel implements java.io.Serializable {
//	
//	@Id
//	@Column(name = "id")
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	private int id;
//	
//	@NotNull(message = "{0} is required")
//	private String name;
//	
//	@NotNull(message = "{0} is required")
//	private double value;
//	
//	private boolean month;
//	
//	private boolean quarter;
//	
//	private boolean year;
//	
//	private Date duration;
//	
//	@NotNull(message = "{0} is required")
//	private Date begin;
//	
//	private String notes;
//	
//	public PermanentModel() {
//	}
//	
//	public PermanentModel(int id, String name, double value, boolean month, boolean quarter, boolean year, Date duration, Date begin, String notes) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.value = value;
//		this.month = month;
//		this.quarter = month;
//		this.year = year;
//		this.duration = duration;
//		this.begin = begin;
//		this.notes = notes;
//	}
//
//	public int getId() {
//		return id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}
//
//	public String getName() {
//		return name;
//	}
//
//	public void setName(String name) {
//		this.name = name;
//	}
//
//	public double getValue() {
//		return value;
//	}
//
//	public void setValue(double value) {
//		this.value = value;
//	}
//
//	public boolean isMonth() {
//		return month;
//	}
//
//	public void setMonth(boolean month) {
//		this.month = month;
//	}
//
//	public boolean isQuarter() {
//		return quarter;
//	}
//
//	public void setQuarter(boolean quarter) {
//		this.quarter = quarter;
//	}
//
//	public boolean isYear() {
//		return year;
//	}
//
//	public void setYear(boolean year) {
//		this.year = year;
//	}
//
//	public Date getDuration() {
//		return duration;
//	}
//	
//
//	public void setDuration(Date duration) {
//		this.duration = duration;
//	}
//
//	public Date getBegin() {
//		return begin;
//	}
//
//	public void setBegin(Date begin) {
//		this.begin = begin;
//	}
//
//	public String getNotes() {
//		return notes;
//	}
//
//	public void setNotes(String notes) {
//		this.notes = notes;
//	}
//
//}
