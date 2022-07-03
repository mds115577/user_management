class DataModel {
  String? image;
  String? uid;
  String? email;
  String? Name;
  String? age;
  String? Number;
  DataModel(
      {this.image, this.uid, this.email, this.Name, this.age, this.Number});
  factory DataModel.fromMap(map) {
    return DataModel(
      image: map['image'],
      uid: map['uid'],
      email: map['email'],
      Name: map['Name'],
      age: map['age'],
      Number: map['Number'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'uid': uid,
      'email': email,
      'Name': Name,
      'age': age,
      'Number': Number
    };
  }
}
