class UserModel {
  String? email;
  String? name;
  String? password;
  String? phone;
  String? id;
  String? token;
  String? image;

  UserModel(
      {this.email,
      this.name,
      this.password,
      this.phone,
      this.id,
      this.token,
      this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    id = json['id'];
    token = json['token'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'id': id,
      'image': image,
    };
  }
}
