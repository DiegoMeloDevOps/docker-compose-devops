# imagem leve para rodar a aplicação
FROM python:3.11-slim

# diretório que esta a aplicação no container
WORKDIR /app

# copia o arquivo de dependências para aproveitar o cache de build
COPY app/requirements.txt .

#Comando que irá instalar as dependencias do pacote sem armazenar cache
RUN pip install --no-cache-dir -r requirements.txt

# passando para o diretório dentro do container todo os arquivos da aplicação
COPY app/ .

# Porta utilizada na aplicação
EXPOSE 5000

# após subir o container rodar o comando para "startar" a aplicação automaticamente
CMD ["python", "app.py"]
