// File: GaleriaViewController.swift
// Exibe a lista de obras em uma coleção, com modo Dark

import UIKit

class GaleriaViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Dados das obras
    let obras: [ObraDeArte] = [
        ObraDeArte(
            titulo: "Museu do Olho",
            artista: "Oscar Niemeyer",
            ano: 2002,
            estilo: "Arquitetura Moderna",
            imagemNome: "MuseuOlho",
            descricao: "Ícone arquitetônico de Curitiba, com formato que remete a um olho, abriga exposições de arte contemporânea."
        ),
        ObraDeArte(
            titulo: "Painel do Largo da Ordem",
            artista: "Poty Lazzarotto",
            ano: 1980,
            estilo: "Mural em Azulejo",
            imagemNome: "PainelLargoOrdem",
            descricao: "Sequência de azulejos que conta passagens históricas e folclóricas do centro antigo de Curitiba."
        ),
        ObraDeArte(
            titulo: "Cavalos",
            artista: "Poty Lazzarotto",
            ano: 1971,
            estilo: "Mural em Azulejo",
            imagemNome: "PotyCavalos",
            descricao: "Painel azul em cerâmica representando cavalos em movimento, simbolizando força e liberdade."
        ),
        ObraDeArte(
            titulo: "O Berço",
            artista: "Lourdes de Deus",
            ano: 1992,
            estilo: "Naïf",
            imagemNome: "OBerco",
            descricao: "Cena festiva em estilo naïf, com figuras populares celebrando em cores vibrantes."
        ),
        ObraDeArte(
            titulo: "Mural da Rua São Francisco",
            artista: "Coletivo de artistas curitibanos",
            ano: 2015,
            estilo: "Grafite",
            imagemNome: "MuralSaoFrancisco",
            descricao: "Grafite urbano que explora a diversidade cultural de Curitiba, em prédio histórico."
        ),
        ObraDeArte(
            titulo: "Torso do Trabalhador",
            artista: "Erbo Stenzel",
            ano: 1959,
            estilo: "Escultura em Granito",
            imagemNome: "ErboStenzel",
            descricao: "Escultura abstrata em granito, homenageando o operário e instalada em espaço público."
        ),
        ObraDeArte(
            titulo: "Litografias Internacionais",
            artista: "Denise Roman",
            ano: 2020,
            estilo: "Litografia",
            imagemNome: "DeniseRoman",
            descricao: "Conjunto de litografias que dialogam entre técnicas clássicas e contemporâneas."
        ),
        ObraDeArte(
            titulo: "Pinheiros do Paraná",
            artista: "Guido Viaro",
            ano: 1930,
            estilo: "Pintura de Paisagem",
            imagemNome: "PinheirosViaro",
            descricao: "Paisagem paranaense com destaque para as grandes araucárias."
        )
    ]

    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fundo escuro
        view.backgroundColor = .darkGray
        collectionView.backgroundColor = .darkGray

        // Configura layout e delegação
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self

        // Padding interno
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

// MARK: - UICollectionViewDelegate & DataSource
extension GaleriaViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return obras.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as! CollectionViewCell
        let obra = obras[indexPath.row]
        cell.configure(with: obra)
        // Garante texto branco
        cell.tituloLabel.textColor = .white
        cell.artistaLabel.textColor = .white
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let detalhesVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "DetalhesViewController")
            as! DetalhesViewController
        detalhesVC.obra = obras[indexPath.row]
        detalhesVC.modalPresentationStyle = .fullScreen
        present(detalhesVC, animated: true)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let columns: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 3 : 2
        let totalSpacing = (columns - 1) * 8
            + collectionView.contentInset.left
            + collectionView.contentInset.right
        let width = (collectionView.bounds.width - totalSpacing) / columns
        return CGSize(width: width, height: width * 1.3)
    }
}
