package br.com.dio.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Santander DEV week")
                        .version("1.0")
                        .description("API exemplo de uso do Springboot REST API")
                        .contact(new Contact()
                                .name("Rafael")
                                .email("rafael@exemplo.com.br")
                        )
                );
    }
}
