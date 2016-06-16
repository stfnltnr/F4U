package at.fh.swenga.f4u.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.f4u.model.UserModel;

@Repository
public interface UserRepository extends JpaRepository<UserModel, Integer> {
	
	@Transactional
	public UserModel findFirstByLastName(String lastName);
	
	public List<UserModel> findByUsername(String username);
	
}
