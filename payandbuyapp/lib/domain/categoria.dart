import 'package:mobx/mobx.dart';
part 'categoria.g.dart';

class Categoria = _CategoriaBase with _$Categoria;

abstract class _CategoriaBase with Store {
  @observable
  String descricao;
  @observable
  String foto;

  _CategoriaBase({this.descricao, this.foto});

  _CategoriaBase.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['foto'] = this.foto;
    return data;
  }
}
