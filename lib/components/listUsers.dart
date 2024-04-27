List<Map<String, dynamic>> listUsers = [];

void addUser(String username, String password) {
  listUsers.add({
    "username": username,
    "password": password,
  });
}
