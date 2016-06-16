package at.fh.swenga.f4u.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import at.fh.swenga.f4u.model.SubCategorieModel;

@Repository
public interface SubCategorieRepository  extends JpaRepository<SubCategorieModel, Integer>{

}
