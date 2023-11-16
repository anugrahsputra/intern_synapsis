enum InputType { radioButton, multipleChoices, location }

InputType stringToInputType(String input) {
  switch (input) {
    case 'radio_button':
      return InputType.radioButton;
    case 'multiple_choices':
      return InputType.multipleChoices;
    case 'location':
      return InputType.location;
    default:
      throw ArgumentError('Invalid input type: $input');
  }
}

String inputTypeToString(InputType? inputType) {
  switch (inputType) {
    case InputType.radioButton:
      return 'radio_button';
    case InputType.multipleChoices:
      return 'multiple_choices';
    case InputType.location:
      return 'location';
    default:
      return '';
  }
}
