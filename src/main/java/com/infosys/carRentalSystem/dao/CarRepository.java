package com.infosys.carRentalSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.carRentalSystem.bean.Car;

public interface CarRepository extends JpaRepository<Car,String>{
   @Query("select a from Car a where available=true")
   public List<Car> getAvailableCars();
}