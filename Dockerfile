# Paso 1: Usar una imagen base oficial de Rasa
FROM rasa/rasa:2.8.0-full

# Paso 2: Establecer el directorio de trabajo
WORKDIR /app

# Paso 3: Copiar los archivos del proyecto Rasa
COPY . /app

# Paso 6: Exponer el puerto que Rasa usará (default 5005)
EXPOSE 5005

# Paso 7: Iniciar el servidor Rasa
ENTRYPOINT ["rasa"]
CMD ["run", "--cors", "*", "--enable-api", "--model",  "./models", "--debug"]
