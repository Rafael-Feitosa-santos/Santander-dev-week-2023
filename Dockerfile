# Etapa 1: build com Maven
FROM maven:3.9.5-eclipse-temurin-21 AS build
WORKDIR /app

# Copia todos os arquivos do projeto (incluindo pom.xml)
COPY . .

# Compila o projeto e gera o JAR (sem rodar os testes)
RUN mvn clean package -DskipTests

# Etapa 2: imagem final só com o JAR
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copia o JAR gerado da etapa anterior para a imagem final
COPY --from=build /app/target/santander-dev-week-2023-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta padrão do Spring Boot
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["java", "-jar", "app.jar"]
