package com.panchaved.repository;

import java.util.List;
 
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.panchaved.entity.PatientBill;
@Repository
public interface PatientBillRepo extends CrudRepository<PatientBill, Integer> {
List<PatientBill> findByPatientId(int patientId);
}
