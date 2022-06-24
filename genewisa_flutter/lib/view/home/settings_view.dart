import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:genewisa_flutter/view/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../api/api.dart';
import '../../theme/genewisa_theme.dart';
import '../widget/setting_text_field.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsView();
}

class _SettingsView extends State<SettingsView> {
  final _formKey = GlobalKey<FormState>();
  String? username, firstName, lastName;
  TextEditingController namaController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordlamaController = TextEditingController();
  TextEditingController passwordbaruController = TextEditingController();

  _showMsg(msg, Color clr) {
    //
    final snackBar = SnackBar(
      backgroundColor: clr,
      content: Text(msg, style: GenewisaTextTheme.textTheme.headline4),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Tutup',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {
      'token': localStorage.getString('token'),
      'username': localStorage.getString('username')
    };

    var res = await CallApi().getData(data, 'user/' + (data['username'] ?? ''));
    var body = json.decode(res.body);
    localStorage.setString('first_name', body['data']['first_name']);
    localStorage.setString('last_name', body['data']['last_name']);

    setState(() {
      username = localStorage.getString('username');
      firstName = localStorage.getString('first_name');
      lastName = localStorage.getString('last_name');
    });
    namaController =
        TextEditingController(text: '$firstName $lastName');
    usernameController =
        TextEditingController(text: username);
  }

  @override
  void initState() {
    getUser();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: 100,
        title: Row(
          children: <Widget>[
            IconButton(
              iconSize: 35,
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Settings',
              style: GenewisaTextTheme.textTheme.headline2,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.black,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images-ext-1.discordapp.net/external/8cWjK0gRjXAALR4npR2qYFVscpnJEkFoyWBAVQszngQ/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/707445135318974515/93ac9643a293a7ae11b3375beb63fc44.png?width=480&height=480"),
                      radius: 98,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SettingTextField(
                          hintText: "Nama lengkap",
                          textController: namaController),
                      SettingTextField(
                          hintText: "Username",
                          textController: usernameController),
                      SettingTextField(
                          hintText: "Password Lama",
                          textController: passwordlamaController),
                      SettingTextField(
                          hintText: "Password Baru",
                          textController: passwordbaruController),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 140,
            height: 53,
            decoration: GenewisaTheme.cancelButtonContainer(),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: GenewisaTheme.geneButton(),
              child: Text(
                'Batal',
                style: GenewisaTextTheme.textTheme.button,
              ),
            ),
          ),
          Container(
            width: 140,
            height: 53,
            decoration: GenewisaTheme.buttonContainer(),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _update();
                }
              },
              style: GenewisaTheme.geneButton(),
              child: Text(
                _isLoading ? 'Memperbaharui akun...' : 'Simpan',
                style: GenewisaTextTheme.textTheme.button,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _update() async {
    setState(() {
      _isLoading = true;
    });
    List<String> name = namaController.text.split(" ");
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var firstName, lastName;
    firstName = name[0];
    if (name.length > 1) {
      lastName = name.sublist(1, name.length).join(" ");
    }

    var data = {
      'username': usernameController.text,
      'first_name': firstName,
      'last_name': lastName,
      'passwordlama': passwordlamaController.text,
      'passwordbaru': passwordbaruController.text,
    };

    var res = await CallApi().putData(data, 'user/' + (localStorage.getString('username') ?? ''));
    var body = json.decode(res.body);
    if (body['status'] == 'OK') {
      localStorage.setString('username', body['data']['username']);
      _showMsg("Berhasil memperbaharui", Colors.green);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    } else {
      _showMsg(body['error'][0], Colors.red);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
