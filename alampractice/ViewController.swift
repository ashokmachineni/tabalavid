//
//  ViewController.swift
//  alampractice
//
//  Created by Ashok Machineni on 11/2/16.
//  Copyright © 2016 Ashok Machineni. All rights reserved.
//

import UIKit
import Alamofire
import AVKit
import AVFoundation



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var actorsArray = [AnyObject]()
    var player : AVPlayer=AVPlayer()
    var playercontroller : AVPlayerViewController=AVPlayerViewController()
     var selectedRow: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = "http://thecodeeasy.com/test/swiftjson.json"
        Alamofire.request(myURL).responseJSON { response in
            
        //print(response)
            let result = response.result
           
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let innerDict = dict["actors"] {
                    
                print(innerDict)
                    self.actorsArray = innerDict as! [AnyObject]
                    self.tableView.reloadData()
                    print(self.actorsArray)
                    
                    
                }
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // code
        return actorsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
  let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let title = actorsArray[indexPath.row]["title"]
        cell.chTitle.text = title as? String
        
        let imageUrlString = actorsArray[indexPath.row]["image"] as! String
        let imageURL = NSURL(string: imageUrlString)
        let imageData = NSData(contentsOf: imageURL as! URL)
       cell.chImage.image = UIImage(data: imageData as! Data)
    
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    selectedRow = indexPath.row
        let selectedItem = actorsArray[selectedRow] as! NSDictionary
        if let link = selectedItem["link"] as! String?{
            print("link = \(link)")
            let streamingURL:NSURL = NSURL(string: link)!
              let newPlayerItem=AVPlayerItem(url: streamingURL as URL)
            self.player=AVPlayer(playerItem: newPlayerItem)
            self.playercontroller=AVPlayerViewController()
            self.playercontroller.player=self.player
            self.present((self.playercontroller), animated: true) {
                self.playercontroller.player?.play()
            }
        }
        
    }

   }

/* if let dict = result.value as? Dictionary<String,AnyObject>{
 
 if let innerDict = dict["results"]![0] as? Dictionary<String,AnyObject>{
 
 if let webGen = innerDict["gender"] as? String {
 self.gender = webGen
 print("###\(self.gender)")
 
 }
 
 }
 } */


