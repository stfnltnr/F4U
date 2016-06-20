package at.fh.swenga.f4u.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.f4u.model.FinanceModel;
import at.fh.swenga.f4u.model.UserModel;

@Repository
@Transactional
public interface FinanceRepository extends JpaRepository<FinanceModel, Integer> {
	
	public List<FinanceModel> findByUser_Username(String username);
	
	public List<FinanceModel> findByUser_UsernameAndNotesIgnoreCaseContaining(String username, String notes);
	
	public List<FinanceModel> findByUser_UsernameAndValue(String username,double value);
	
//	public List<FinanceModel> findByValueBetween(double value, double value);
	
	public List<FinanceModel> findByUser_UsernameAndValueGreaterThanEqual(String username,double value);
	
	public List<FinanceModel> findByUser_UsernameAndValueLessThanEqual(String username,double value);
	
	@Query("select f from FinanceModel f where f.user = :user AND f.payment = :payment")
	public List<FinanceModel> findByUser_UsernameAndIncome(@Param("user")UserModel username,@Param("payment")boolean payment);
	
	@Query("select f from FinanceModel f where f.user = :user AND f.payment = :payment")
	public List<FinanceModel> findByUser_UsernameAndOutcome(@Param("user")UserModel username,@Param("payment")boolean payment);
		
	public List<FinanceModel> findByUser_UsernameAndBookDate(String username,Date bookDate);
	
	public List<FinanceModel> findByUser_UsernameAndCategorieName(String username,String categorieName);
	
	public List<FinanceModel> findByUser_UsernameOrderByBookDate(String username);
	
	// for deleting subcategoriesentries in finances when a subcategorie is removed;
	public List<FinanceModel> findByUser_UsernameAndSubcategorieId (String username,int id);
	
	public List<FinanceModel> findByUser_UsernameAndCategorieId (String username,int id);


}