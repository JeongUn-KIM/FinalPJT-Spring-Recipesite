package edu.spring.project;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //현재클래스가 설정 모든 결과를   xml 파일 설정으로 
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/naverimages/**")   //사용하는 이미지들을 호출하는 url = naverimages
        .addResourceLocations("file:///C:/kdigital2/images/projectimages/");
    }
}

//  http://localhost:port/upload/파일명
