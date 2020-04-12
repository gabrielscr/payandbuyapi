import 'package:mobx/mobx.dart';
part 'produto.g.dart';

class Produto = _ProdutoBase with _$Produto;

abstract class _ProdutoBase with Store {
  @observable
  String id;
  @observable
  String nome;
  @observable
  String descricaoCurta;
  @observable
  String descricaoLonga;
  @observable
  String valor;
  @observable
  String banner;
  @observable
  bool disponivel;
  @observable
  List<dynamic> fotos;
  @observable
  int quantidade;
  @observable
  bool promocao;
  @observable
  String valorPromocao;
  @observable
  String criadoEm;

  _ProdutoBase(
      {this.nome,
      this.descricaoCurta,
      this.descricaoLonga,
      this.valor,
      this.banner,
      this.disponivel,
      this.fotos,
      this.quantidade,
      this.promocao,
      this.valorPromocao,
      this.criadoEm});

  _ProdutoBase.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    criadoEm = json['criadoEm'];
    nome = json['nome'];
    descricaoCurta = json['descricaoCurta'];
    descricaoLonga = json['descricaoLonga'];
    valor = json['valor'];
    banner = json['banner'];
    disponivel = json['disponivel'];
    fotos = json['fotos'];
    quantidade = json['quantidade'];
    promocao = json['promocao'];
    valorPromocao = json['valorPromocao'] != null
        ? json['valorPromocao']
        : json['valorPromocao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricaoCurta'] = this.descricaoCurta;
    data['descricaoLonga'] = this.descricaoLonga;
    data['valor'] = this.valor;
    data['banner'] = this.banner;
    data['disponivel'] = this.disponivel;
    data['fotos'] = this.fotos;
    data['quantidade'] = this.quantidade;
    data['promocao'] = this.promocao;
    data['valorPromocao'] = this.valorPromocao;
    return data;
  }
}
