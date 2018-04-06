//
//  LoginScreenViewController.swift
//  BeautyDiary
//
//  Created by Lingyun Gu on 3/20/18.
//  Copyright © 2018 BeautyDiary. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation


class LoginScreenViewController: UIViewController, ToggleMusicDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    var audioPlayer = AVAudioPlayer()
    var users = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!))
            audioPlayer.numberOfLoops = -1
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch{
            print(error)
        }


        // Do any additional setup after loading the view.
    }
    
    func toggleMusic(targetState: Bool) {
        if targetState {
            audioPlayer.play()
        }
        else {
            audioPlayer.stop()
        }
    }
    func isMusicPlaying() -> Bool {
        return audioPlayer.isPlaying
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // By the time we get here, the destination view controller has already been
        // instantiated. That allows us to get access to public properties/methods before
        // navigating to the destination view controller.
        if segue.identifier == "VCHome" {
            if let dest = segue.destination as? HomeTabBarController  {
                dest.toggleMusicDelegate = self
            }
        }
    }
    /*
    func CheckForUserNameAndPasswordMatch (userName : String, password : String) ->Bool
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.managedObjectContext
        let predicate = NSPredicate (format:"username = %@" ,userName)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        fetchRequest.predicate = predicate
        let error : NSError? = nil
        var fetchedResults:[NSManagedObject]? = nil
        do {
            try fetchedResults = managedObjectContext.fetch(fetchRequest) as? [NSManagedObject]
            if fetchedResults!.count>0
            {
                let objectEntity : User = fetchedResults?.first as! User
                if objectEntity.username == userName && objectEntity.password == password
                {
                    return true   // Entered Username & password matched
                }
                else
                {
                    return false  //Wrong password/username
                }
            }
            else
            {
                return false
            }
            
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        if let results = fetchedResults {
            users = results
        } else {
            print("Could not fetch")
        }

    }

    @IBAction func SignIn(_ sender: UIButton) {
        if CheckForUserNameAndPasswordMatch(userName : userNameTextField.text!, password : PasswordTextField.text!) == false{
            let alert = UIAlertController(title: "Login failed", message: "Username or Password incorrect", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)}))
            self.present(alert,animated: true,completion: nil)
        }
        else{
            self.performSegue(withIdentifier: "VCHome", sender: nil)
        }
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

