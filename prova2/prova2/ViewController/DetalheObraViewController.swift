//
//  DetalheObraViewController.swift
//  prova2
//
//  Created by user276492 on 4/27/25.
//

import UIKit

class DetalheObraViewController: UIViewController {
    private let obra: ObraDeArte
    
    private let imageView = UIImageView()
    private let tituloLabel = UILabel()
    private let artistaLabel = UILabel()
    private let anoLabel = UILabel()
    private let estiloLabel = UILabel()
    private let descricaoLabel = UILabel()
    private let compartilharButton = UIButton(type: .system)
    
    // Inicializador que recebe uma obra de arte e configura o controlador com ela
    init(obra: ObraDeArte) {
        self.obra = obra
        super.init(nibName: nil, bundle: nil)
    }
    
    // Inicializador obrigatorio que nao esta implementado
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Funcao chamada quando a view e carregada; configura o fundo e os detalhes da tela
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurarDetalhes()
    }
    
    // Funcao que configura e organiza os elementos da tela com base nos dados da obra
    private func configurarDetalhes() {
        imageView.image = UIImage(named: obra.imagemNome)
        imageView.contentMode = .scaleAspectFit
        
        tituloLabel.text = obra.titulo
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        artistaLabel.text = "Artista: \(obra.artista)"
        anoLabel.text = "Ano: \(obra.ano)"
        descricaoLabel.text = "Estilo: \(obra.estilo)"
        descricaoLabel.text = obra.descricao
        descricaoLabel.numberOfLines = 0
        
        compartilharButton.setTitle("Compartilhar", for: .normal)
        compartilharButton.addTarget(self, action: #selector(compartilharObra), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [imageView, tituloLabel, artistaLabel, anoLabel, estiloLabel, descricaoLabel, compartilharButton])
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .center
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
    }
    
    // Funcao que permite compartilhar informacoes da obra de arte usando o UIActivityViewController
    @objc private func compartilharObra() {
        let texto = "Da uma olhada na obra \"\(obra.titulo)\", do artista \(obra.artista)! E vem conhecer mais artistas da capital verde :)"
        let activityVC = UIActivityViewController(activityItems: [texto], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}
