#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
/**
 * 
 */
package mx.com.its.sol.sist.fsw.orm.benchmark.cfgs;

import javax.servlet.Filter;
import javax.servlet.ServletRegistration;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import mx.com.its.sol.sist.fsw.orm.benchmark.cfgs.data.DataAccessConfig;
import mx.com.its.sol.sist.fsw.orm.benchmark.cfgs.filter.CustomConfigurableSiteMeshFilter;
import mx.com.its.sol.sist.fsw.orm.benchmark.cfgs.security.AppSecurityConfig;
import mx.com.its.sol.sist.fsw.orm.benchmark.cfgs.util.UtilsConfig;
import mx.com.its.sol.sist.fsw.orm.benchmark.cfgs.web.WebMvcConfig;

/**
 *
 * Replacement for most of the content of web.xml, sets up the root and the servlet context config.
 *
 * @author lentiummmx
 *
 */
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer${symbol_pound}getRootConfigClasses()
	 */
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { AppConfig.class, DataAccessConfig.class, AppSecurityConfig.class, UtilsConfig.class };
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer${symbol_pound}getServletConfigClasses()
	 */
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebMvcConfig.class };
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.support.AbstractDispatcherServletInitializer${symbol_pound}getServletMappings()
	 */
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.support.AbstractDispatcherServletInitializer${symbol_pound}getServletFilters()
	 */
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		
		//Instead we used SecurityWebApplicationInitializer
		//DelegatingFilterProxy springSecurityFilter = new DelegatingFilterProxy("springSecurityFilterChain");
		
		//Instead we used CustomConfigurableSiteMeshFilter
		//ConfigurableSiteMeshFilter configurableSiteMeshFilter = new ConfigurableSiteMeshFilter();
		CustomConfigurableSiteMeshFilter configurableSiteMeshFilter = new CustomConfigurableSiteMeshFilter();
		
		return new Filter[]{characterEncodingFilter, configurableSiteMeshFilter};	//, springSecurityFilter};
	}

	/*
	 * (non-Javadoc)
	 * @see org.springframework.web.servlet.support.AbstractDispatcherServletInitializer${symbol_pound}customizeRegistration(javax.servlet.ServletRegistration.Dynamic)
	 */
	@Override
	protected void customizeRegistration(ServletRegistration.Dynamic registration) {
		registration.setInitParameter("defaultHtmlEscape", "true");
		//registration.setInitParameter("spring.profiles.active", "default");
	}
	
}
