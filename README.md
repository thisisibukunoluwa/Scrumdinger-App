# notes

## Schemes

An Xcode scheme defines a collection of targets to build, a configuration to use when building, and a collection of tests to execute.

## Compose Views

Views define a piece of your user interface. They’re the building blocks of your app. You build a complex view by composing it of small, simple views. I

## Modifiers

To customize a SwiftUI view, you call methods known as modifiers. Each modifier returns a new view. You can use multiple modifiers on a single view. To chain modifiers, stack them vertically.

## Swift File created from terminal not being added to project

When you create a new Swift file using the touch command in your terminal, the file is created on the file system, but it is not automatically added to the Xcode project. To make the newly created Swift file visible and accessible in the Xcode project, you need to follow these steps:

Open Xcode and navigate to your project workspace.

In the Project Navigator (usually located on the left-hand side), right-click on the folder where you want to add the Swift file (e.g., "Sources" folder or a group folder).

Select "Add Files to 'Your Project Name'..."

A file dialog will appear. Navigate to the directory where you created the Swift file using the touch command.

Select the Swift file you created and click "Add."

The Swift file will now be added to your Xcode project, and you should see it in the Project Navigator. You can now work on the Swift file within Xcode and include it in your project as needed.

## How you create a SwiftUI app

You create a SwiftUI app by declaring a structure that conforms to the App protocol. The app’s body property returns a Scene that contains a view hierarchy representing the primary user interface for the app.

## Note

When an Item conforms to Identifiable, the id argument isn’t necessary.

## ForEach 

ForEach is a ViewBuilder that computes views on demand from an underlying collection of data.

## Managing data flow between views 

We use @State and binding to ensure that our user interface reflects the current state of our dpps 
data 
To avoid data inconsistency we need a single source of truth for each data element in the app 

State
When you declare a property as a @State, you create a source of truth within your view. The system identifies all elements of a view that depend on the value of a @State property.

User interactions might change your @State property. The system renders a new version of the user interface by updating any views that depend on that property.
When a @State property value changes, the system automatically redraws the view using the updated values of the property.
Delare state properties as provate so you can only access them in the view you define them 
Binding 
A property that you wrap with @Binding shares read and write access with an existing source of truth, like a @State property. A @Binding doesn’t store the data directly. Instead, it creates a two-way connection between an existing source of truth and a view that displays and updates that data. This connection ensures that multiple views associated with a piece of data are in sync.

## getters and setters 
You can provide an argument to the setter to name the newly set value. If you omit the argument, the setter uses newValue as the default name.


## modal views 

Modal views remove users from the main navigation flow of the app. Use modality for short, self-contained tasks.


## Binding and single source of truth 

Try to maintain a single source of truth for every piece of data in your app. Instead of creating a new source of truth for the theme picker, you’ll use a binding that references a theme structure defined in the parent view.

You can use the constant(_:) type method to create a binding to a hard-coded, immutable value. Constant bindings are useful in previews or when prototyping your app’s user interface.

@State to create a source of truth for a value type, and you use @Binding to share write access to a state with other views. 


## constant binding

Use a constant binding to create a binding to an immutable value.

You can use bindings to pass data to different views that need to mutate it
