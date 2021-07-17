import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final int id;
  final String linkUrl;
  final String urlImagem;

  BannerEntity({
    required this.id,
    required this.linkUrl,
    required this.urlImagem,
  });

  @override
  List<Object?> get props => [id, linkUrl, urlImagem];
}
