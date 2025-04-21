# Paso 1: Usar una imagen base oficial de Rasa
FROM python:3.10-slim

# Paso 2: Establecer el directorio de trabajo
WORKDIR /app

# Paso 3: Copiar los archivos del proyecto Rasa
COPY . /app

# Paso 5: Exponer el puerto
EXPOSE 5005

# Instalar Rasa si no está en el requirements.txt
RUN pip install rasa

# Entrenamos el modelo de Rasa durante la construcción del contenedor
RUN rasa train

# Paso 6: Iniciar el servidor Rasa

ENTRYPOINT ["rasa"]
CMD ["run", "--cors", "*", "--enable-api", "--model", "./models", "--port", "5005", "--debug"]
