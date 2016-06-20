package at.fh.swenga.f4u.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
<<<<<<< HEAD
=======

import at.fh.swenga.f4u.model.UserRole;
>>>>>>> branch 'master' of https://github.com/loete/F4U.git

@Entity
@Table(name = "users")
public class UserModel implements java.io.Serializable {
	private static final long serialVersionUID = 8198173157518983615L;
	
<<<<<<< HEAD
	private String username;
	private String password;
	private boolean enabled;
	private String userRole;
//	private Set<UserRole> userRole = new HashSet<UserRole>(0);
=======
	@Id
	@Column(name = "username", unique = true, nullable = false, length = 45)
	private String username;
>>>>>>> branch 'master' of https://github.com/loete/F4U.git
	
<<<<<<< HEAD
=======
	@Column(name = "password", nullable = false, length = 60)
	private String bCryptedPassword;
>>>>>>> branch 'master' of https://github.com/loete/F4U.git
	
<<<<<<< HEAD
=======
	@Column(name = "enabled", nullable = false)
	private boolean enabled;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<UserRole> userRole = new HashSet<UserRole>(0);
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
>>>>>>> branch 'master' of https://github.com/loete/F4U.git
	private Set<FinanceModel> finances;
	
//	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
//	private Set<PermanentModel> permanents;

	public UserModel() {
<<<<<<< HEAD
	}
	
	public UserModel(String username, String password, boolean enabled,  String userRole) {
=======
>>>>>>> branch 'master' of https://github.com/loete/F4U.git
		super();
<<<<<<< HEAD
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.userRole = userRole;
=======
>>>>>>> branch 'master' of https://github.com/loete/F4U.git
	}
<<<<<<< HEAD

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
=======
>>>>>>> branch 'master' of https://github.com/loete/F4U.git
	
<<<<<<< HEAD
	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
=======
	public UserModel(String username, String password, boolean enabled) {
		super();
		this.username = username;
		setBCryptedPassword(password);
		this.enabled = enabled;
	}

	public UserModel(String username, String password, boolean enabled,
			Set<UserRole> userRole) {
		this.username = username;
		//this.matchingPassword = matchingPassword;
		setBCryptedPassword(password);
		this.enabled = enabled;
		this.userRole = userRole;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setBCryptedPassword(String hackedPassword) {
		this.bCryptedPassword = hackedPassword;
	}
	
	public String getBCryptedPassword() {
		return bCryptedPassword;
	}

	@Column(name = "enabled", nullable=true)
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public Set<UserRole> getUserRole() {
		return userRole;
	}

	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}


>>>>>>> branch 'master' of https://github.com/loete/F4U.git
	public Set<FinanceModel> getFinances() {
		return finances;
	}

	public void setFinances(Set<FinanceModel> finances) {
		this.finances = finances;
	}
}
