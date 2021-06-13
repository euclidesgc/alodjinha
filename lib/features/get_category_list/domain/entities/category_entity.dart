import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String descricao;
  final String urlImagem;

  CategoryEntity({
    required this.id,
    required this.descricao,
    required this.urlImagem,
  });

  @override
  List<Object?> get props => [id, descricao, urlImagem];
}
