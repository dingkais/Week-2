//
//  IntroViewController.swift
//  Carousel_Kai
//
//  Created by Kai Ding on 10/28/15.
//  Copyright © 2015 Kai Ding. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func covertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func updateViewTransformsWithOffset(offset : Float) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        
        introScrollView.sendSubviewToBack(introImageView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = CGFloat(introScrollView.contentOffset.y)
        
        //content offset: 0 -> 568
        // x offset: -30 -> 0
        // y offset: -285 - >0
        
        
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 75, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scale), CGFloat(scale))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -66, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -375, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scale), CGFloat(scale))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotation) * M_PI / 180))
        

        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scale), CGFloat(scale))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -150, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -450, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scale), CGFloat(scale))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -15, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -450, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scale), CGFloat(scale))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        
        print("content offset: \(scrollView.contentOffset.y)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
