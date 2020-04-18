import 'package:mobx/mobx.dart';
part 'favorito.g.dart';

class Favorito = _FavoritoBase with _$Favorito;

abstract class _FavoritoBase with Store {
  @observable
  String id;
  @observable
  String nome;
  @observable
  String valor;
  @observable
  String banner;

  _FavoritoBase({
    this.nome,
    this.valor,
    this.banner,
  });

  _FavoritoBase.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    nome = json['nome'];
    valor = json['valor'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['valor'] = this.valor;
    data['banner'] = this.banner;
    return data;
  }
}
