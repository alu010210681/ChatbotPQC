# Usa una imagen base de Python
FROM python:3.10-slim

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos de tu proyecto al contenedor
COPY . /app

# Instalar las dependencias necesarias
RUN pip install --no-cache-dir -r requirements.txt

# Instalar Rasa si no está en el requirements.txt
RUN pip install rasa==2.8.0

# Entrenamos el modelo de Rasa durante la construcción del contenedor
RUN rasa train

# Expone el puerto para la API de Rasa si es necesario
EXPOSE 5005

ENTRYPOINT ["rasa"]

CMD ["run", "--cors", "*", "--enable-api", "--model", "./models", "--debug"]
