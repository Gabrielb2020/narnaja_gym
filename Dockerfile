# Usa una imagen base de Ruby
FROM ruby:3.2.2

# Instala las dependencias necesarias para Rails y PostgreSQL
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Define el directorio de trabajo dentro de la imagen
WORKDIR /app

# Copia tu Gemfile y Gemfile.lock a la imagen
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Instala las gemas
RUN bundle install

# Copia el resto de tu aplicación a la imagen
COPY . /app

# Añade un script para iniciar el servidor de Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
