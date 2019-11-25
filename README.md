# GT-ARApp
GTARKit : This project uses camera and motion data to map out the POI's as you move around. Combines the high accuracy of AR with the scale of GPS data to determine your global location, with a low degree of accuracy.

The potential for combining these technologies is huge, with so many potential applications across many different areas. This project showcases two major features:

Allow POI's to be placed within the AR world using real-world coordinates.
Dramatically improved location accuracy, using recent location data points combined with knowledge about movement through the AR world.

Because there’s still work to be done there, and in other areas, this project will best be served by an open community, more than what GitHub Issues would allow us. So I’m opening up a Slack group that anyone can join, to discuss the library, improvements to it, and their own work.

## Requirements
ARKit requires iOS 11, and supports the following devices:

iPhone 6S and upwards
iPhone SE
iPad (2017) and above
All iPad Pro models
iOS 11 can be downloaded from Apple’s Developer website.

## Usage
This library contains the GTARKit + CoreLocation framework.

## Building with Swift:
```
swift build \
        -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphonesimulator --show-sdk-path`" \
        -Xswiftc "-target" -Xswiftc "x86_64-apple-ios12.1-simulator"
```
## Setting up using Swift Package Manager

## Setting up using CocoaPods
Add to your podfile:
```
pod 'ARCL' 
```

In Terminal, navigate to your project folder, then:
```
pod update
pod install
```

Add ```NSCameraUsageDescription``` and ```NSLocationWhenInUseUsageDescription``` to plist with a brief explanation (see demo project for an example)
Setting up manually

* Add all files from the ARKit+CoreLocation/Source directory to your project.
* Import ARKit, SceneKit, CoreLocation and MapKit.
* Add NSCameraUsageDescription and NSLocationWhenInUseUsageDescription to plist with a brief explanation (see demo project for an example)
 
## Quick start guide
To place a pin over a building, for example Imperfecto in Cyber Hub, Gurugram, we’ll use the main class that ARCL is built around - SceneLocationView.

First, import ARCL and CoreLocation, then declare SceneLocationView as a property:

```
import ARCL
import CoreLocation

class ViewController: UIViewController {
  var sceneLocationView = SceneLocationView()
}
You should call sceneLocationView.run() whenever it’s in focus, and sceneLocationView.pause() if it’s interrupted, such as by moving to a different view or by leaving the app.

override func viewDidLoad() {
  super.viewDidLoad()

  sceneLocationView.run()
  view.addSubview(sceneLocationView)
}

override func viewDidLayoutSubviews() {
  super.viewDidLayoutSubviews()

  sceneLocationView.frame = view.bounds
}
```

After we’ve called run(), we can add our coordinate. ARCL comes with a class called LocationNode - an object within the 3D scene which has a real-world location along with a few other properties which allow it to be displayed appropriately within the world. LocationNode is a subclass of SceneKit’s SCNNode, and can also be subclassed further. For this example we’re going to use a subclass called LocationAnnotationNode, which we use to display a 2D image within the world, which always faces us:
```
let coordinate = CLLocationCoordinate2D(latitude: 51.504571, longitude: -0.019717)
let location = CLLocation(coordinate: coordinate, altitude: 300)
let image = UIImage(named: "pin")!

let annotationNode = LocationAnnotationNode(location: location, image: image)
```

LocationAnnotationNode can also be initialized using a UIView. Internally, the UIView is converted into UIImage, so you cannot update the content dynamically. However, this methods allows you to easily show complex layout as POI.

```
let coordinate = CLLocationCoordinate2D(latitude: 51.504571, longitude: -0.019717)
let location = CLLocation(coordinate: coordinate, altitude: 300)
let view = UIView() // or a custom UIView subclass

let annotationNode = LocationAnnotationNode(location: location, view: view)
```

It can also be initialized with CALayer. You can use this when you want to update the contents live.
```
let coordinate = CLLocationCoordinate2D(latitude: 51.504571, longitude: -0.019717)
let location = CLLocation(coordinate: coordinate, altitude: 300)
let layer = CALayer() // or a custom CALayer subclass

let annotationNode = LocationAnnotationNode(location: location, layer: layer)
```

By default, the image you set should always appear at the size it was given, for example if you give a 100x100 image, it would appear at 100x100 on the screen. This means distant annotation nodes can always be seen at the same size as nearby ones. If you’d rather they scale relative to their distance, you can set LocationAnnotationNode’s scaleRelativeToDistance to true.

```
sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
```

There are two ways to add a location node to a scene - using ```addLocationNodeWithConfirmedLocation```, or ```addLocationNodeForCurrentPosition```, which positions it to be in the same position as the device, within the world, and then gives it a coordinate.

So that’s it. If you set the frame of your sceneLocationView, you should now see the pin hovering above Canary Wharf.

In order to get a notification when a node is touched in the sceneLocationView, you need to conform to LNTouchDelegate in the ViewController class.

The annotationNodeTouched(node: AnnotationNode) gives you access to node that was touched on the screen. AnnotationNode is a subclass of SCNNode with two extra properties: image: UIImage? and view: UIView?. Either of these properties will be filled in based on how the LocationAnnotationNode was initialized (using the constructor that takes UIImage or UIView).

The locationNodeTouched(node: LocationNode) gives you instead access to the nodes created from a PolyNode (e.g. the rendered directions of a MKRoute).

```
class ViewController: UIViewController, LNTouchDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //...
        self.sceneLocationView.locationNodeTouchDelegate = self
        //...
    }

    func annotationNodeTouched(node: AnnotationNode) {
        // Do stuffs with the node instance

        // node could have either node.view or node.image
        if let nodeView = node.view{
            // Do stuffs with the nodeView
            // ...
        }
        if let nodeImage = node.image{
            // Do stuffs with the nodeImage
            // ...
        }
    }

    func locationNodeTouched(node: LocationNode) {
        guard let name = node.tag else { return }
        guard let selectedNode = node.childNodes.first(where: { $0.geometry is SCNBox }) else { return }

        // Interact with the selected node
    }

}
```

## Issues
I mentioned this was experimental - currently, ARKit occasionally gets confused as the user is walking through a scene, and may change their position inaccurately. This issue also seems to affect the “euler angles”, or directional information about the device, so after a short distance it may think you’re walking in a different direction.

While Apple can improve ARKit over time, I think there are improvements we can make to avoid those issues, such as recognising when it happens and working to correct it, and by comparing location data with our supposed location to determine if we’ve moved outside a possible bounds.
