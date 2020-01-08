package adil.java.schoolmaven.service;


import adil.java.schoolmaven.entity.User;
import adil.java.schoolmaven.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository repository;


    @Autowired
    public UserServiceImpl(UserRepository repository) {
        super();
        this.repository = repository;
    }

    @Override
    public List<User> getAll() {
        return (List<User>) repository.findAll();
    }

    @Override
    public Optional<User> findUser(Long id) {
        return repository.findById(id);
    }

    @Override
    public User saveUser(User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        return repository.save(user);
    }
    
      @Override
    public boolean deleteAccountById(Long id) {
        try {
            repository.deleteById(id);
            return true;
        } catch (Exception ex) {
            return false;
        }

    }

    @Override
    public User updateUser(User user) {
        User targetUser = repository.findById(user.getId()).get();

        if (user.getLogin() != null) {
            targetUser.setLogin(user.getLogin());
        }

        if (user.getRole() != null) {
            targetUser.setRole(user.getRole());
        }
        
       if (user.getPassword() != null && !user.getPassword().equals("abrakadabra")) {
            targetUser.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));         
        }
        return repository.save(targetUser);
    

    }
}

  

   

