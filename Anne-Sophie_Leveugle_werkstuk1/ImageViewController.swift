import UIKit

class ImageViewController: UIViewController {

    var image:UIImage = UIImage()

    @IBOutlet weak var vergroteImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vergroteImage.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
