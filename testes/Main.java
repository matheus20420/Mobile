import io.javalin.Javalin;

public class Main {
    public static void main(String[] args) {
        
        // 1. Inicia o servidor na porta 8080 e libera o CORS
        Javalin app = Javalin.create(config -> {
            config.bundledPlugins.enableCors(cors -> {
                cors.addRule(it -> it.anyHost());
            });
        }).start(8080);

        System.out.println("✅ Servidor Javalin rodando na porta 8080!");

        // 2. Rota para o Flutter enviar os dados (POST)
        app.post("/api/processar", ctx -> {
            
            // Pega o JSON do Flutter e transforma no objeto Java automaticamente
            RequisicaoFlutter dados = ctx.bodyAsClass(RequisicaoFlutter.class);
            
            System.out.println("📥 Chegou do app: Nome = " + dados.nome + " | Ação = " + dados.acao);
            
            // Processamento: Cria uma resposta personalizada
            String textoProcessado = "Olá " + dados.nome + ", o servidor Java processou sua ação: " + dados.acao;
            
            // Devolve o JSON pronto para o Flutter
            ctx.json(new RespostaServidor(textoProcessado));
        });
    }
}

// --- Classes para mapear o JSON ---

class RequisicaoFlutter {
    public String nome;
    public String acao;
}

class RespostaServidor {
    public String mensagem;
    
    public RespostaServidor(String mensagem) {
        this.mensagem = mensagem;
    }
}