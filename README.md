# Location Trivia Data Manager

## Goals

1. Understand how to set up a shared instance.
1. Use a shared instance to hold data to be accessed from multiple view controllers.

## Review

A shared instance has a special initializer that only allows its class object to create a single instance in the lifespan of the application, with any subsequent calls to the initializer pointing to the one instance already instantiated. You'll often hear this referred to as a "singleton." The practical value of this special ability permits this one shared instance (and whatever data it holds onto) to be accessed by various other objects in your program. This is very useful for organizing your application's data into one place--hence the designation in this case of "Data Manager."

The `dispatch_once` token is what permits this behavior. It's kind of like a punch card that reads 'admit one.' It retains all of its identifying information, but won't permit the application to run the block more than once. In the current case, that means only instantiating the shared instance one time. The code that Apple provides for creating such a shared instance is this somewhat cryptic set of code: 

```objc
+ (instancetype)shared<#name#> {
    static <#class#> *_shared<#name#> = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared<#name#> = <#initializer#>;
    });

    return _shared<#name#>;
}
```

In the scope of this lab we're going to call this class `FISLocationsDataManager` meaning we need to fill out the placeholders in this provided code as follows:

```objc
+ (instancetype)sharedLocationsDataManager {
    static FISLocationsDataManager *_sharedLocationsDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedLocationsDataManager = [[FISLocationsDataManager alloc] init];
    });

    return _sharedLocationsDataManager;
}
```
You'll notice that it's calling an initializer which we need to customize. Since we want our data store to hold our `FISLocation` objects, let's give it a property that's an `NSMutableArray` called 'locations' and instantiate it in the initializer.

```objc
FISLocationsDataManager.h

@property (strong, nonatomic) NSMutableArray *locations;
```

```objc
FISLocationsDataManager.m

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locations = [[NSMutableArray alloc] init];
    }
    return self;
}
```
Now that we have our singleton class set up, we can access it from any view controller by calling the `shared<#name#>` initializer that we previously set up.

```objc
- (void)viewDidLoad {
	[super viewDidLoad];
	
    FISLocationsDataManager *locationsDataManager = 
        [FISLocationsDataManager sharedLocationsDataManager];
}
```
While it isn't necessary to, it is also possible to set a shared instance as a property within another class.

This next lab already has these steps set up for you. Take a moment to look over the data manager's files to see how they're laid out, then solve the lab by connecting a new view controller to the data manager.

## Instructions

  1. Create a new `UIViewController` for making `FISLocation` objects called `FISAddLocationViewController`. 
  2. Segue to this new view controller by adding a `UIBarButtonItem` with style 'Add' (the plus sign) on your `FISLocationsTableViewController`. **Make it a `modal` segue.**
     - make an outlet for your bar button, and in `viewDidLoad`, set it's `accessibilityLabel` as "addButton" like so:
     - `self.addButton.accessibilityLabel = @"addButton"`
     - **What does this do?** This makes it so that the testing suite can access your button. *Get used to doing this.*
  3. Add three `UITextField`s to the new `FISAddLocationViewController` for setting the Name, Latitude, and Longitude properties on the `FISLocation` object to be created.
     - set their accessibility labels to `@"nameField"`, `@"latitudeField"`, and `@"longitudeField"`, respectively. If you forgot how, see the previous step.
  4. Add a `UIButton` titled "Save" to your AddLocationVC which:
   - has accessibilityLabel set to `@"saveButton"`,
  	- creates a `FISLocation` object with the data in the text fields, 
  	- pops the `FISAddLocationViewController` so that `FISLocationsTableViewController` reappears and 
  	- reloads to include displaying the new `FISLocation` object.
  5. Add another `UIButton` titled "Cancel", which simply dismisses the addLocationVC in case someone navigates in there, but doesn't want to save a new location.
    - You guessed it, set it's accessibilityLabel to `@"cancelButton"`.
  6. Run your application and make some new locations through the simulator. Watch the data get passed between your view controllers. **Run the tests!**
