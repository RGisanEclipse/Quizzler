import UIKit
class ViewController: UIViewController {
    var quizBrain = QuizBrain()
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var thirdOption: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(resetQuiz), name: .didDismissResultsViewController, object: nil)
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        let questionsFinished = quizBrain.getQuestionsFinished()
        if(questionsFinished){
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        updateOptions()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScore()
    }
    func updateOptions(){
        firstOption.setTitle(quizBrain.getOptionText(0), for: .normal)
        secondOption.setTitle(quizBrain.getOptionText(1), for: .normal)
        thirdOption.setTitle(quizBrain.getOptionText(2), for: .normal)
        firstOption.backgroundColor = UIColor.clear
        secondOption.backgroundColor = UIColor.clear
        thirdOption.backgroundColor = UIColor.clear
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="goToResults"){
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.score = quizBrain.getScore()
        }
    }
    @objc func resetQuiz() {
        quizBrain.resetQuiz()
        updateUI()
    }
}

