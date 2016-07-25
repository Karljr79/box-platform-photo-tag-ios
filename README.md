# Photo Tagger Example iOS App

To get started:

Developer Setup
---------------
* Ensure you have the latest version of [XCode](https://developer.apple.com/xcode/) installed.
* We encourage you to use [CocoaPods](http://cocoapods.org/) to import the SDK into your project. CocoaPods is a simple, but powerful dependency management tool. If you do not already use CocoaPods, it's very easy to [get started](http://guides.cocoapods.org/using/getting-started.html).

1. Clone the repo or download the .zip from GitHub
2. Install Dependencies
```
$ cd path/to/project/directory
$ pod install
```
3. As with all Cocoapods-enabled projects be sure to click on the .xcworkspace file to open the project
4. Edit the "config.plist" file with the following values:
-Clarifai Client ID
-Clarifai Secret Key
-URL for the sample server (see [https://github.com/Karljr79/box-platform-photo-tag-server](https://github.com/Karljr79/box-platform-photo-tag-server))
-A Box App User ID (Use the /signup route of the sample server to generate one)

5. You will need to create a Metadata template within your Box admin console with the following spec:
-Log in as the enterprise admin to your Box account
-Head to the "Work Processes" tab (The icon looks like a wrench)
-Click the metadata sub-tab
-Click the "Create New" button
-Name the template "photoUploads"
-Name your attribute "tags"
-In the "Format" dropdown select "Text"
-Enter a description if you wish.
-Press "Save"

6. Run the project.  Be sure your example server is up so the app can get an access token.  You can run the app on the simulator, but will not be able to use the device camera (obviously).

7. Enjoy!
