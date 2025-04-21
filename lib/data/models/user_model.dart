class UserModel{
  final String name;
  final String about;
  final String number;
  final String image;

  UserModel({
    required this.name,
    required this.about,
    required this.number,
    required this.image,
  });

  factory UserModel.fromJson(Map<String,dynamic> map){
    return UserModel(
      name: map['name'] ?? 'name', 
      about: map['about'] ?? 'about',  
      number: map['number'] ?? 'number',
      image: map['image'] ?? 'image',
      );
  }

  Map<String,dynamic> toMap() {
    return {
      'name': name,
      'about': about,
      'number': number,
      'image': image,
    };
  }
}