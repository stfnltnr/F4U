package at.fh.swenga.f4u.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "users")
public class UserModel implements java.io.Serializable {
	private static final long serialVersionUID = 8198173157518983615L;
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotNull(message = "{0} is required")
	private String firstName;
	
	@NotNull(message = "{0} is required")
	private String lastName;
	
	@NotNull(message = "{0} is required")
	private String address;
	
	@NotNull(message = "{0} is required")
	private int postCode;
	
	@NotNull(message = "{0} is required")
	private String place;
	
	private String phone;
	
	@NotNull(message = "{0} is required")
	private String email;

	
//	@NotNull(message = "{0} is required")
//	private Date dayOfBirth;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private Set<FinanceModel> finances;
	
//	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
//	private Set<PermanentModel> permanents;

	public UserModel() {
	}
	
	public UserModel(String firstName, String lastName, String address, int postCode, String place, String phone, String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.postCode = postCode;
		this.place = place;
		this.phone = phone;
		this.email = email;
//		this.dayOfBirth = dayOfBirth;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

//	public Date getDayOfBirth() {
//		return dayOfBirth;
//	}
//
//	public void setDayOfBirth(Date dayOfBirth) {
//		this.dayOfBirth = dayOfBirth;
//	}
	
	public Set<FinanceModel> getFinances() {
		return finances;
	}

	public void setFinances(Set<FinanceModel> finances) {
		this.finances = finances;
	}
}
