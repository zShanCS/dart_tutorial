void main(List<String> args) {}

class PhoneBook {
  static final List<List<String>> directory = [[/*name*/], [/*phones*/]];
  static final Map<String, String> name_to_phone = {};
  static final Map<String, String> phone_to_name = {};

  String get_phone_by_name(String name) {
    if (name_to_phone.containsKey(name)) throw Exception('No name found');
      return name_to_phone[name] ?? '';
  }
  String get_name_by_phone(String phone) {
    if (!phone_to_name.containsKey(phone)) throw Exception('No phone number found');
    return phone_to_name[phone] ?? '';
  }

  static void save(String name, String phone){
    if (name_to_phone.containsKey(name) && phone_to_name.containsKey(phone)) throw Exception('The Name and Phone Pair already exists');
    //now we know phone and name does not  already exists
    directory[0].add(name);
    directory[1].add(phone);
    name_to_phone[name] = phone;
    phone_to_name[phone] = name;
  }
}
