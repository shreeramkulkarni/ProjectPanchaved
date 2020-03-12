package com.panchaved.repository;

import org.springframework.data.repository.CrudRepository;

import com.panchaved.entity.PatientTreatment;

public interface PatientTreatmentRepo extends CrudRepository<PatientTreatment, Integer>{

}
