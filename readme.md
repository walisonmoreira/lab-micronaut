# [Lab Micronaut](https://github.com/walisonmoreira/lab-micronaut)

Experimentos com [Micronaut](http://micronaut.io).

Micronaut é um framework projetado para construir clientes e servidores de microsserviços escritos em Java, Kotlin e Groovy. Como possui licença *Apache License v2*, permite uso comercial.

Os desenvolvedores desse framework [são os mesmos](http://micronaut.io/faq.html) do popular Grails Framework. [Grails](https://grails.org) está para [Groovy](http://groovy-lang.org) (uma linguagem da JVM) assim como [Rails](https://rubyonrails.org/) está para [Ruby](https://www.ruby-lang.org).

Atenção! Como a criação desse projeto foi feita no Windows, as seções a seguir referem-se a esse SO.

## Executando

Se ainda não fez, faça clone do projeto.

```
git clone https://github.com/walisonmoreira/lab-micronaut
```

Se por algum motivo não puder fazer clone, faça download do arquivo [lab-micronaut-master.zip](https://github.com/walisonmoreira/lab-micronaut/archive/master.zip), descompacte-o em alguma pasta e renomeie de `lab-micronaut-master` para `lab-micronaut`.

Vá para a pasta do projeto:

```
cd lab-micronaut
```

Execute o projeto:

```
.\gradlew run
```

Aparecerá algo assim:

```
> Task :run
19:13:12.704 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 3198ms. Server Running: http://localhost:8080
<=========----> 75% EXECUTING [4s]
> :run
```

Se for a primeira execução, demorará uns minutos até baixar todas as dependências necessárias.

Agora é só acessar o endereço `http://localhost:8080/hello`.

## Criação

Essa seção explicará como esse projeto foi inicialmente construído. Os passos para a construção foram feitos a partir da seção [Quick Start](https://docs.micronaut.io/latest/guide/index.html#quickStart) do [User Guide do Micronaut](https://docs.micronaut.io/latest/guide/index.html).

As seções seguintes explicarão como fazer um "Hello World" com o Micronaut.

Atenção! Esse tutorial foi feito em julho de 2018. Pode ser que a forma de criar um projeto tenha mudado desde então.

### Pré-requisitos

Antes de começar é necessário ter disponível o Java 8 ou superior. Esse projeto foi criado e testado com o Java 8.

Para assegurar que o Java está instalado e configurado corretamente, abra um novo terminal do Windows e verifique a versão do Java, com o comando:

```
java -version
```

Aparecerá algo assim:

```
java version "1.8.0_172"
Java(TM) SE Runtime Environment (build 1.8.0_172-b11)
Java HotSpot(TM) 64-Bit Server VM (build 25.172-b11, mixed mode)
```

### Download e Instalação do Micronaut

Conforme o guia, existem algumas maneiras de instalar o Micronaut. Usaremos aqui a indicada para o Windows.

Atenção! É possível que precise de direitos de administrador para criar pastas e definir variáveis de ambiente.

* Obtenha o Micronaut em: [micronaut.io/download.html](http://micronaut.io/download.html). Faça o download do arquivo `micronaut-1.0.0.M2.zip`.
* Descompacte o conteúdo desse arquivo em algum diretório. `C:\micronaut`, por exemplo.
* Defina no Windows a variável de ambiente `MICRONAUT_HOME` apontando para o diretório de instalação do Micronaut.
* Inclua a referência `%MICRONAUT_HOME%\bin` à variável de ambiente `Path` no Windows.

Para assegurar que a instalação foi feita corretamente, abra um novo terminal do Windows e:

* Verifique o conteúdo da variável `MICRONAUT_HOME`, com o comando:

```
echo %MICRONAUT_HOME%
```

Aparecerá algo assim:

```
C:\micronaut
```

* Verifique a versão do Micronaut, com o comando:

```
mn --version
```

Aparecerá algo assim:

```
| Micronaut Version: 1.0.0.M2
| JVM Version: 1.8.0_172
```

Se algo não ocorreu como o esperado, verifique cuidadosamente se a variável `MICRONAUT_HOME` está apontando para a pasta correta e se a variável `Path` possui as entradas para as pastas dos executáveis do Java e do Micronaut. Faça as modificações e verifique novamente.

### Novo Projeto com Micronaut CLI

O [Micronaut CLI](https://docs.micronaut.io/latest/guide/index.html#cli) é uma ferramenta de linha de comando do Micronaut usada para criação de novos projetos, criação de artefatos, configurações, etc. Embora não sendo obrigatório, ele foi usado aqui por fornecer a maneira mais simples de criação de novos projetos.

Para criar o projeto com o Micronaut CLI, abra um terminal do Windows e:

* Crie uma aplicação "Hello World" server com Java e Gradle, com o comando:

```
mn create-app lab-micronaut
```

Após um instante, aparecerá algo assim:

```
| Application created at C:\lab-micronaut
```

Uma pasta será criada com os fontes do projeto dessa forma:

```
C:\lab-micronaut
  gradle\
  src\
  build.gradle
  Dockerfile
  gradlew
  gradlew.bat
  micronaut-cli.yml
```

## Git

### Repositório Git

O projeto foi adicionado à um repositório Git com os seguinte comandos:

```
cd lab-micronaut
git init
git add -A
git update-index --chmod=+x gradlew
git commit -m "Criação do projeto."
git remote add origin https://github.com/walisonmoreira/lab-micronaut
git push -u origin master -f
```

O arquivo `gradlew` do projeto é o script do Gradle usado no Linux para executar tarefas da aplicação. O arquivo `gradlew.bat` é o equivalente do Windows.

Ao incluir o projeto num repositório Git usando Windows, o arquivo `gradlew` não possui a propriedade de execução necessária para sua utilização no Linux. Dessa forma, quem fizer clone do repositório no Linux precisará definir manualmente as propriedades de execução desse arquivo com o comando `chmod` antes de usá-lo.

Para que essa definição manual não seja necessária após um Clone do Git no Linux, foi necessário a execução do comando `git update-index --chmod=+x gradlew`.

Dessa forma, após clonar o repositório no Linux, basta executar `./gradlew run` sem se preocupar em definir manualmente a propriedade de execução com `chmod`.

## Evolução da Aplicação

### Definição da porta padrão

Por padrão o Micronaut executa numa porta aleatória. Com o objetivo de facilitar o desenvolvimento, fixaremos a execução na 8080.

Para isso, definia a propriedade `port: 8080` no arquivo `lab-micronaut/src/main/resources/application.yml` da seguinte forma:

`application.yml` antes:

```yaml
micronaut:
    application:
        name: lab-micronaut                
```

`application.yml` depois:

```yaml
micronaut:
    application:
        name: lab-micronaut                
    server:
        port: 8080
```

### Criação do HelloController

Após a criação do projeto com o Micronaut CLI, a aplicação não possui controladores capazes de responder a requisições HTTP.

Para que a aplicação consiga responder à alguma requisição, é necessário criar um controlador.

O primeiro controlador que criaremos é o `HelloController.java` que controlará as requisições ao endereço `/hello`.

Para criar tal controlador, crie o arquivo `lab-micronaut/src/main/java/lab/micronaut/HelloController.java` com o seguinte conteúdo:

```java
package lab.micronaut;

import io.micronaut.http.annotation.*;

@Controller("/hello") 
public class HelloController {
    @Get("/") 
    public String index() {
        return "Hello Micronaut"; 
    }
}
```

Agora, ao iniciar novamente o Micronaut, o controlador responderá às requisições feitas ao endereço `http://localhost:8080/hello`.

## Links

* [Getting started with Micronaut](https://medium.com/@jonashavers/getting-started-with-micronaut-595515985a98)
* [Micronaut User Guide](https://docs.micronaut.io/latest/guide)
* [Creating your first Micronaut app](http://guides.micronaut.io/creating-your-first-micronaut-app/guide)
