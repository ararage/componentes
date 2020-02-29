import 'package:flutter/material.dart';
import 'dart:async';
import 'package:componentes/src/utils/utils.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarDiez();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //agregarDiez();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas ...")
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLista(){
    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child:ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage("https://i.picsum.photos/id/$imagen/500/300.jpg"),
            placeholder: AssetImage("assets/jar-loading.gif"),
            fadeInDuration: Duration(milliseconds: 200),
          );
        },
      )
    );
  }

  Widget _crearLoading(){
    if(_isLoading){
      //return CircularProgressIndicator();
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    }else{
      return Container();
    }
  }

  void _agregarDiez(){
    setState(() {
      for(final i in range(1,10)){
        _ultimoItem++;
        _listaNumeros.add(_ultimoItem);
      }
    });
  }

  Future<Null> obtenerPagina() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiez();
    });
    return Future.delayed(duration);
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration( seconds: 2 );
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregarDiez();
  }

}