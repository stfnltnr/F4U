package at.fh.swenga.f4u.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Finance")
public class FinanceModel implements java.io.Serializable {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private boolean payment;
	
//	@Temporal(TemporalType.DATE)
//	@NotNull(message = "{0} is required")
//	private Date bookDate;
	
	@NotNull(message = "{0} is required")
	private double value;
	
	private String notes;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	CategorieModel categorie;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	SubcategorieModel subcategorie;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	UserModel user;
	
	public FinanceModel() {
	}
	
	public FinanceModel(boolean payment, double value, String notes) {
		super();
		this.payment = payment;
//		this.bookDate = bookDate;
		this.value = value;
		this.notes = notes;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isPayment() {
		return payment;
	}

	public void setPayment(boolean payment) {
		this.payment = payment;
	}

//
//	public Date getBookDate() {
//		return bookDate;
//	}
//
//	public void setBookDate(Date bookDate) {
//		this.bookDate = bookDate;
//	}

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

	public CategorieModel getCategorie() {
		return categorie;
	}

	public void setCategorie(CategorieModel categorie) {
		this.categorie = categorie;
	}

	public SubcategorieModel getSubcategorie() {
		return subcategorie;
	}

	public void setSubcategorie(SubcategorieModel subcategorie) {
		this.subcategorie = subcategorie;
	}

	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}
	
}
