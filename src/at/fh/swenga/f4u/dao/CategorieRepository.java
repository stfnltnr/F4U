package at.fh.swenga.f4u.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import at.fh.swenga.f4u.model.CategorieModel;


@Repository
public interface CategorieRepository extends JpaRepository<CategorieModel, Integer> {

}
