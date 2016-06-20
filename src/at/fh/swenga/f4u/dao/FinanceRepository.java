package at.fh.swenga.f4u.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.f4u.model.FinanceModel;

@Repository
@Transactional
public interface FinanceRepository extends JpaRepository<FinanceModel, Integer> {
	
	public List<FinanceModel> findByNotesIgnoreCaseContaining(String notes);
	
	public List<FinanceModel> findByValue(double value);
	
//	public List<FinanceModel> findByValueBetween(double value, double value);
	
	public List<FinanceModel> findByValueGreaterThanEqual(double value);
	
	public List<FinanceModel> findByValueLessThanEqual(double value);
	
	@Query("select f from FinanceModel f where f.payment = :payment")
	public List<FinanceModel> findIncome(@Param("payment")boolean payment);
	
	@Query("select f from FinanceModel f where f.payment = :payment")
	public List<FinanceModel> findOutcome(@Param("payment")boolean payment);
	
	public List<FinanceModel> findByBookDate(Date bookDate);
	
	public List<FinanceModel> findByCategorieName(String categorieName);
	
	public List<FinanceModel> findByUser_Username(String username);
	
	// for deleting subcategoriesentries in finances when a subcategorie is removed;
	public List<FinanceModel> findBySubcategorieId (Integer id);

	public List<FinanceModel> findByCategorieId(Integer id);


}