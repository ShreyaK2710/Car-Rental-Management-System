package com.infosys.carRentalSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.infosys.carRentalSystem.bean.Customer;

public interface CustomerRepository extends JpaRepository<Customer, String> {

    // Fix the query to use named parameters
    @Query("select c.status from Customer c where c.username = :username")
    public Boolean getCustomerStatusByUsername(@Param("username") String username);

    @Query("select c.expiryDate from Customer c where c.username = :username")
    public String getLicenceExpiryDate(@Param("username") String username);

}
