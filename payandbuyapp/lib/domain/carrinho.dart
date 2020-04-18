class Carrinho {
  int id;
  List<Itens> itens;
  double calculoItens;

  Carrinho({this.id, this.itens, this.calculoItens});

  Carrinho.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['itens'] != null) {
      itens = new List<Itens>();
      json['itens'].forEach((v) {
        itens.add(new Itens.fromJson(v));
      });
    }
    calculoItens = json['calculoItens'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.itens != null) {
      data['itens'] = this.itens.map((v) => v.toJson()).toList();
    }
    data['calculoItens'] = this.calculoItens;
    return data;
  }
}

class Itens {
  String id;
  String nome;
  String codigo;
  String valor;
  String banner;
  int quantidade;
  String valorBruto;

  Itens(
      {this.id,
      this.nome,
      this.codigo,
      this.valor,
      this.banner,
      this.quantidade,
      this.valorBruto});

  Itens.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    nome = json['nome'];
    valor = json['valor'];
    banner = json['banner'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['nome'] = this.nome;
    data['valor'] = this.valor;
    data['banner'] = this.banner;
    data['quantidade'] = this.quantidade;
    return data;
  }
}
