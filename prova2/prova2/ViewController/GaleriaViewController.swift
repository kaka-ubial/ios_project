//
//  GaleriaViewController.swift
//  prova2
//
//  Created by user276492 on 4/27/25.
//

import UIKit

class GaleriaViewController: UIViewController {
    
    // Lista de obras que serao exibidas na galeria
    private var obras: [ObraDeArte] = [
        ObraDeArte(titulo: "Preta do Sul", artista: "Rimon Guimaraes", ano: 2017, estilo: "Abstrato", imagemNome: "obra1", descricao: "Mulher negra vestida com um turbante e roupas coloridas, diante de uma bela paisagem"),
        ObraDeArte(titulo: "Araucaria", artista: "Lucas Noal de Farias", ano: 2025, estilo: "Contemporaneo", imagemNome: "obra2", descricao: "Um dos principais simbolos da cidade: a Araucaria"),
        ObraDeArte(titulo: "Nebulosa de Baco", artista: "Rosana Stavis", ano: 2025, estilo: "Impressionismo", imagemNome: "obra3", descricao: "A atriz curitibana Rosana Stavis estrela a produ;'ao Nebulosa de Baco"),
        ObraDeArte(titulo: "Um, dois, tres, quatro", artista: "Denise Roman", ano: 1985, estilo: "Modernismo", imagemNome: "obra4", descricao: "Essa gravura fez parte de uma serie de 10 gravuras enviadas para a Suica numa exposicao itinerante em comemoracao ao Ano Internacional da Juventude"),
        ObraDeArte(titulo: "O Teatro do Mundo", artista: "Potty Lazzarotto", ano: 1952, estilo: "Estilo de Relevos", imagemNome: "obra5", descricao: "Painel de concreto que traz referencias a figuras importantes da dramaturgia e companhias famosas"),
        ObraDeArte(titulo: "Lua Diurna", artista: "Rimon Guimaraes", ano: 2015, estilo: "Abstrato", imagemNome: "obra6", descricao: "Arte de Rimon Guimaraes exposta pelo mundo: um de seus paineis na Republica da Bielorrussia"),
        ObraDeArte(titulo: "Deriva", artista: "Domicio Pedroso", ano: 2015, estilo: "Modernismo", imagemNome: "obra7", descricao: "Obra em oleo sobre tela que representa o velejar"),
        ObraDeArte(titulo: "Passeio Publico de Curitiba", artista: "Alfredo Andersen", ano: 2015, estilo: "Realismo", imagemNome: "obra8", descricao: "Alfredo Andersen dedicou boa parte de sua pintua aos retratos e paisagens de Curitiba e arredores, sendo considerado o pai da pintura paranaense. Esta obra retrata o passeio publico"),
        ObraDeArte(titulo: "O mito da vida", artista: "Michael Devis e Neto Vetorello", ano: 2016, estilo: "Grafitti", imagemNome: "obra9", descricao: "Está no TECPUC da PUC-PR o maior mural vertical no estilo graffiti de Curitiba!"),
        ObraDeArte(titulo: "Cortina corta-fogo do Guairao", artista: "Potty Lazzarotto", ano: 1998, estilo: "Modernismo", imagemNome: "obra10", descricao: "Cortinas corta-fogo, acionadas apenas em caso de incendio. A intencao era servir de cenario para apresentacoes, mas hoje ainda e mantida apenas para casos de fogo no teatro")
    ]
    
    // Collection view para exibir a lista de obras
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left:  10, bottom: 10, right: 10)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
                                
    // Funcao chamada quando a tela e carregada
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artistas Curitibanos"
        view.backgroundColor = .white
        setupCollectionView()
        
        // Configura o estilo do titulo da Navigation Bar
        let font = UIFont.systemFont(ofSize: 24, weight: .bold)
        navigationController?.navigationBar.titleTextAttributes = [
            .font: font
        ]
    }
                                
    // Configura a collection view e adiciona ao layout
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(ObraDeArteView.self, forCellWithReuseIdentifier: ObraDeArteView.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
            
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// Extensao para implementar data source e delegate da collection view
extension GaleriaViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Retorna a quantidade de itens (obras) para exibir
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obras.count
    }
    
    // Cria e configura as celulas para cada obra
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ObraDeArteView.identifier, for: indexPath) as? ObraDeArteView else {
            return UICollectionViewCell()
        }
        cell.configure(with: obras[indexPath.row])
        return cell
    }
    
    // Acao quando o usuario toca em uma obra
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let obraSelecionada = obras[indexPath.row]
        let detalheVC = DetalheObraViewController(obra: obraSelecionada)
        navigationController?.pushViewController(detalheVC, animated: true)
    }
    
    // Define o tamanho de cada celula (obra)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:  IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 40) / 2
        return CGSize(width: width, height:  width * 1.4)
    }
}
