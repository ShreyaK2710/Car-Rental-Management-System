package com.infosys.carRentalSystem.dao;

import java.util.List;

import com.infosys.carRentalSystem.bean.Car;

public interface CarDao {
	public void save(Car car);

	public Car findById(String id);

	public List<Car> findAll();

	public void deleteCarById(String id);

	public List<Car> getAvailableCars();
}