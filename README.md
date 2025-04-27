# 🎨 Artistas Curitibanos

![Xcode](https://img.shields.io/badge/Xcode-15.0+-blue?logo=xcode)
![iOS](https://img.shields.io/badge/iOS-15.0+-lightgrey?logo=apple)
![Swift](https://img.shields.io/badge/Swift-5.0-orange?logo=swift)
![License](https://img.shields.io/badge/license-MIT-green)

> Aplicativo iOS que mostra a arte produzida por artistas curitibanos, exibindo uma galeria de obras com informações sobre as artes.

---

## 👩‍💻 Desenvolvedora

| Karen Ubial P.  | 

---

## 🎥 Vídeo de Apresentação

[📺 Clique aqui para assistir à apresentação do projeto no YouTube](https://youtu.be/eE8N7bl_UGc)

---

## 📱 Funcionalidades

- Exibição de uma galeria de obras em uma grade.
- Visualização de detalhes de cada obra.
- Compartilhamento das informações das obras.

---

## 🛠️ Tecnologias

- Swift + UIKit
- UICollectionView com UICollectionViewFlowLayout
- UINavigationController
- Auto Layout
- UIActivityViewController

---

## 🏛️ Estrutura de Dados

```swift
struct ObraDeArte {
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
}
