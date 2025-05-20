import 'package:aplicacion2/widgets/custom_widgets.dart';
import 'package:aplicacion2/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aplicacion2/models/userdata.dart';
import 'personal_page.dart';
import 'account_page.dart';
import 'adress_page.dart';
import 'photo_page.dart';

/// Página de registro que permite al usuario navegar hacia
/// distintas secciones del formulario de registro.
///
/// Esta clase despliega un conjunto de botones visuales con íconos,
/// cada uno de los cuales dirige a una pantalla específica:
/// datos personales, cuenta, dirección y fotografía.
class RegisterPage extends StatefulWidget {
  final Map<String, dynamic> jsonStrings;

  /// Constructor de [RegisterPage].
  ///
  /// Requiere [jsonStrings] para mostrar los textos en el idioma correspondiente.
  const RegisterPage({super.key, required this.jsonStrings});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Banderas para controlar si ya se completó cada sección
  bool _completedPersonal = false;
  bool _completedAccount = false;
  bool _completedAdress = false;
  bool _completedPhoto = false;

  @override
    void dispose() {
      // Limpiar los datos al salir de la pantalla de registro
      UserData.clear();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    final jsonStrings = widget.jsonStrings;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 39, 51),
      body: Stack(
        children: <Widget>[
          ///Implementamos el logo en la parte superior de la pantalla
          logo(),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 320,
                      height: 650,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.99),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            jsonStrings['register'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 111, 38, 59),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Pantera.svg',
                                width: 45,
                                height: 45,
                                color: const Color.fromARGB(255, 111, 38, 59),
                              ),
                              const SizedBox(width: 20.0),
                              Text(
                                jsonStrings['name_register'],
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 111, 38, 59),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            height: 1.4,
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 111, 38, 59),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ///Stack que contiene la barra de fondo, el progreso y los círculos encima
                              ///Stack que contiene la barra vertical y los círculos encima (sin animación de progreso)
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ///Barra vertical estática (sin progreso)
                                  Container(
                                    height: 270,
                                    width: 15.0,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 228, 211, 191), // Color fijo
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  ///Círculos de avance encima de la barra
                                  SizedBox(
                                    height: 270,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: List.generate(4, (index) {
                                        bool isCompleted = false;
                                        switch (index) {
                                          case 0: isCompleted = _completedPersonal; break;
                                          case 1: isCompleted = _completedAccount; break;
                                          case 2: isCompleted = _completedAdress; break;
                                          case 3: isCompleted = _completedPhoto; break;
                                        }
                                        return SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 25,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: isCompleted
                                                      ///Color final
                                                      ? const Color.fromARGB(255, 211, 183, 150)
                                                      ///Color inicial
                                                      : const Color.fromARGB(255, 228, 211, 191),
                                                ),
                                              ),
                                              if (isCompleted)
                                                const Icon(
                                                  Icons.check,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30.0),
                              Column(
                                children: [
                                  _buildIconButton('assets/Usuario.svg', jsonStrings['personal'], context),
                                  const SizedBox(height: 25.0),
                                  _buildIconButton('assets/Correo.svg', jsonStrings['account'], context),
                                  const SizedBox(height: 25.0),
                                  _buildIconButton('assets/add.svg', jsonStrings['adress'], context),
                                  const SizedBox(height: 25.0),
                                  _buildIconButton('assets/Fotografia.svg', jsonStrings['photo'], context),
                                ],
                              ),
                              const SizedBox(width: 20.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    jsonStrings['personal'],
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 111, 38, 59),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 60.0),
                                  Text(
                                    jsonStrings['account'],
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 111, 38, 59),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 60.0),
                                  Text(
                                    jsonStrings['adress'],
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 111, 38, 59),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 60.0),
                                  Text(
                                    jsonStrings['photo'],
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 111, 38, 59),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 40.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 185, 140, 87),
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(3)),
                              ),
                            ),
                            onPressed: () {
                              print("click en boton 'registrar' de la pagina Registro");
                            },
                            child: Text(jsonStrings['register_button']),
                          ),
                        ],
                      ),
                    ),
                    /// Botón de regreso en la esquina superior izquierda del contenedor blanco
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(3)),
                              color: Color.fromARGB(255, 211, 183, 150),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            iconSize: 30.0, // ← tamaño personalizado del ícono (por defecto es 24.0)
                            color: Colors.white,
                            onPressed: () {
                              UserData.clear(); // ← Limpia los datos antes de salir
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WelcomePage(jsonStrings: widget.jsonStrings)),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye un botón con ícono SVG que navega a una pantalla específica
  /// según el texto del botón ([acronimo]).
  ///
  /// [assetPath] es la ruta del ícono,
  /// [acronimo] es la clave para el texto mostrado e identificación lógica,
  /// [context] es el contexto de la navegación.

  bool _arePersonalFieldsFilled() {
    return UserData.name.isNotEmpty &&
        UserData.lastName.isNotEmpty &&
        UserData.secondLastName.isNotEmpty &&
        UserData.birthDate.isNotEmpty &&
        UserData.gender.isNotEmpty &&
        UserData.nationality.isNotEmpty;
  }

  bool _areAccountFieldsFilled() {
    return UserData.phone.isNotEmpty &&
        UserData.email.isNotEmpty &&
        UserData.username.isNotEmpty &&
        UserData.user.isNotEmpty &&
        UserData.password.isNotEmpty &&
        UserData.occupation.isNotEmpty &&
        UserData.role.isNotEmpty;
  }

  bool _areAddressFieldsFilled() {
    return UserData.zipCode.isNotEmpty &&
        UserData.state.isNotEmpty &&
        UserData.city.isNotEmpty &&
        UserData.neighborhood.isNotEmpty &&
        UserData.street.isNotEmpty &&
        UserData.extNumber.isNotEmpty &&
        UserData.intNumber.isNotEmpty &&
        UserData.reference.isNotEmpty;
  }

  Widget _buildIconButton(String assetPath, String acronimo, BuildContext context) {
    return InkWell(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 216, 216),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 35,
            height: 35,
            color: const Color.fromARGB(255, 111, 38, 59),
          ),
        ),
      ),
      onTap: () async {
        bool? completed = false;

        if (acronimo == "Personal" || acronimo == "Personal") {
          completed = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PersonalPage(jsonStrings: widget.jsonStrings)),
          );
          setState(() {
            _completedPersonal = _arePersonalFieldsFilled();
          });
        } else if (acronimo == "Cuenta" || acronimo == "Account") {
          completed = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountPage(jsonStrings: widget.jsonStrings)),
          );
          setState(() {
            _completedAccount = _areAccountFieldsFilled();
          });
        } else if (acronimo == "Dirección" || acronimo == "Address") {
          completed = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdressPage(jsonStrings: widget.jsonStrings)),
          );
          setState(() {
            _completedAdress = _areAddressFieldsFilled();
          });
        } else if (acronimo == "Fotografía" || acronimo == "Photo") {
          completed = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhotoPage(jsonStrings: widget.jsonStrings)),
          );
          setState(() {
            _completedPhoto = UserData.photoConfirmed;
          });
        }
      },
    );
  }
}
