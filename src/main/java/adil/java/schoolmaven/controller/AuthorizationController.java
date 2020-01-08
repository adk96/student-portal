
package adil.java.schoolmaven.controller;

import adil.java.schoolmaven.entity.Student;
import adil.java.schoolmaven.service.StudentService;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthorizationController {

    private static final String ROLE_ADMIN = "ROLE_ADMIN";
    private static final String ROLE_USER = "ROLE_USER";
    @Autowired
    StudentService studentService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model) {
        String errorMessage = null;
        if (error != null) {
            errorMessage = "Login or Password is Incorrect";
        }
        if (logout != null) {
            errorMessage = "You have been successfully logged out !!";
        }
        model.addAttribute("errorMessage", errorMessage);
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }

    @RequestMapping(value = {"/allStudents", "/"},  method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView displayAllStudents() {
        Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication()
                .getAuthorities();
        if(containRole(authorities, ROLE_ADMIN)){
            return new ModelAndView("redirect:/admin/allStudentsAdmin");
        }
        if(containRole(authorities, ROLE_USER)){
            return new ModelAndView("redirect:/user/allStudentsUser");
        }
        ModelAndView mv = new ModelAndView("allStudents");
        mv.addObject("studentList", studentService.getAllStudents());
        return mv;
    }

    @GetMapping("/addStudent")
    public ModelAndView editStudent(){
        Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication()
                .getAuthorities();
        if(containRole(authorities, ROLE_ADMIN)){
            return new ModelAndView("redirect:/admin/addStudentAdmin");
        }
        if(containRole(authorities, ROLE_USER)){
            return new ModelAndView("redirect:/user/addStudentUser");
        }
        ModelAndView mv = new ModelAndView("allStudents");
        mv.addObject("studentList", studentService.getAllStudents());
        return mv;
    }

    private boolean containRole(Collection<? extends GrantedAuthority> authorities, String role){
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals(role)) {
                return true;
            }
        }
        return false;
    }
}
    

    
