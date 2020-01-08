
package adil.java.schoolmaven.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import adil.java.schoolmaven.entity.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByLogin(String username);
    
}