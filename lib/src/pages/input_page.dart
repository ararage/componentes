import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearPersona()
        ],
      )
    );
  }

  Widget _crearInput(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState((){
          _nombre = valor;
        });
      }
    );
  }

  Widget _crearEmail(){
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: Icon( Icons.alternate_email ),
            icon: Icon( Icons.email )
        ),
        onChanged: (valor) => setState(() {
          _email = valor;
        }));
  }

  Widget _crearPassword(){
    return TextField(
        obscureText:true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon( Icons.lock_open ),
            icon: Icon( Icons.lock )
        ),
        onChanged: (valor) => setState(() {
          _password = valor;
        }));
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Fecha de Nacimiento',
            labelText: 'Fecha de Nacimiento',
            suffixIcon: Icon( Icons.perm_contact_calendar ),
            icon: Icon( Icons.calendar_today )
        ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        }
    );
  }

  _selectDate(BuildContext context){}

  Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre es : $_nombre'),
      subtitle: Text('Email es : $_email'),
    );
  }
}