import 'package:flutter/material.dart';
import 'package:aplicacion2/screens/register_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Logo fijo y posicionado en la parte superior, centrado horizontalmente.
///
/// Este widget muestra el logo SVG blanco con tamaño 130x130.
Widget logo() {
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: SvgPicture.asset(
      'assets/logo.svg',
      height: 130.0,
      width: 130.0,
      color: Colors.white,
    ),
  );
}


/// Botón personalizado con ícono SVG y texto, reutilizable en la pantalla  de bienvenida.
///
/// [nombreImagen] es la ruta del ícono SVG.
/// [acronimo] es el texto mostrado debajo del ícono.
/// [context] es el contexto de la app.
/// [jsonStrings] es el mapa de traducciones para la navegación.

Widget customIconButton({
  required String nombreImagen,
  required String acronimo,
  required BuildContext context,
  required Map<String, dynamic> jsonStrings,
}) {
  return InkWell(

    child: SizedBox(
      width: 130,
      height: 130,
      child: Card(
        margin: const EdgeInsets.all(10.0),
        elevation: 9.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              nombreImagen,
              width: 45,
              height: 45,
              color: const Color.fromARGB(255, 111, 38, 59),
            ),
            Text(
              acronimo,
              style: const TextStyle(
                color: Color.fromARGB(255, 111, 38, 59),
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    ),    
    onTap: () {
      print("Click en $acronimo");
      if (acronimo == "Registro" || acronimo == "Register") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(jsonStrings: jsonStrings),
          ),
        );
      }
      // Podemos agregar más condiciones de navegación aquí
    },
  );
}



/// Campo de texto reutilizable con validación de error y soporte multilenguaje.
/// 
/// [controller]: controlador del campo.
/// [label]: texto que aparece como etiqueta.
/// [hasError]: indica si se debe mostrar el mensaje de error.
/// [jsonStrings]: mapa de traducciones para el mensaje de error.
Widget buildField(TextEditingController controller, String label, bool hasError, Map<String, dynamic> jsonStrings) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 14), // Tamaño de texto más pequeño
        decoration: InputDecoration(
          isDense: true, // Hace el campo más delgado
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 14),
        ),
      ),
      if (hasError)
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            jsonStrings['mandatory_field'],
            style: const TextStyle(color: Color.fromARGB(255, 80, 39, 51), fontSize: 12),
          ),
        ),
      const SizedBox(height: 14.0),
    ],
  );
}


/// Widget auxiliar para mostrar un elemento de lista con viñeta (bullet) para la pantalla Fotografía.
///
/// Este widget se utiliza en la vista de Fotografía para mostrar texto
/// acompañado de un punto al inicio (•), simulando una lista con bullets.
///
/// El [text] es el contenido que se mostrará al lado del bullet.
Widget bulletItem(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 0.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            fontSize: 18.0,
            color: Color.fromARGB(255, 111, 38, 59),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 111, 38, 59),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

