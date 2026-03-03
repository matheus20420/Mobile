import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

@SpringBootApplication
@RestController
@CrossOrigin(origins = "*") // Isso evita erros de CORS se você testar no Flutter Web (Chrome)
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    // Rota GET simples para testar se o servidor está online
    @GetMapping("/api/teste")
    public Resposta testeConexao() {
        System.out.println("Flutter chamou a rota GET!");
        return new Resposta("Conexão bem-sucedida! O Java está online.");
    }

    // Rota POST para testar o envio de dados do Flutter para o Java
    @PostMapping("/api/mensagem")
    public Resposta receberMensagem(@RequestBody Resposta msg) {
        System.out.println("Chegou do Flutter: " + msg.getMensagem());
        return new Resposta("Java recebeu sua mensagem: " + msg.getMensagem());
    }
}

// Classe simples para formatar o JSON
class Resposta {
    private String mensagem;

    public Resposta() {}
    public Resposta(String mensagem) { this.mensagem = mensagem; }
    
    public String getMensagem() { return mensagem; }
    public void setMensagem(String mensagem) { this.mensagem = mensagem; }
}