package at.fh.swenga.f4u.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
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
	
	public List<FinanceModel> findByCategorieName(String companyName);
	
	public List<FinanceModel> findByUserLastName (String lastName);
	
	// for deleting subcategoriesentries in finances when a subcategorie is removed;
	public List<FinanceModel> findBySubcategorieId (Integer id);

}