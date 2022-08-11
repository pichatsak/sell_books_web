import 'dart:math';

import 'package:flutter/services.dart';

// class ExpireCardFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // print(newValue.text);

//     String separator = "/";
//     if (newValue.text.isNotEmpty) {
//       if (newValue.text.length == 2) {
//         return TextEditingValue(
//             text: '${newValue.text}$separator',
//             selection:
//                 TextSelection.collapsed(offset: newValue.selection.end + 1));
//       } else if (newValue.text.length < 2) {
//         return newValue;
//       }
//     }
//     return newValue;
//   }
// }

class ExpireCardFormatter extends NumberInputFormatters {
  static final RegExp _digitOnlyRegex = RegExp(r'\d+');
  static final FilteringTextInputFormatter _digitOnlyFormatter =
      FilteringTextInputFormatter.allow(_digitOnlyRegex);

  final String separator;

  ExpireCardFormatter({this.separator = '/'});

  @override
  String _formatPattern(String digits) {
    StringBuffer buffer = StringBuffer();

    if (digits.length <= 2) {
      buffer.write(digits);
    } else {
      buffer.write(digits.substring(0, 2));
      buffer.write(separator);
      buffer.write(digits.substring(2));
    }
    // for (; count <= length; count += min(2, max(1, length - count))) {
    //   buffer.write(digits.substring(offset, count));
    //   if (count < length) {
    //     buffer.write(separator);
    //   }
    //   offset = count;
    // }

    return buffer.toString();
  }

  @override
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return _digitOnlyFormatter.formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return _digitOnlyRegex.firstMatch(s) != null;
  }
}

abstract class NumberInputFormatters extends TextInputFormatter {
  TextEditingValue? _lastNewValue;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    /// nothing changes, nothing to do
    if (newValue.text == _lastNewValue?.text) {
      return newValue;
    }
    _lastNewValue = newValue;

    /// remove all invalid characters
    newValue = _formatValue(oldValue, newValue);

    /// current selection
    int selectionIndex = newValue.selection.end;

    /// format original string, this step would add some separator
    /// characters to original string
    final newText = _formatPattern(newValue.text);

    /// count number of inserted character in new string
    int insertCount = 0;

    /// count number of original input character in new string
    int inputCount = 0;
    for (int i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    /// adjust selection according to number of inserted characters staying before
    /// selection
    selectionIndex += insertCount;
    selectionIndex = min(selectionIndex, newText.length);

    /// if selection is right after an inserted character, it should be moved
    /// backward, this adjustment prevents an issue that user cannot delete
    /// characters when cursor stands right after inserted characters
    if (selectionIndex - 1 >= 0 &&
        selectionIndex - 1 < newText.length &&
        !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: selectionIndex),
        composing: TextRange.empty);
  }

  /// check character from user input or being inserted by pattern formatter
  bool _isUserInput(String s);

  /// format user input with pattern formatter
  String _formatPattern(String digits);

  /// validate user input
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue);
}
