FROM postgres:latest

# Define a senha do usuário postgres
ENV POSTGRES_PASSWORD=amesma

# Copia o script de inicialização para a pasta padrão de inicialização do PostgreSQL
COPY init.sql /docker-entrypoint-initdb.d/

