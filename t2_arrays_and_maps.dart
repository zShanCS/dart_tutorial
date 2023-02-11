import 'dart:io';

void main() {
  List<int> nums_array = [1, 2, 3, 4, 5];
  Set<String> strings_set = {'a', 'b', 'c', 'd'};
  print("Starting vlaues...");
  print(nums_array);
  print(strings_set);
  int diff = strings_set.length - nums_array.length;

  if (diff > 0) {
    print('string set is larger by ${diff}, padding array');
    for (var i = 0; i < diff; i++) {
      nums_array.add(0);
    }
  } else if (diff < 0) {
    print('array length is larger by ${diff.abs()}, removing elements');
    for (var i = 0; i < diff.abs(); i++) {
      nums_array.remove(nums_array.last);
    }
  } else {
    print('Both are Equal');
  }

  print("Final vlaues...");

  print(nums_array);
  print(strings_set);

  print('\n\nNow they are same length... so we create a map.');

  Map<int, String> int_to_string = {};
  for (var i = 0; i < nums_array.length; i++) {
    int_to_string[nums_array[i]] = strings_set.elementAt(i);
  }

  print('\n\n Int to String Map is:');
  print(int_to_string);

  print('\n\nReversed:');

  Map<String, int> string_to_int = {};

  for (int key in int_to_string.keys) {
    if (int_to_string.containsKey(key)) {
      string_to_int[int_to_string[key] ?? ''] = key;
    }
  }

  print(string_to_int);
}
