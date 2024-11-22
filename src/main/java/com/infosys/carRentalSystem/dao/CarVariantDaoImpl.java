package com.infosys.carRentalSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.carRentalSystem.bean.CarVariant;
@Service
@Repository
public  class CarVariantDaoImpl implements CarVariantDao{
  @Autowired
  private CarVariantRepository repository;
  
  @Override
  public void save(CarVariant carVariant) {
	  repository.save(carVariant);
  }
  
  @Override
  public String generateVariantId() {
	  int id=0;
		String val=repository.getLastId();
		if(val==null)
			id=10001;
		else {
			id=Integer.parseInt(val.substring(1));
			id++;
		}
		String newId="V"+id;  	
		return newId;
  }
  @Override
  public List<CarVariant> findAll(){
	  return repository.findAll();
  }
  @Override
  public void deleteVariantById(String id)
  {
	  repository.deleteById(id);
  }
  public CarVariant findById(String id) {
	  return repository.findById(id).get();
  }
  @Override
  public List<String> getAllVariantIds(){
  return repository.getAllvariantIds();
  }
}