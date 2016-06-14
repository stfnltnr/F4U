package at.fh.swenga.f4u.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="Categorie")
public class CategorieModel implements java.io.Serializable {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotNull(message = "{0} is required")
	private String name;
	
	private String description;
	private String icon;
	private String color;
	private Integer maincat;
	
	@OneToMany(mappedBy="categorie", fetch=FetchType.LAZY)
	private Set<FinanceModel> finances;
	
	@Version
	long version;
	
	public CategorieModel() {
	}
	
	public CategorieModel(String name, String description, String icon, String color,Integer maincat) {
		super();
		this.name = name;
		this.description = description;
		this.icon = icon;
		this.color = color;
		this.maincat = maincat;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;

	}

	public Integer getMaincat() {
		return maincat;
	}

	public void setMaincat(Integer maincat) {
		this.maincat = maincat;
	}

	public Set<FinanceModel> getFinances() {
		return finances;
	}

	public void setFinances(Set<FinanceModel> finances) {
		this.finances = finances;
	}
}
