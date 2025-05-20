import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'welcome_page.dart';
import 'package:aplicacion2/widgets/custom_widgets.dart';

/// Página principal de inicio de sesión de la aplicación.
///
/// Esta pantalla muestra un formulario para que el usuario ingrese su correo
/// electrónico y contraseña, con validaciones de campos obligatorios. También
/// permite alternar la visibilidad de la contraseña y recordar la sesión.
///
/// Si el formulario es válido, redirige a [WelcomePage].
class MyHomePage extends StatefulWidget {
  /// Diccionario de traducciones para internacionalización.
  final Map<String, dynamic> jsonStrings;

  /// Constructor de la clase `MyHomePage`.
  const MyHomePage({super.key, required this.jsonStrings});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// Estado asociado a [MyHomePage].
///
/// Administra la visibilidad de la contraseña, validación del formulario
/// y el comportamiento del botón "Recordarme".
class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _rememberMe = true;

  /// Alterna la visibilidad del campo de contraseña.
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final jsonStrings = widget.jsonStrings;
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('¿Deseas salir?'),
            content: const Text('¿Quieres cerrar la aplicación?'),
            actions: [
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: const Text('Salir'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: Scaffold(
        /*
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
        ),
        */
        backgroundColor: const Color.fromARGB(255, 80, 39, 51),
        body: Column(
          children: [
            /// Logo en la parte superior
            logo(),

            /// Contenido principal con scroll adaptable
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      /// Contenedor blanco principal
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        padding: const EdgeInsets.all(20.0),
                        width: 320,
                        height: 550,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 70),
                              Text(jsonStrings['welcome'], style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20.0),
                              Text(jsonStrings['login'], style: const TextStyle(fontSize: 25.0)),
                              const SizedBox(height: 25.0),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: jsonStrings['email'],
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return jsonStrings['mandatory_field'];
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: jsonStrings['password'],
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      ),
                                      onPressed: _togglePasswordVisibility,
                                    ),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return jsonStrings['mandatory_field'];
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                    activeColor: const Color.fromARGB(255, 185, 140, 87),
                                  ),
                                  Text(jsonStrings['remember_me'], style: const TextStyle(fontSize: 15.0)),
                                ],
                              ),
                              const SizedBox(height: 25.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 185, 140, 87),
                                  foregroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(3)),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('Formulario válido');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => WelcomePage(jsonStrings: jsonStrings)),
                                      (route) => false,
                                    );
                                  }
                                },
                                child: Text(jsonStrings['access']),
                              ),
                              const SizedBox(height: 25.0),
                              Text(jsonStrings['forgot_password'], style: const TextStyle(fontSize: 15.0)),
                            ],
                          ),
                        ),
                      ),

                      /// Ícono SVG flotante
                      Positioned(
                        top: 0,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: const Color.fromARGB(255, 80, 39, 51),
                          ///Tamaño del icono svg
                          child: SvgPicture.asset('assets/icono.svg', height: 135.0, width: 135.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
