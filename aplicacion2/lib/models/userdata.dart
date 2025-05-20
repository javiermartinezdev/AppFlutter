/// Clase en memoria para almacenar los datos del usuario durante la sesión.
/// No persiste si la app se cierra.
class UserData {
  /// Datos personales
  static String name = '';
  static String lastName = '';
  static String secondLastName = '';
  static String birthDate = '';
  static String gender = '';
  static String nationality = '';

  /// Datos de cuenta
  static String phone = '';
  static String email = '';
  static String username = '';
  static String user = '';
  static String password = '';
  static String occupation = '';
  static String role = '';

  /// Dirección
  static String zipCode = '';
  static String state = '';
  static String city = '';
  static String neighborhood = '';
  static String street = '';
  static String extNumber = '';
  static String intNumber = '';
  static String reference = '';

  /// Foto (puede ser una ruta local o base64 más adelante)
  static bool photoConfirmed = false;

  static void clear() {
    name = '';
    lastName = '';
    secondLastName = '';
    birthDate = '';
    gender = '';
    nationality = '';
    phone = '';
    email = '';
    username = '';
    user = '';
    password = '';
    occupation = '';
    role = '';
    zipCode = '';
    state = '';
    city = '';
    neighborhood = '';
    street = '';
    extNumber = '';
    intNumber = '';
    reference = '';
    photoConfirmed = false;
  }
}
