package adil.java.schoolmaven.controller;

import adil.java.schoolmaven.entity.Student;
import adil.java.schoolmaven.service.StudentService;
import java.io.IOException;
import java.nio.file.FileSystemException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/allStudentsUser")
    public ModelAndView allStudents(){
        ModelAndView mv = new ModelAndView();
        List<Student> studentList = studentService.getAllStudents();
        mv.addObject("studentList", studentList);
        mv.setViewName("allStudentsUser");
        return mv;
    }

    
    @GetMapping(value = "/addStudentUser")
    public ModelAndView displayNewUserForm() {
        ModelAndView mv = new ModelAndView("addStudentUser");
        mv.addObject("headerMessage", "Add Student Details");
        mv.addObject("student", new Student());
        return mv;
    }

    @PostMapping(value = "/addStudentUser")
    public String saveNewStudent(@RequestParam("name") @NonNull String name,
            @RequestParam("surname") @NonNull String surname,
            @RequestParam("avatar") MultipartFile file)
            throws IOException {

        Student student = new Student();
        student.setSurname(surname);
        student.setName(name);

        if (file != null && !file.isEmpty()) {
            student.setAvatar(studentService.saveAvatarImage(file).getName());
        }
        studentService.saveStudent(student);
        return "redirect:/user/allStudentsUser";
    }
}




