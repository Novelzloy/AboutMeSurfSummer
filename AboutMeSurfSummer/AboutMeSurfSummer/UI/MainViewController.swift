//
//  MainViewController.swift
//  AboutMeSurfSummer
//
//  Created by Роман on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    enum Section: Hashable {
        case profile
        case skills
        case aboutMe
        
        var title: String {
            switch self {
            case .profile: return ""
            case .skills: return "Мои навыки"
            case .aboutMe: return "О себе"
            }
        }
    }
    
    enum Item: Hashable {
        case profile(_ profile: Profile)
        case skill(_ skill: String)
        case about(_ aboutSelf: String)
    }

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.alwaysBounceVertical = true
        collectionView.registerCell(of: ProfileCell.self)
        collectionView.registerCell(of: SkillCell.self)
        collectionView.registerHeaderView(of: HeaderView.self)
        return collectionView
    }()
    
    private lazy var mainTitle: UILabel = {
        let title = UILabel()
        title.text = "Профиль"
        title.textColor = .black
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(hex: 0xF3F3F5)
        setupViews()
        applyDataSourceSnapshot()
    }
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Item> = {
        let dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .profile(let profile):
                let cell = collectionView.dequeueCell(of: ProfileCell.self, for: indexPath)
                cell.configure(with: profile)
                return cell
            case .skill(let skill):
                let cell = collectionView.dequeueCell(of: SkillCell.self, for: indexPath)
                cell.configure(title: skill)
                return cell
            default: return .init()
            }
        }
        dataSource.supplementaryViewProvider = { collectionView, type, indexPath in
            guard let section = dataSource.sectionIdentifier(for: indexPath.section) else { return nil }
            switch section {
            case .skills:
                let view = collectionView.dequeueHeaderView(of: HeaderView.self, for: indexPath)
                view.delegate = self
                view.configure(title: section.title, hasAction: true, actionImage: .pencil)
                return view
            case .aboutMe:
                let view = collectionView.dequeueHeaderView(of: HeaderView.self, for: indexPath)
                view.configure(title: section.title, hasAction: false, actionImage: nil)
                return view
            default: return nil
            }
        }
        return dataSource
    }()
    
    private func applyDataSourceSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.profile, .skills, .aboutMe])
        snapshot.appendItems([.profile(.profile)], toSection: .profile)
        snapshot.appendItems([.skill("Skill 1"), .skill("Skill 2"), .skill("Skill 3"), .skill("Skill 4"), .skill("Skill 5"), .skill("Skill 6"), .skill("Skill 7"), .skill("Skill 8"), .skill("Skill 9"), .skill("Skill 10"), .skill("Skill 11"), .skill("Skill 12")], toSection: .skills)
        dataSource.apply(snapshot)
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            view.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: collectionView.rightAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
    
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, env in
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            header.pinToVisibleBounds = true
            let item: NSCollectionLayoutItem
            let group: NSCollectionLayoutGroup
            let section: NSCollectionLayoutSection
            switch self.dataSource.sectionIdentifier(for: sectionIndex) {
            case .profile:
                item = .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200)))
                group = .horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200)), subitems: [item])
                section = .init(group: group)
                section.contentInsets = .init(top: 24, leading: 51, bottom: 24, trailing: 51)
            case .skills:
                item = .init(layoutSize: .init(widthDimension: .estimated(50), heightDimension: .absolute(44)))
                group = .horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), subitems: [item])
                group.interItemSpacing = .fixed(12)
                group.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
                section = .init(group: group)
                section.contentInsets = .init(top: 16, leading: 0, bottom: 0, trailing: 0)
                section.decorationItems = [.background(elementKind: CollectionBackgroundDecorationView.reuseIdentifier)]
                section.interGroupSpacing = 12
                section.boundarySupplementaryItems = [header]
            default:
                item = .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200)))
                group = .horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200)), subitems: [item])
                section = .init(group: group)
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                header.pinToVisibleBounds = true
                section.boundarySupplementaryItems = [header]
            }
            return section
        }
        layout.register(CollectionBackgroundDecorationView.self, forDecorationViewOfKind: CollectionBackgroundDecorationView.reuseIdentifier)
        return layout
    }
}

extension MainViewController: HeaderViewDelegate {
    func headerView(header: HeaderView, actionPerformedWith button: UIButton) {
        print("action")
    }
}
