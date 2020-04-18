import 'package:mobx/mobx.dart';

part 'usuario.g.dart';

class Usuario = _UsuarioBase with _$Usuario;

abstract class _UsuarioBase with Store {
  String id;
  @observable
  String nome;
  @observable
  String cep;
  @observable
  String cidade;
  @observable
  String uf;
  @observable
  String fotoUrl;
  @observable
  String logradouro;
  @observable
  String numero;
  @observable
  String complemento;
  @observable
  String email;
  @observable
  String bairro;
  @observable
  String cpf;
  @observable
  String celular;
  @observable
  String ddd;
  @observable
  String dataNascimento;

  _UsuarioBase(
      {this.id,
      this.nome,
      this.cep,
      this.cidade,
      this.uf,
      this.fotoUrl,
      this.logradouro,
      this.numero,
      this.complemento,
      this.email,
      this.bairro,
      this.celular,
      this.cpf,
      this.ddd,
      this.dataNascimento});

  _UsuarioBase.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    nome = json['nome'];
    cep = json['cep'];
    cidade = json['cidade'];
    uf = json['uf'];
    fotoUrl = json['fotoUrl'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    complemento = json['complemento'];
    email = json['email'];
    bairro = json['bairro'];
    celular = json['celular'];
    cpf = json['cpf'];
    ddd = json['ddd'];
    dataNascimento = json['dataNascimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['nome'] = this.nome;
    data['cep'] = this.cep;
    data['cidade'] = this.cidade;
    data['uf'] = this.uf;
    data['fotoUrl'] = this.fotoUrl;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['email'] = this.email;
    data['bairro'] = this.bairro;
    data['dataNascimento'] = this.dataNascimento;
    data['cpf'] = this.cpf;
    data['ddd'] = this.ddd;
    data['celular'] = this.celular;
    return data;
  }
}
