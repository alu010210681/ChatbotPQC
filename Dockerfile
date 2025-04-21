# Paso 1: Usar una imagen base oficial de Rasa
FROM rasa/rasa:2.8.0-full

# Paso 2: Establecer el directorio de trabajo
WORKDIR /app

# Paso 3: Copiar los archivos del proyecto Rasa
COPY . /app

# Paso 5: Exponer el puerto
EXPOSE 5005

# Paso 6: Iniciar el servidor Rasa
CMD ["rasa", "run", "--cors", "*", "--enable-api", "--debug"]
