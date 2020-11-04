import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../utils/upper_case_text_formatter.dart';
import '../utils/prefs.dart';
import '../widgets/submit_button_widget.dart';
import '../models/profile.dart';
import '../settings/data.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profile";
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerPlate = TextEditingController();
  Profile profile =
      Profile(id: '', fullName: '', email: '', phone: '', licensePlate: '');
  bool _isSubmitButtonDisabled;

  @override
  void initState() {
    _isSubmitButtonDisabled = false;
    _readProfile();
    super.initState();
  }

  _popScreen(BuildContext context) {
    try {
      Navigator.pop(context);
      if (Navigator.of(context, rootNavigator: true).canPop()) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    } catch (e) {
      debugPrint(e);
    }
  }

  Future<void> _readProfile() async {
    var id = await Prefs.getStringF("ProfileId");
    if (id.isEmpty) id = Guid.newGuid.toString();
    var name = await Prefs.getStringF("ProfileName");
    var email = await Prefs.getStringF("ProfileEmail");
    var phone = await Prefs.getStringF("ProfilePhone");
    var plate = await Prefs.getStringF("ProfilePlate");
    setState(() {
      profile = Profile(
        id: id,
        fullName: name,
        email: email,
        phone: phone,
        licensePlate: plate,
      );
      _controllerName = TextEditingController(text: name);
      _controllerEmail = TextEditingController(text: email);
      _controllerPhone = TextEditingController(text: phone);
      _controllerPlate = TextEditingController(text: plate);
    });
  }

  Future<void> _writeProfile(BuildContext ctx) async {
    if (!_formKey.currentState.validate()) {
      return null;
    }
    FocusManager.instance.primaryFocus.unfocus();

    setState(() {
      _isSubmitButtonDisabled = true;
    });

    _formKey.currentState.save();
    await Prefs.setString("ProfileName", profile.fullName);
    await Prefs.setString("ProfileEmail", profile.email);
    await Prefs.setString("ProfilePhone", profile.phone);
    await Prefs.setString("ProfilePlate", profile.licensePlate);
    await Prefs.setString("ProfileId", profile.id);
    setState(() {
      _isSubmitButtonDisabled = false;
    });

    Alert(
        context: context,
        type: AlertType.success,
        closeIcon: Icon(Icons.ac_unit, color: Colors.white),
        title: "",
        desc: "Lorem ipsum dolor sit amet",
        buttons: [
          DialogButton(
              child: Text("OK", style: TextStyle(color: Colors.black)),
              onPressed: () {
                _popScreen(ctx);
              })
        ]).show();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(PAGENAME_5),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SAMPLE_TEXT_2,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _controllerName,
                  decoration: InputDecoration(
                    hintText: LABEL_10,
                    labelText: LABEL_10,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  onSaved: (value) {
                    setState(() {
                      profile.fullName = value;
                    });
                  },
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) return 'Suspendisse ligula nunc';
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _controllerEmail,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: LABEL_11,
                    labelText: LABEL_11,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    setState(() {
                      profile.email = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Suspendisse ligula nunc';
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _controllerPhone,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: LABEL_12,
                    labelText: LABEL_12,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    setState(() {
                      profile.phone = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Suspendisse ligula nunc';
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _controllerPlate,
                  maxLines: 1,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: LABEL_13,
                    labelText: LABEL_13,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  onSaved: (value) {
                    setState(() {
                      profile.licensePlate = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) return 'Suspendisse ligula nunc';
                  },
                ),
                SizedBox(height: 20),
                _isSubmitButtonDisabled
                    ? Container(
                        child: Text(
                          'Please Wait',
                          textAlign: TextAlign.center,
                        ),
                        width: double.infinity,
                      )
                    : SubmitButtonWidget(
                        title: SUBMIT,
                        onPressed: () {
                          _writeProfile(context);
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
