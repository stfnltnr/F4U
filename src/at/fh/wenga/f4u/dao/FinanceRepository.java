package at.fh.wenga.f4u.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import at.fh.swenga.f4u.model.FinanceModel;

@Repository
public interface FinanceRepository extends JpaRepository<FinanceModel, Integer> {
}