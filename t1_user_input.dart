import 'dart:convert';
import 'dart:io';

void main() {
  print('Welcome User. Please Enter Your Name.');
  String? name = stdin.readLineSync();
  greet(name);
}

void greet(String? name) {
  if (name == null || name == '') {
    name = 'guest';
  }
  print('hello $name, "Welcome to Flutter"');
}
