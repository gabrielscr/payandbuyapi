import 'package:mobx/mobx.dart';
part 'categoria.g.dart';

class Categoria = _CategoriaBase with _$Categoria;

abstract class _CategoriaBase with Store {
  @observable
  int id;
  @observable
  String descricao;
  @observable
  String foto;

  _CategoriaBase({this.id, this.descricao, this.foto});

  _CategoriaBase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['foto'] = this.foto;
    return data;
  }
}
