import 'package:flutter/material.dart';
import 'package:formulario_validacion/service/login_form_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginFormProvider(),)
      ],
      child: MaterialApp(
        title: 'Material App',
        home: Login(),
      ),
    );
  }
}

class Login extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context); 

    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: loginFormProvider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
          
          
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(hintText: 'usuario'),
                  validator: (value) {
                    return (value != null && value.isNotEmpty)
                      ? null
                      : 'Ingrese una contraseña valida';
                  },
                  onChanged: (value) => loginFormProvider.usuario = value,
                ),
          
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(hintText: 'contrsssaseña'),
                  validator: (value) {
                    return (value != null && value.isNotEmpty)
                      ? null
                      : 'Ingrese una contraseña valida';
                  },
                  onChanged: (value) => loginFormProvider.contrasenia = value,
                ),
          
                MaterialButton(
                  onPressed: loginFormProvider.isLoading
                    ? null
                    : () {
                      if(!loginFormProvider.isValidForm()) return;
          
                      loginFormProvider.isLoading = true;
                    }
                  ,
                  child: Text(loginFormProvider.isLoading ? 'Enviar a la siguiente pantalla' : 'Ingresar'), 
                ),
          
              ],
            ),
          ),
        )
      ),
    );
  }
}

