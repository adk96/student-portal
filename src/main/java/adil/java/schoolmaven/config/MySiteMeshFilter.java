
package adil.java.schoolmaven.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
 
public class MySiteMeshFilter extends ConfigurableSiteMeshFilter {

  @Override
  protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
           builder.addDecoratorPath("/admin/*", "/WEB-INF/decorators/adminDecorator.jsp");
           builder.addDecoratorPath("/user/*", "/WEB-INF/decorators/userDecorator.jsp");
           builder.addDecoratorPath("/*", "/WEB-INF/decorators/homeDecorator.jsp");
  }
}