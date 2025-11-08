# 🎬 Cinebox

Um aplicativo Flutter moderno para descobrir, explorar e gerenciar seus filmes favoritos. Integrado com a API do The Movie Database (TMDB) e autenticação via Google.

## 📋 Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Funcionalidades](#funcionalidades)
- [Arquitetura](#arquitetura)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Como Usar](#como-usar)
- [Contribuindo](#contribuindo)

## 📱 Sobre o Projeto

Cinebox é um aplicativo de catálogo de filmes que permite aos usuários:
- Explorar filmes populares, mais bem avaliados e em cartaz
- Buscar filmes por nome ou gênero
- Ver detalhes completos dos filmes incluindo elenco
- Salvar filmes favoritos
- Autenticação segura via Google Sign-In

## ✨ Funcionalidades

### 🔐 Autenticação
- Login com Google
- Armazenamento seguro de tokens
- Verificação automática de sessão

### 🎥 Exploração de Filmes
- **Categorias**: Populares, Mais Votados, Em Cartaz, Em Breve
- **Gêneros**: Navegação por gênero cinematográfico
- **Busca**: Pesquisa de filmes por nome
- **Detalhes**: Informações completas incluindo sinopse, elenco e avaliação

### ⭐ Gerenciamento de Favoritos
- Adicionar filmes aos favoritos
- Remover filmes dos favoritos
- Visualizar lista de favoritos
- Sincronização com backend

## 🏗️ Arquitetura

O projeto segue os princípios da **Clean Architecture** combinada com **MVVM**, garantindo:
- Separação clara de responsabilidades
- Alta testabilidade
- Fácil manutenção e escalabilidade
- Código desacoplado

### Estrutura em Camadas

```
┌─────────────────────────────────────────┐
│           UI Layer (MVVM)               │
│  Views, ViewModels, Commands, Widgets   │
├─────────────────────────────────────────┤
│          Domain Layer                   │
│   UseCases, Entities, Extensions        │
├─────────────────────────────────────────┤
│           Data Layer                    │
│  Repositories, Services, DTOs, Mappers  │
├─────────────────────────────────────────┤
│          Core Layer                     │
│      Result Pattern, Utilities          │
└─────────────────────────────────────────┘
```

### Padrões Implementados

- **MVVM**: Separação entre lógica de apresentação e UI
- **Repository Pattern**: Abstração de fontes de dados
- **Command Pattern**: Encapsulamento de operações
- **Result Pattern**: Tratamento elegante de erros
- **Dependency Injection**: Via Riverpod

## 🛠️ Tecnologias Utilizadas

### Core
- **Flutter SDK**: ^3.9.2
- **Dart**: ^3.9.2

### Gerenciamento de Estado
- **flutter_riverpod**: ^3.0.0 - Gerenciamento de estado reativo
- **riverpod_annotation**: ^3.0.0 - Code generation
- **riverpod_generator**: ^3.0.0 - Geração automática de providers

### Rede e APIs
- **dio**: ^5.9.0 - Cliente HTTP
- **retrofit**: ^4.7.1 - Type-safe REST client
- **json_annotation**: ^4.9.0 - Serialização JSON

### Autenticação e Segurança
- **google_sign_in**: ^7.2.0 - Login com Google
- **flutter_secure_storage**: ^9.2.4 - Armazenamento seguro

### UI/UX
- **cached_network_image**: ^3.4.1 - Cache de imagens
- **loading_animation_widget**: ^1.3.0 - Animações de carregamento
- **cupertino_icons**: ^1.0.8 - Ícones iOS

### Configuração
- **envied**: ^1.2.0 - Gerenciamento de variáveis de ambiente
- **logger**: ^2.6.0 - Logging

### Desenvolvimento
- **build_runner**: ^2.5.4 - Geração de código
- **flutter_lints**: ^6.0.0 - Análise de código
- **custom_lint**: ^0.8.0 - Linting customizado
- **riverpod_lint**: ^3.0.0 - Linting para Riverpod

## 📋 Requisitos

- Flutter SDK 3.9.2 ou superior
- Dart SDK 3.9.2 ou superior
- Android Studio / VS Code
- Conta no [TMDB](https://www.themoviedb.org/) para API key
- Projeto Firebase configurado para Google Sign-In
- Backend próprio para gerenciamento de favoritos

## 🚀 Instalação

1. **Clone o repositório**
```bash
git clone https://github.com/John-Rocha/cinebox.git
cd cinebox
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute os geradores de código**
```bash
dart run build_runner build --delete-conflicting-outputs
```

## ⚙️ Configuração

### 1. Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
GOOGLE_API_KEY=sua_google_api_key_aqui
BACKEND_BASE_URL=https://sua-api-backend.com
THE_MOVIE_DB_API_KEY=sua_tmdb_api_key_aqui
```

### 2. TMDB API Key

1. Crie uma conta em [The Movie Database](https://www.themoviedb.org/)
2. Acesse [API Settings](https://www.themoviedb.org/settings/api)
3. Copie sua API Key (v3 auth)
4. Cole no arquivo `.env`

### 3. Google Sign-In

1. Configure o projeto no [Firebase Console](https://console.firebase.google.com/)
2. Ative o Google Sign-In na seção Authentication
3. Baixe o `google-services.json` (Android) e `GoogleService-Info.plist` (iOS)
4. Coloque os arquivos nas pastas correspondentes
5. Adicione a Web Client ID no `.env`

### 4. Backend

Configure a URL do seu backend no arquivo `.env`. O backend deve implementar endpoints para:
- `GET /favorites` - Listar filmes favoritos
- `POST /favorites` - Adicionar favorito
- `DELETE /favorites/{id}` - Remover favorito

## 📁 Estrutura do Projeto

```
lib/
├── config/                 # Configurações e variáveis de ambiente
│   ├── env.dart
│   └── env.g.dart
├── core/                   # Funcionalidades centrais
│   └── result/            # Result Pattern para tratamento de erros
│       └── result.dart
├── data/                   # Camada de dados
│   ├── exceptions/        # Exceções personalizadas
│   ├── mappers/           # Conversão DTOs → Domain Models
│   ├── models/            # DTOs (Data Transfer Objects)
│   ├── repositories/      # Implementações de repositórios
│   │   ├── auth/
│   │   ├── movies/
│   │   └── tmdb/
│   └── services/          # Serviços externos (APIs, storage)
│       ├── auth/
│       ├── google_sign_in/
│       ├── local_storage/
│       ├── movies/
│       └── tmdb/
├── domain/                 # Camada de domínio
│   ├── extensions/        # Extensões para modelos
│   ├── models/            # Entidades de negócio
│   └── usecases/          # Casos de uso (regras de negócio)
├── ui/                     # Camada de apresentação
│   ├── core/              # Widgets e comandos compartilhados
│   │   ├── commands/      # Commands reutilizáveis
│   │   ├── themes/        # Temas do app
│   │   └── widgets/       # Widgets customizados
│   ├── favorites/         # Tela de favoritos
│   ├── home/              # Tela principal
│   ├── login/             # Tela de login
│   ├── movie_detail/      # Detalhes do filme
│   ├── movies/            # Listagem de filmes
│   ├── profile/           # Perfil do usuário
│   └── splash/            # Splash screen
├── cinebox_main_app.dart  # Configuração do MaterialApp
└── main.dart              # Entry point
```

## 💡 Como Usar

### Executar o App

```bash
flutter run
```

### Executar Testes

```bash
flutter test
```

### Gerar Código

```bash
# Executar uma vez
dart run build_runner build --delete-conflicting-outputs

# Watch mode (regenera automaticamente)
dart run build_runner watch --delete-conflicting-outputs
```

### Análise de Código

```bash
flutter analyze
```

### Formatar Código

```bash
dart format .
```

## 🔄 Fluxo de Dados

```
┌──────────┐
│   View   │ Usuário interage com a UI
└────┬─────┘
     │
     v
┌──────────────┐
│  ViewModel   │ Gerencia estado da tela
└──────┬───────┘
       │
       v
┌──────────┐
│ Command  │ Executa ação específica
└────┬─────┘
     │
     v
┌──────────┐
│ UseCase  │ Aplica regras de negócio
└────┬─────┘
     │
     v
┌──────────────┐
│  Repository  │ Abstração de dados
└──────┬───────┘
       │
       v
┌──────────┐
│ Service  │ Comunicação com API
└────┬─────┘
     │
     v
┌──────────┐
│   API    │ The Movie DB / Backend
└──────────┘
```

## 🤝 Contribuindo

Contribuições são bem-vindas! Para contribuir:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Padrões de Código

- Siga as convenções do Dart/Flutter
- Use `flutter analyze` antes de commitar
- Mantenha os arquivos formatados com `dart format`
- Escreva testes para novas funcionalidades
- Documente código complexo

## 📄 Licença

Este projeto é de código fechado e propriedade privada.

## 👤 Autor

**John Rocha**

- GitHub: [@John-Rocha](https://github.com/John-Rocha)

## 🙏 Agradecimentos

- [The Movie Database (TMDB)](https://www.themoviedb.org/) pela API gratuita
- Comunidade Flutter pelos pacotes incríveis
- Google pelo Flutter framework

---

Desenvolvido com ❤️ usando Flutter
