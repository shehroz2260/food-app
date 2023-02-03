import 'package:flutter/cupertino.dart';

void hideKeyboard(context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
