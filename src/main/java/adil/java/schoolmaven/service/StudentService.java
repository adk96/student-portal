
package adil.java.schoolmaven.service;

import java.util.List;
import adil.java.schoolmaven.entity.Student;
import java.io.File;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

public interface StudentService {

    List<Student> getAllStudents();

    Student getStudentById(Long id);

    boolean saveStudent(Student student);

    boolean deleteStudentById(Long id);

    File loadAvatarByFileName(String filename);

    File saveAvatarImage(MultipartFile avatarImage) throws IOException;

    Student updateStudent(String name, String surname, MultipartFile avatar, Student targetStudent) throws IOException;

}