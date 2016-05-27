package at.fh.swenga.f4u.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.f4u.model.FinanceModel;

@Repository
@Transactional
public interface FinanceRepository extends JpaRepository<FinanceModel, Integer> {
	
	public List<FinanceModel> findByNotes(String notes);
	
	public List<FinanceModel> findByCategorieName(String companyName);
}