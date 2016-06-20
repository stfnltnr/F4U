package at.fh.swenga.f4u.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class UserModel implements java.io.Serializable {
	private static final long serialVersionUID = 8198173157518983615L;
	
	private String username;
	private String password;
	private boolean enabled;
	private String userRole;
//	private Set<UserRole> userRole = new HashSet<UserRole>(0);
	
	
	private Set<FinanceModel> finances;
	
//	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
//	private Set<PermanentModel> permanents;

	public UserModel() {
	}
	
	public UserModel(String username, String password, boolean enabled,  String userRole) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.userRole = userRole;
	}

//	public UserModel(String username, String password, boolean enabled,
//			Set<UserRole> userRole) {
//		this.username = username;
//		this.password = password;
//		this.enabled = enabled;
//		this.userRole = userRole;
//	}

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
	@Id
	@Column(name = "username", unique = true, nullable = false, length = 45)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 60)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "enabled", nullable=true)
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	public Set<FinanceModel> getFinances() {
		return finances;
	}

	public void setFinances(Set<FinanceModel> finances) {
		this.finances = finances;
	}
}
