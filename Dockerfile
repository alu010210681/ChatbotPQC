# Paso 1: Usar una imagen base oficial de Rasa
FROM rasa/rasa:2.8.0-full

# Paso 2: Establecer el directorio de trabajo
WORKDIR /app

# Paso 3: Copiar los archivos del proyecto Rasa
COPY . /app

# Paso 4: Instalar las dependencias necesarias
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Paso 5: Entrenar el modelo (opcional si ya tienes un modelo entrenado)
# RUN rasa train

# Paso 6: Exponer el puerto que Rasa usará (default 5005)
EXPOSE 5005

# Paso 7: Iniciar el servidor Rasa
CMD ["rasa", "run", "--cors", "*", "--enable-api", "--debug"]
