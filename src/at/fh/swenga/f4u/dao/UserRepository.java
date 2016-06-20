package at.fh.swenga.f4u.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.f4u.model.UserModel;

@Repository
@Transactional
public interface UserRepository extends JpaRepository<UserModel, Integer> {
		
	public List<UserModel> findByUsernameOrderByUsernameAsc(String username);
	
	public UserModel findByUsername(String username);
		
}
