import 'dart:io';

class UserAccount {
  String username;
  String email;
  String _password;

  UserAccount(this.username, this.email, this._password);

  void setPassword(String newPassword) {
    _password = newPassword;
  }

  bool checkPassword(String password) {
    return _password == password;
  }

  void displayUserInfo() {
    print("Username: $username");
    print("Email: $email");
  }
}

void main() {
  stdout.write("Enter password: ");
  String Password = stdin.readLineSync() ?? "";

  UserAccount account = UserAccount("student01", "student01@email.com", Password);

  print("\n--- Account Info ---");
  account.displayUserInfo();

  print("\n1. Testing correct password:");
  stdout.write("Enter password to verify: ");
  String input1 = stdin.readLineSync() ?? "";
  print("Password correct? ${account.checkPassword(input1)}");

  print("\n2. Testing incorrect password:");
  stdout.write("Enter wrong password to verify: ");
  String input2 = stdin.readLineSync() ?? "";
  print("Password correct? ${account.checkPassword(input2)}");

  print("\n3. Changing the password:");
  stdout.write("Enter new password: ");
  String newPass = stdin.readLineSync() ?? "";
  account.setPassword(newPass);
  print("Password updated successfully.");

  print("\n4. Testing the new password:");
  stdout.write("Enter password to verify: ");
  String input3 = stdin.readLineSync() ?? "";
  print("Password correct? ${account.checkPassword(input3)}");
}