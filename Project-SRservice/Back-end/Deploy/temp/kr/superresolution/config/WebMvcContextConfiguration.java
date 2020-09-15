package kr.superresolution.config;

import org.springframework.context.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.*;

import springfox.documentation.swagger2.annotations.*;

@Configuration
@EnableWebMvc
@EnableSwagger2
@ComponentScan(basePackages = { "kr.superresolution.controller" })
public class WebMvcContextConfiguration implements WebMvcConfigurer{
 
    // default servlet handler를 사용하게 합니다.
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
    
    @Override
    public void addViewControllers(final ViewControllerRegistry registry) {
    		System.out.println("addViewControllers가 호출됩니다. ");
        registry.addViewController("/").setViewName("main"); //특정 url에 대한 처리. 컨트롤러 클래스 작성하지 않고 매핑할수 있도록 해줌
        //main만 가지고 view를 찾을수 없음. 밑의 bean필요
    }
    
    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/"); //어떤 view 인지 찾아내게해줌
        resolver.setSuffix(".html");//확장자 선택
        return resolver;
    }
    
    //file upload resolver
    @Bean
    public MultipartResolver multipartResolver() {
        org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new org.springframework.web.multipart.commons.CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(10485760); // 1024 * 1024 * 10
        return multipartResolver;
    }
   
}