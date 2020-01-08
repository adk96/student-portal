
package adil.java.schoolmaven.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class SecurityWebInitializer extends AbstractSecurityWebApplicationInitializer{
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] {SecurityConfig.class};
    }
}
