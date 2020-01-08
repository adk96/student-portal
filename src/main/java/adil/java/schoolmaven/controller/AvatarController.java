package adil.java.schoolmaven.controller;

import adil.java.schoolmaven.service.StudentService;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.repository.query.Param;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AvatarController {

    @Value("${storage.location}")
    private String storageLocation;

    private StudentService studentService;

    @Autowired
    private ServletContext servletContext;

    // Constructor based Dependency Injection
    @Autowired
    public AvatarController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping(value = "/avatar")
    public void getAvatar(HttpServletResponse response, @Param("avatar") String avatar) {
        if (avatar == null || avatar.isEmpty()) {
            return;
        }
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        try (FileInputStream input = new FileInputStream(studentService.loadAvatarByFileName(avatar))){
            IOUtils.copy(input, response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public void image(@RequestParam String url, HttpServletResponse response) throws IOException {
        InputStream in = new FileInputStream(url);
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }
}
