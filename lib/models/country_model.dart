import 'localities_model.dart';

class Country {
  final String code;
  final String name;
  final List<Locality> localities;

  Country({required this.code, required this.name, required this.localities});
}