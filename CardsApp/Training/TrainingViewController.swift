//
//  TrainingViewController.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 28.05.2022.
//

import UIKit

final class TrainingViewController: BaseViewController, TrainingModelDelegate, TrainingViewDelegate {
    weak var delegate: NewWordAndTrainingViewControllersDelegate?
    var trainingModel: TrainingModel? = nil
    var trainingView: TrainingView? = nil
    
    init() {
        super.init(navigationBarVisibility: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        let trainingModel = TrainingModel()
        self.trainingModel = trainingModel
        trainingModel.delegate = self
        
        trainingModel.viewDidLoad()
    }
    
    override func handleDidTapBackButton() {
        trainingModel?.didTapBackButton()
    }
    
    func showTrainingView(for word: String, translation: String, context: String, showTranslation: Bool) {
        let trainingView = TrainingView(wordForTraining: word, translation: translation, context: context, showTranslation: showTranslation)
        self.trainingView = trainingView
        trainingView.delegate = self
        
        view.addSubview(trainingView)
        
        trainingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trainingView.topAnchor.constraint(equalTo: view.topAnchor),
            trainingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            trainingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            trainingView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func showNoSavedWordsError() {
        let alert = UIAlertController(title: nil, message: "Вы еще не добавили слова для тренировки", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] UIAlertAction in
            self?.delegate?.onFinish()
        })
        present(alert, animated: true)
    }
    
    func showNoTodayTrainingWords() {
        let alert = UIAlertController(title: nil, message: "Вы повторили все возможные слова на сегодня", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] UIAlertAction in
            self?.delegate?.onFinish()
        })
        present(alert, animated: true)
    }
    
    func didTapOnTrainingdView() {
        trainingModel?.didTapOnTrainingView()
    }
    
    func showWordDetailsView() {
        trainingView?.showDetails()
    }
    
    func didTapKnownWordButton() {
        trainingModel?.didTapKnownWordButton()
    }
    
    func didTapUnknownWordButton() {
        trainingModel?.didTapUnknownWordButton()
    }
    
    func showSavingChangesError() {
        let alert = UIAlertController(title: nil, message: "Что-то пошло не так", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func showFinishTraining() {
        let alert = UIAlertController(title: nil, message: "Вы успешно выполнили тренировку", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] UIAlertAction in
            self?.delegate?.onFinish()
        })
        present(alert, animated: true)
    }
    
    func notifyCompletion() {
        delegate?.onFinish()
    }
}
