class Pokemon {
  final String number;
  final String name;
  final String image;
  final String height;
  final String weight;

  Pokemon({
    required this.number,
    required this.name, 
    required this.image,     
    required this.height, 
    required this.weight,});

  // Constructor used for conversion from JSON to Pokémons.
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      number: json['number'],
      name: json['name'],
      image: json['image'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}