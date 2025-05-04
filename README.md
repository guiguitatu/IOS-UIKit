Projeto feito por: Guilherme Sampaio Furquim.

Link do vídeo para demo do projeto: https://youtu.be/BhTA-L4vn0o

# 🎨 Galeria de Arte iOS

Um app iOS simples para exibir uma galeria de obras de arte, visualizar detalhes e compartilhar informações. Suporta modo Dark com fundo cinza-escuro e textos brancos.

---

## 🗂️ Visão Geral

Este projeto mostra como criar um app com:

- 📱 UIKit + Storyboards  
- 🖼️ `UICollectionView` para exibir miniaturas  
- 🔍 Tela de detalhes com `UIViewController`  
- 🌙 Suporte ao Dark Mode (fundo escuro e texto branco)  
- 🤝 Compartilhamento de informações da obra

---

## 🚀 Estrutura de Arquivos

```
/GaleriaArte/
├── AppDelegate.swift
├── SceneDelegate.swift
├── ObraDeArte.swift
├── CollectionViewCell.swift
├── GaleriaViewController.swift
└── DetalhesViewController.swift
```

- **AppDelegate.swift**  
  Configura o ciclo de vida do app e força o Dark Mode global.  
- **SceneDelegate.swift**  
  Inicializa a `UIWindow` em modo escuro e carrega o storyboard.  
- **ObraDeArte.swift**  
  `struct` que modela cada obra de arte.  
- **CollectionViewCell.swift**  
  Subclasse de célula que exibe miniatura, título e artista.  
- **GaleriaViewController.swift**  
  Lista as obras em grid e gerencia a navegação para detalhes.  
- **DetalhesViewController.swift**  
  Mostra informações completas (imagem, título, artista, ano, estilo, descrição) e permite compartilhar.
