package at.fh.swenga.f4u.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.f4u.model.UserModel;
import at.fh.swenga.f4u.model.UserRole;


@Repository
@Transactional
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
		
	List<UserModel> removeByUser(UserModel user);
	
	List<UserRole> findByUser(UserModel user);
		
}
