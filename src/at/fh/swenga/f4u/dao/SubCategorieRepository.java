
package at.fh.swenga.f4u.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.f4u.model.FinanceModel;
import at.fh.swenga.f4u.model.SubCategorieModel;

@Repository
@Transactional
public interface SubCategorieRepository  extends JpaRepository<SubCategorieModel, Integer>{
	
	public List<SubCategorieModel> findByUser_username(String username);
}
