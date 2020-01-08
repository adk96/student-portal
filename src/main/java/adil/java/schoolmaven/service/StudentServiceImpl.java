package adil.java.schoolmaven.service;

import adil.java.schoolmaven.entity.Student;
import adil.java.schoolmaven.repository.StudentRepository;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    @Value("${storage.location}")
    private String storageLocation;

    private StudentRepository repository;

    public StudentServiceImpl() {

    }

    @Autowired
    public StudentServiceImpl(StudentRepository repository) {
        super();
        this.repository = repository;
    }

    @Override
    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<Student>();
        repository.findAll().forEach(e -> list.add(e));
        return list;
    }

    @Override
    public Student getStudentById(Long id) {
        Student student = repository.findById(id).get();
        return student;
    }

    @Override
    public boolean saveStudent(Student student) {
        try {
            repository.save(student);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public boolean deleteStudentById(Long id) {
        try {
            repository.deleteById(id);
            return true;
        } catch (Exception ex) {
            return false;
        }

    }

    @Override

    public File loadAvatarByFileName(String filename) {

        return new File(storageLocation + "/" + filename);

    }

    @Override

    public File saveAvatarImage(MultipartFile avatarImage) throws IOException {

        File targetFolder = new File(storageLocation);
        if (!targetFolder.exists()) {
            Files.createDirectory(Paths.get(targetFolder.getAbsolutePath()));
        }
        File newFile = File.createTempFile(
                avatarImage.getName(),
                "." + avatarImage.getOriginalFilename().split("\\.")[1],
                targetFolder);

        avatarImage.transferTo(newFile);

        return newFile;

    }

    @Override
    public Student updateStudent(String name, String surname, MultipartFile avatar, Student targetStudent)
            throws IOException {

        if (name != null && !name.equals(targetStudent.getName())) {

            targetStudent.setName(name);

        }

        if (surname != null && !surname.equals(targetStudent.getSurname())) {

            targetStudent.setSurname(surname);

        }

        File newAvatar;
        if (!avatar.getOriginalFilename().isEmpty()) {
            if (targetStudent.getAvatar() != null) {
                Files.deleteIfExists(Paths.get(storageLocation + File.separator + targetStudent.getAvatar()));
            }
            newAvatar = saveAvatarImage(avatar);
            assert newAvatar != null;
            targetStudent.setAvatar(newAvatar.getName());
        }

        boolean isSaved = saveStudent(targetStudent);

        if (!isSaved) {

            throw new IOException();

        }

        return targetStudent;

    }

}
