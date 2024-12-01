package com.infosys.carRentalSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.infosys.carRentalSystem.bean.CarBooking;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Repository
public class BookingDao {

    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void save(CarBooking booking) {
        String sql = "INSERT INTO bookings (car_number, username, from_date, to_date, advance_payment) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, booking.getCarNumber(), booking.getUsername(), booking.getFromDate(),
                booking.getToDate(), booking.getAdvancePayment());
    }

    public String generateBookingId() {
        return "BOOK-" + System.currentTimeMillis();  
    }

    public List<CarBooking> findByUsername(String username) {
        return entityManager.createQuery("SELECT b FROM CarBooking b WHERE b.username = :username", CarBooking.class)
                .setParameter("username", username)
                .getResultList();
    }

    @Transactional
    public void deleteById(Long id) {
        CarBooking booking = entityManager.find(CarBooking.class, id);
        if (booking != null) {
            entityManager.remove(booking);
        }
    }

    public CarBooking findById(Long id) {
        return entityManager.find(CarBooking.class, id);
    }

}
