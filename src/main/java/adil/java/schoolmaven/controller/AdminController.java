package adil.java.schoolmaven.controller;


import adil.java.schoolmaven.entity.Student;
import adil.java.schoolmaven.entity.User;
import adil.java.schoolmaven.service.StudentService;
import adil.java.schoolmaven.service.UserService;
import java.io.IOException;
import java.nio.file.FileSystemException;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private UserService userService;

    @GetMapping("/allStudentsAdmin")
    public ModelAndView allStudentsForUser() {
        ModelAndView mv = new ModelAndView();
        List<Student> studentList = studentService.getAllStudents();
        mv.addObject("studentList", studentList);
        mv.setViewName("allStudentsAdmin");
        return mv;
    }

    @GetMapping(value = "/deleteStudent/{id}")
    public ModelAndView deleteUserById(@PathVariable Long id) {
        studentService.deleteStudentById(id);
        ModelAndView mv = new ModelAndView("redirect:/admin/allStudentsAdmin");
        return mv;
    }

    @GetMapping(value = "/editStudent/{id}")
    public ModelAndView displayEditUserForm(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("adminEditStudent");
        Student student = studentService.getStudentById(id);
        mv.addObject("headerMessage", "Редактирование студента");
        mv.addObject("student", student);
        return mv;
    }

    @PostMapping(value = "/editStudent")
    public String saveEditedUser(
    @RequestParam("id") Long id,
    @RequestParam("name") String name,
    @RequestParam("surname") String surname,
    @RequestParam("avatar") MultipartFile file) {
        try {
            studentService.updateStudent(name, surname, file, studentService.getStudentById(id));
        } catch (FileSystemException ex) {
            ex.printStackTrace();
        } catch (IOException e) {
            return "redirect:/errors";
        }

        return "redirect:/admin/allStudentsAdmin";
    }

    @GetMapping(value = "/addStudentAdmin")
    public ModelAndView displayNewUserForm() {
        ModelAndView mv = new ModelAndView("addStudentAdmin");
        mv.addObject("headerMessage", "Add Student Details");
        mv.addObject("student", new Student());
        return mv;
    }

    @PostMapping(value = "/addStudentAdmin")
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
        return "redirect:/admin/allStudentsAdmin";
    }

    @GetMapping(value = "/addUser")
    public ModelAndView displayAddUserForm() {
        ModelAndView mv = new ModelAndView("addUser");

        mv.addObject("user", new User());
        return mv;
    }

    @PostMapping(value = "/addUser", consumes = "multipart/form-data")
    public String saveNewUser(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/admin/allUsers";
    }

    @GetMapping("/allUsers")
    public ModelAndView allUsers(@ModelAttribute User user) {
        ModelAndView mv = new ModelAndView("allUsers");
        List<User> users = userService.getAll();
        mv.addObject("users", users);
        return mv;
    }

    @GetMapping("/editUser/{id}")
    public ModelAndView editUser(@PathVariable Long id) {
        Optional<User> user = userService.findUser(id);
        if (user.isPresent()) {
            ModelAndView mv = new ModelAndView("editUser");
            User usr = user.get();
            usr.setPassword("abrakadabra");
            mv.addObject("user", usr);
            return mv;
        }
        return new ModelAndView("redirect:/admin/allUsers");
    }

    @PostMapping("/editUser")
    public String saveEditedUser(@ModelAttribute User user) {
        userService.updateUser(user);
        return "redirect:/admin/allUsers";
    }
}
    



