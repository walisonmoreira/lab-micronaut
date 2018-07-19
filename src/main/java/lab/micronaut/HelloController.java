package lab.micronaut;

import io.micronaut.http.annotation.*;

@Controller("/hello") 
public class HelloController {
    @Get("/") 
    public String index() {
        return "Hello Micronaut"; 
    }
}