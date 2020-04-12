import 'package:mobx/mobx.dart';
part 'categoria.g.dart';

class Categoria = _CategoriaBase with _$Categoria;

abstract class _CategoriaBase with Store {
  @observable
  String id;
  @observable
  String descricao;
  @observable
  String foto;
  @observable
  String criadoEm;

  _CategoriaBase({this.id, this.descricao, this.foto});

  _CategoriaBase.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    descricao = json['descricao'];
    foto = json['foto'];
    criadoEm = json['criadoEm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['descricao'] = this.descricao;
    data['foto'] = this.foto;
    return data;
  }
}
