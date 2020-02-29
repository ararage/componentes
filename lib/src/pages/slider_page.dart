import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;

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
            Expanded(
            child:_crearImagen())
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
      onChanged: (double value) { 
        setState(() {
          _valorSlider = value;
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