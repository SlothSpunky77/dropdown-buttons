# Dropdown Buttons
Takes a list of strings as input to stitch a dropdown.    
Optionally takes width parameter.
## Usage:
Modify the theme values in the .dart file.    
Wrap the widget with a stack and  call it in the end of the stack (so that the widget appears above everyhing else).    
Import the file and use it as follows:   
```
Stack(
  children: [
    ...
    Container(
      padding: const EdgeInsets.only(top: 33),  //used to position the widget
      child: const Align(                       //used to position the widget
        alignment: Alignment.topRight,
        child: CustomDropdown(
          options: ["Alpha", "Bravo", "Charlie"],
          width: 150,  //optional, defaults to 150
        ),
      ),
    ),
  ],
),
```
## Example:
<img src="https://github.com/SlothSpunky77/dropdown-buttons/assets/94778190/97cfff72-e11e-4973-af15-93234a85cda5" width="300" height="250">
<img src="https://github.com/SlothSpunky77/dropdown-buttons/assets/94778190/f9290496-17c5-49e6-81ef-fea5a6132bb8" width="300" height="250">
<img src="https://github.com/SlothSpunky77/dropdown-buttons/assets/94778190/80555511-3432-47f2-9f88-c79be25bed4f" width="300" height="250">

### TODO:
- Add dropdown animation
- Modify the logic of the selected value so that it gets passed/stored better
- Rewrite the logic of stacked widgets
