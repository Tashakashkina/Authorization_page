
class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  dynamic localStoragePass = SharedPreferences.getInstance();
  dynamic localStorageName = SharedPreferences.getInstance();
