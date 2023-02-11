import 'dart:io';

void main(List<String> args) {
  PhoneBook my_phone = PhoneBook();
  my_phone.save('zshan', '03046991234');
  my_phone.save('mohsin', '03045991234');
  my_phone.save('khan', '03046997234');
  my_phone.save('dawood', '03046691234');
  my_phone.save('amal', '03046993234');
  String? choice;
  do{
    
    print('Select One number to continue. (-1 to exit)');
    print('1. Save a new Number.');
    print('2. Dialpad: Get Name from Number.');
    print('3. Contacts: Get Phone number from name.');
    print('4. Display.');
    print('-1.Exit.');
    choice = stdin.readLineSync();
    if (choice == '1'){
      print('Enter Friends Name');
      String? name = stdin.readLineSync();
      if (name == null || name == ''){
        print('escaping');
        continue;
      }
      print('Enter Friends Number');
      String? phone = stdin.readLineSync();
      if (phone == null || phone == ''){
        print('escaping');
        continue;
      }
      my_phone.save(name, phone);
    }
    if (choice == '2'){
      print('Enter Phone Number To Search For...');
      String? phone = stdin.readLineSync();
      if (phone == null || phone == ''){
        print('escaping');
        continue;
      }
      try {
        print('User"s name is: ${my_phone.get_name_by_phone(phone)}');
      } catch (e) {
        print('Not Found.');
      }
      
    }
    if (choice == '3'){
      print('Enter Friends Name To Search For...');
      String? name = stdin.readLineSync();
      if (name == null || name == ''){
        print('escaping');
        continue;
      }
      try {
        print('User"s name is: ${my_phone.get_phone_by_name(name)}');
      } catch (e) {
        print('Not Found.');
      }
    }
    if (choice == '4'){
      print(my_phone.directory);
    }
  }
  while(choice != '-1');
  
}

class PhoneBook {
   final List<List<String>> directory = [[/*name*/], [/*phones*/]];
   final Map<String, String> name_to_phone = {};
   final Map<String, String> phone_to_name = {};

  String get_phone_by_name(String name) {
    if (!name_to_phone.containsKey(name)) throw Exception('No name found');
      return name_to_phone[name] ?? '';
  }
  String get_name_by_phone(String phone) {
    if (!phone_to_name.containsKey(phone)) throw Exception('No phone number found');
    return phone_to_name[phone] ?? '';
  }
  void save(String name, String phone){
    if (name_to_phone.containsKey(name) && phone_to_name.containsKey(phone)) throw Exception('The Name and Phone Pair already exists');
    //now we know phone and name does not  already exists
    directory[0].add(name);
    directory[1].add(phone);
    name_to_phone[name] = phone;
    phone_to_name[phone] = name;
  }

  @override String toString() {
    // TODO: implement toString
    return directory.toString();
  }

}
