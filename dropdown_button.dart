import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options; // List of options for the dropdown
  final double width;

  const CustomDropdown({
    Key? key,
    required this.options,
    this.width = 150,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String _selectedOption = "";
  bool hasBeenPressed = false;
  late List<String> _dropdownOptions;

  @override
  void initState() {
    super.initState();
    _dropdownOptions = List.from(widget.options);
    _selectedOption = _dropdownOptions[0];
  }

  void _onTopButtonClick() {
    setState(() {
      hasBeenPressed = true;
    });
  }

  void _onOptionClick(String option) {
    setState(() {
      _selectedOption = option;
      _dropdownOptions.remove(option);
      _dropdownOptions.insert(0, option);
      // Update visibility of dropdown list (optional)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top Button
        SizedBox(
          width: widget.width,
          child: MaterialButton(
            color: Theme.of(context).colorScheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            onPressed: () => _onTopButtonClick(),
            child: SizedBox(
              child: Row(
                children: [
                  Text(_selectedOption),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ),
        // Dropdown List (Initially hidden)
        AnimatedOpacity(
          duration: const Duration(
            milliseconds: 200,
          ),
          opacity: hasBeenPressed ? 1 : 0,
          child: Visibility(
            visible: hasBeenPressed,
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _dropdownOptions
                    .map(
                      (option) => SizedBox(
                        width: widget.width,
                        child: MaterialButton(
                          color: Theme.of(context).colorScheme.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              width: 2,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              hasBeenPressed = false;
                              _onOptionClick(option);
                            });
                          },
                          child: SizedBox(
                            child: Row(
                              children: [
                                Text(option),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
