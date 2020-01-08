
package adil.java.schoolmaven.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import adil.java.schoolmaven.entity.Student;

@Repository
public interface StudentRepository extends CrudRepository<Student, Long>{
	
}