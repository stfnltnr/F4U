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
//public class UserModel implements java.io.Serializable{
//	
//	@Id
//	@Column(name="id")
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	private int id;
//	
//	@NotNull(message = "{0} is required")
//	private String firstName;
//	
//	@NotNull(message = "{0} is required")
//	private String lastName;
//	
//	@NotNull(message = "{0} is required")
//	private String address;
//	
//	@NotNull(message = "{0} is required")
//	private int postCode;
//	
//	@NotNull(message = "{0} is required")
//	private String place;
//	
//	private String phone;
//	
//	@NotNull(message = "{0} is required")
//	private String email;
//	
//	@NotNull(message = "{0} is required")
//	private Date dayOfBirth;
//	
//	public UserModel() {
//	}
//	
//	public UserModel(int id, String firstName, String lastName, String address, int postCode, String phone, String email,
//			Date dayOfBirth) {
//		super();
//		this.id = id;
//		this.firstName = firstName;
//		this.lastName = lastName;
//		this.address = address;
//		this.postCode = postCode;
//		this.phone = phone;
//		this.email = email;
//		this.dayOfBirth = dayOfBirth;
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
//	public String getFirstName() {
//		return firstName;
//	}
//
//	public void setFirstName(String firstName) {
//		this.firstName = firstName;
//	}
//
//	public String getLastName() {
//		return lastName;
//	}
//
//	public void setLastName(String lastName) {
//		this.lastName = lastName;
//	}
//
//	public String getAddress() {
//		return address;
//	}
//
//	public void setAddress(String address) {
//		this.address = address;
//	}
//
//	public int getPostCode() {
//		return postCode;
//	}
//
//	public void setPostCode(int postCode) {
//		this.postCode = postCode;
//	}
//
//	public String getPlace() {
//		return place;
//	}
//
//	public void setPlace(String place) {
//		this.place = place;
//	}
//
//	public String getPhone() {
//		return phone;
//	}
//
//	public void setPhone(String phone) {
//		this.phone = phone;
//	}
//
//	public String getEmail() {
//		return email;
//	}
//
//	public void setEmail(String email) {
//		this.email = email;
//	}
//
//	public Date getDayOfBirth() {
//		return dayOfBirth;
//	}
//
//	public void setDayOfBirth(Date dayOfBirth) {
//		this.dayOfBirth = dayOfBirth;
//	}
//	
//}
