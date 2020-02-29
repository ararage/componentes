import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders')
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child:_crearImagen()
            )
          ],
        ),
      ),
    );
  }

  Widget _crearSlider () {
    return Slider(
      activeColor: Colors.indigo,
      label: "Tamaño de la imagen",
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (double value) { 
        setState(() {
          _valorSlider = value;
        });
      }, 
    );
  }

  Widget _checkBox(){
    /*return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );*/
    return CheckboxListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  } 

  Widget _crearImagen(){
    return Image(
      image: NetworkImage("https://pkimgcdn.peekyou.com/a3eee43eca645ed6128a2eb56fd8e631.jpeg"),
      width: _valorSlider,
      fit: BoxFit.contain
    );
  }
} 