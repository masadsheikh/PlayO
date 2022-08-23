
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    var art: Article?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentLabel.text = art?.content
        guard let urlImage = art?.urlToImage else {
            print("error")
            return
        }
        imageLabel.downloaded(from: urlImage)
        
       
        
     

    }
    
    @IBAction func detailClick(_ sender: UIButton) {
        guard let urlDetail = art?.url else {
            print("Invalid Link")
            return
        }
        let url = URL(string: urlDetail)
        UIApplication.shared.open(url!)
    }
    

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
