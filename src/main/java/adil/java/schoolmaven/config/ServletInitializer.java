package adil.java.schoolmaven.config;

import javax.servlet.Filter;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.web.filter.CharacterEncodingFilter;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Value("${spring.servlet.multipart.max-file-size}")

    private int maxFileSize;

    @Value("${spring.servlet.multipart.max-request-size}")

    private int maxRequestSize;

    @Autowired

    private Environment environment;

    @Override
    protected Class<?>[] getRootConfigClasses() {

        return new Class[]{HibernateConfig.class, SecurityConfig.class};

    }

    @Override
    protected Class<?>[] getServletConfigClasses() {

        return new Class[]{WebMvcConfig.class};

    }

    @Override
    protected String[] getServletMappings() {

        return new String[]{"/"};

    }
    
    @Override
    protected Filter[] getServletFilters() {

        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        return new Filter[]{ characterEncodingFilter, new MySiteMeshFilter()};
    }
    
    
 
  }
    
  



