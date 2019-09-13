//
//  ViewController.swift
//  Mycamera
//
//  Created by 笹野駿人 on 2019/09/10.
//  Copyright © 2019 hayatosann. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var photoImage: UIImageView!
    
    @IBAction func cameraLaunchAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("Camera can be used.")
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            present(ipc, animated:true, completion: nil)
        } else {
            print("Camera is not available")
        }
    }
    
    @IBAction func shareAction(_ sender: Any) {
        if let sharedImage = photoImage.image {
            let sharedItems = [sharedImage]
            let controller = UIActivityViewController(activityItems: sharedItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view
            present(controller,animated: true,completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}

