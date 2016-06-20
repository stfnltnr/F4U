package at.fh.swenga.f4u.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import at.fh.swenga.f4u.model.UserRole;

@Entity
@Table(name = "users")
public class UserModel implements java.io.Serializable {
	private static final long serialVersionUID = 8198173157518983615L;
	
	@Id
	@Column(name = "username", unique = true, nullable = false, length = 45)
	private String username;
	
	@Column(name = "password")
	private String bCryptedPassword;
	
	@Column(name = "enabled", nullable = false)
	private boolean enabled;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<UserRole> userRole = new HashSet<UserRole>(0);
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private Set<FinanceModel> finances;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY, cascade = {CascadeType.MERGE,CascadeType.REFRESH,CascadeType.DETACH})
	private Set<SubCategorieModel> subcategories;
	
//	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
//	private Set<PermanentModel> permanents;

	public UserModel() {
		super();
	}
	
	public UserModel(String username, String password, boolean enabled) {
		super();
		this.username = username;
		setBCryptedPassword(password);
		this.enabled = enabled;
	}

	public UserModel(String username, String password, boolean enabled,
			Set<UserRole> userRole) {
		this.username = username;
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
	
	public void setPassword(String password) {
		setBCryptedPassword(new BCryptPasswordEncoder().encode(password));
	}

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

	public Set<FinanceModel> getFinances() {
		return finances;
	}

	public void setFinances(Set<FinanceModel> finances) {
		this.finances = finances;
	}

	public Set<SubCategorieModel> getSubcategories() {
		return subcategories;
	}

	public void setSubcategories(Set<SubCategorieModel> subcategories) {
		this.subcategories = subcategories;
	}
	
}
