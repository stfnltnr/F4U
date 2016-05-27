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
//public class ReportModel implements java.io.Serializable {
//	
//	@Id
//	@Column(name="id")
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	private int id;
//	
//	@NotNull(message = "{0} is required")
//	private String name;
//	
//	@NotNull(message = "{0} is required")
//	private Date dayOfCreation;
//	
//	public ReportModel() {
//	}
//	
//	public ReportModel(int id, String name, Date dayOfCreation) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.dayOfCreation = dayOfCreation;
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
//	public Date getDayOfCreation() {
//		return dayOfCreation;
//	}
//
//	public void setDayOfCreation(Date dayOfCreation) {
//		this.dayOfCreation = dayOfCreation;
//	}
//
//}
