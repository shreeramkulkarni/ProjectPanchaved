package com.panchaved.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.panchaved.entity.Prescription;
@Repository
public interface PrescriptionRepo extends CrudRepository<Prescription, Integer> {
	List<Prescription> findByPatientId(int patientId);
}
