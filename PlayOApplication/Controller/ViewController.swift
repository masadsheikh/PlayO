
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var viewtable: UIView!
    @IBOutlet weak var authorLabel: UILabel!
//
     @IBOutlet weak var titleLabel: UILabel!
//
//    @IBOutlet weak var descriptionLabel: UILabel!
    var articles = [Article]()
  
    let parser = Parser()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        parser.getData {
            data in
            self.articles = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LabelTableViewCell
        print(cell)
//        cell.textLabel?.text = articles[indexPath.row].author
//        cell.textLabel?.text = articles[indexPath.row].title
        cell.authorLabel.text = "Author: "+articles[indexPath.row].author
        cell.titleLabel.text = articles[indexPath.row].title
        cell.desriptionLabel.text = articles[indexPath.row].description
//        cell?.titleLabel?.text = "String"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "showDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.art = articles[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
  
    
    
}

