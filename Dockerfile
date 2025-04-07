# Etapa 1: Build da aplicação com Maven
FROM maven:3.9.5-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .

# Garante permissão de execução (necessário se usar ./mvnw ao invés de mvn)
# RUN chmod +x mvnw

# Usa o Maven global instalado na imagem
RUN mvn clean package -DskipTests

# Etapa 2: Execução do JAR com JRE
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copia o JAR gerado
COPY --from=build /app/target/*.jar app.jar

# Expondo a porta da aplicação Spring
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-jar", "app.jar"]
