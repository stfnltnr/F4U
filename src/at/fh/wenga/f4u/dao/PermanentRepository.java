package at.fh.wenga.f4u.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import at.fh.swenga.f4u.model.PermanentModel;

@Repository
public interface PermanentRepository extends JpaRepository<PermanentModel, Integer> {
}
