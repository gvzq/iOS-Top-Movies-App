//
//  DetailViewController.swift
//  Top Movies App
//
//  Created by Gerardo Vazquez on 1/31/16.
//  Copyright © 2016 Gerardo Vazquez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var infoView: UIView!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //using the CGS size of windowss to set margins
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        //unwrap string from optional from the dictionary
        let title = movie["title"] as?  String
        titleLabel.text = title
        
        let overview = movie["overview"]
        overviewLabel.text = overview as? String
        
        // sizetofir changes the label accordingly to text
        overviewLabel.sizeToFit()
        
        //safer code using if null (false) from optional
        if let posterPath = movie["poster_path"] as? String {
            let posterBaseUrl = "http://image.tmdb.org/t/p/w500"
            let imageUrl = NSURL(string: posterBaseUrl + posterPath)
            posterImageView.setImageWithURL(imageUrl!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //let cell = sender as! UITableViewCell
        //let indexPath = tableView.indexPathForCell(cell)
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
