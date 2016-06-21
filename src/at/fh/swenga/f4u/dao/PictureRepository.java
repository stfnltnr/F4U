package at.fh.swenga.f4u.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import at.fh.swenga.f4u.model.PictureModel;

public interface PictureRepository extends JpaRepository<PictureModel, Integer> {

}