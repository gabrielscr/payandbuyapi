import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-categorias-controller.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';
import 'package:payandbuyapp/domain/categoria.dart';

class CategoriaListar extends StatefulWidget {
  @override
  _CategoriaListarState createState() => _CategoriaListarState();
}

class _CategoriaListarState
    extends ModularState<CategoriaListar, AdminCategoriasController> {
  @override
  void initState() {
    controller.listarCategorias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var categorias = controller.categorias;

      if (categorias.value == null) return Loader();

      if (categorias.error != null)
        return CustomText(
            text: 'Erro ao carregar categorias, reinicie o aplicativo.',
            fontSize: 16);

      return Container(
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          childAspectRatio: 1.3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 8,
          children: List.generate(categorias?.value?.length, (index) {
            return gridCategorias(categorias.value[index]);
          }),
        ),
      );
    });
  }

  Widget listCategorias(ObservableFuture<List<Categoria>> categorias) {
    return Container(
      child: ListView.builder(
          itemCount: categorias.value.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 1,
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      imageUrl: categorias.value[index].foto,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      placeholder: (context, url) => Center(child: Loader()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Center(
                      child: Text(categorias.value[index].descricao,
                          style: GoogleFonts.muli(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 1),
                                    blurRadius: 10)
                              ])),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget gridCategorias(Categoria categoria) {
    return InkWell(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipOval(
                child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: 50,
              height: 50,
              imageUrl: categoria.foto ??
                  "https://tshirtinbox.com.br/wp-content/uploads/2020/01/Hero-Banner-Placeholder-Dark-1024x480.png",
              placeholder: (context, url) => Loader(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
            CustomText(text: categoria.descricao, fontSize: 12),
          ],
        ),
      ),
    );
  }
}
