from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel, EmailStr
from passlib.context import CryptContext

app = FastAPI()

# Configuração para Hash de Senha
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# Modelo de dados que o Flutter vai enviar
class LoginSchema(BaseModel):
    email: EmailStr
    senha: str

# Função simulando a busca no MySQL (depois conectamos com SQLAlchemy)
def buscar_usuario_no_banco(email: str):
    # Aqui entraria a query: SELECT * FROM usuarios WHERE email = email
    # Simulando um usuário para teste:
    if email == "admin@empresa.com":
        return {
            "id": 1,
            "nome": "Matheus",
            "email": "admin@empresa.com",
            "senha_hash": pwd_context.hash("123456"), # Senha criptografada
            "nivel_acesso": "admin"
        }
    return None

@app.post("/login")
async def login(dados: LoginSchema):
    usuario = buscar_usuario_no_banco(dados.email)
    
    # 1. Verifica se o usuário existe
    if not usuario:
        raise HTTPException(status_code=401, detail="E-mail ou senha incorretos")

    # 2. Verifica se a senha bate com o hash do banco
    senha_valida = pwd_context.verify(dados.senha, usuario["senha_hash"])
    
    if not senha_valida:
        raise HTTPException(status_code=401, detail="E-mail ou senha incorretos")

    # 3. Retorna os dados básicos para o Flutter salvar na memória
    return {
        "status": "sucesso",
        "usuario": {
            "id": usuario["id"],
            "nome": usuario["nome"],
            "nivel": usuario["nivel_acesso"]
        }
    }