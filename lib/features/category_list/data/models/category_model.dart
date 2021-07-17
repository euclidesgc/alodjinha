import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required id,
    required descricao,
    required urlImagem,
  }) : super(id: id, descricao: descricao, urlImagem: urlImagem);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        descricao: json['descricao'],
        urlImagem: json['urlImagem'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'descricao': descricao,
        'urlImagem': urlImagem,
      };
}
