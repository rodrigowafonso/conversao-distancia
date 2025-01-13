# Utilização de imagem otimizada Python
FROM python:3.13.0

# Criar o diretório de trabalho da aplicação
WORKDIR /rwa_app

# Faz uma cópia do arquivo para /rwa_app - 
COPY ./requirements.txt .

# Execução da instalação das depedencias do Projeto
RUN pip install -r requirements.txt

# Faz uma cópia dos demais arquivos para /rwa_app/
COPY . /rwa_app/

# Expondo a porta 5000 do Container
EXPOSE 5000

# Comando de inicialização do Container
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]