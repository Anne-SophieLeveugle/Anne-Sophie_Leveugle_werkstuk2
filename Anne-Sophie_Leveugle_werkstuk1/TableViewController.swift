import UIKit



class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personen.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personenCell", for: indexPath)

        cell.textLabel?.text = personen[indexPath.row].naam
        cell.detailTextLabel?.text = personen[indexPath.row].voornaam
        cell.imageView?.image = UIImage(named: personen[indexPath.row].foto)
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {   
        if segue.identifier == "naarDetail"
        {
            let vc = segue.destination as! PersoonViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            vc.persoon = personen[(indexPath?.row)!]
        }
    }

}
