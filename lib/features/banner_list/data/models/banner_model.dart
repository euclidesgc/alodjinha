import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required int id,
    required String linkUrl,
    required String urlImagem,
  }) : super(id: id, linkUrl: linkUrl, urlImagem: urlImagem);

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'],
        linkUrl: json['linkUrl'],
        urlImagem: json['urlImagem'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'linkUrl': linkUrl,
        'urlImagem': urlImagem,
      };
}
