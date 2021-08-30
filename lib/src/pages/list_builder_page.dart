import 'dart:async';

import 'package:flutter/material.dart';

class ListBuilderPage extends StatefulWidget {
  ListBuilderPage({Key? key}) : super(key: key);

  @override
  _ListBuilderPageState createState() => _ListBuilderPageState();
}

class _ListBuilderPageState extends State<ListBuilderPage> {
  //Llamaremos la scroll controller que me servirar para configurar el scroll de las imagenes
  ScrollController _scrollController = ScrollController();

  List<int> _listNumbers = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();

    //Agregamos un listener del scroll
    _scrollController.addListener(() {
      //Verificamos si la posición pixeles del scroll ha llegado al limite asi carga un nuevo mas.
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    //Aqui cerramos el controller, ya que esta propiedad esta constantemente escuchando algun cambio.
    //Asi cuando salgamos de esta página,el controller se cierra y se vuelve a inciar al entrar.
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListBuilders"),
      ),
      body: Stack(children: [_createListBuilder(), _crearLoading()]),
    );
  }

  Widget _createListBuilder() {
    return RefreshIndicator(
      onRefresh: getPageReset,
      child: ListView.builder(
        //Cantidad de items que habra en nuestra lista
        padding: const EdgeInsets.all(8),
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage("assets/jar-loading.gif"),
                    image: NetworkImage(
                        "https://picsum.photos/300/300?random=$index"),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            )),
          );
        },
        // separatorBuilder: (BuildContext context, int index) => Divider(
        //   color: Colors.amber,
        // ),
      ),
    );
  }

  Future<void> getPageReset() async {
    //Este future nos servira para recargar nuevas imagenes.
    var duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _add10();
    });

    return await Future.delayed(duration);
  }

  void _add10() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }
    //Servira para actualizar el dom de forma automatica, redibujandose de esa forma el widget
    setState(() {});
  }

  Future? _fetchData() async {
    _isLoading = true;

    //Servira para actualizar el dom de forma automatica, redibujandose de esa forma el widget
    setState(() {});

    //Es parecido al setTime de javaScript, esto servira para cargar nuevs imagenes
    return new Timer(Duration(seconds: 1), _httpResponse);
  }

  void _httpResponse() {
    //Despues del segundo regresa una respuesta http
    _isLoading = false;
    //Y agregamos nuevas imagenes
    _add10();
    //Ahora con el controller scroll vamos hacer que al cargar las imagenes
    //nos muestre una parte de la imagen cargada asi mejoramos la user experience
    _scrollController.animateTo(_scrollController.position.pixels + 80,
        duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  Widget _crearLoading() {
    return _isLoading ? _loadingWidget() : Container();
  }

  Widget _loadingWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
