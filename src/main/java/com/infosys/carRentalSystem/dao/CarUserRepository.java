package com.infosys.carRentalSystem.dao;


import com.infosys.carRentalSystem.bean.CarUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarUserRepository extends JpaRepository<CarUser, String> {

}