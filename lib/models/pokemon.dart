class Pokemon {
  final String number;
  final String name;
  final String image;
  final String height;
  final String weight;
  final List<String> type;
  final List<String> weaknesses;

  Pokemon({
    required this.number,
    required this.name, 
    required this.image,     
    required this.height, 
    required this.weight, 
    required this.type,
    required this.weaknesses});

  // Constructor used for conversion from JSON to Pokémons.
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      number: json['number'],
      name: json['name'],
      image: json['image'],
      height: json['height'],
      weight: json['weight'],
      type: List<String>.from(json['type'].map((pokemonType) => pokemonType)),
      weaknesses: List<String>.from(json['weaknesses'].map((pokemonWeakness) => pokemonWeakness)),
    );
  }
}