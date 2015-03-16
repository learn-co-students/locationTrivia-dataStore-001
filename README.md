---
  tags: intermediate, tableviews, dataStore
  language: objc
---

# Location Trivia Data Store

## Instructions

  **No tests for this one**

  1. Add a new UIViewController for adding `FIsLocation` objects
  2. Add a plus `UIBarButtonItem` that segues to that VC
  3. Add three `UITextField`s to the new VC for Name, Latitude and Longitude
  4. Create a central Data Store. The code for a Data store is:

    ```
  + (instancetype)shared<#name#> {
    static <#class#> *_shared<#name#> = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared<#name#> = <#initializer#>;
    });

    return _shared<#name#>;
    }
   ```

    5. Add a Save `UIBarButtonItem` to the new VC.
    6. On save, pop the view controller to the list, reload the data on the
       main VC.
