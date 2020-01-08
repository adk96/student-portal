package adil.java.schoolmaven.service;

import adil.java.schoolmaven.entity.User;

import java.io.IOException;
import java.util.List;
import java.util.Optional;


public interface UserService {
    User saveUser(User user);
    List<User> getAll();

    Optional<User> findUser(Long id);

    User updateUser(User user);
    
    boolean deleteAccountById(Long id);

}