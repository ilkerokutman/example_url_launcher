import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../utils/upper_case_text_formatter.dart';
import '../settings/data.dart';
import '../utils/network.dart';
import '../utils/utils.dart';
import '../widgets/submit_button_widget.dart';

class QueryScreen extends StatefulWidget {
  static const routeName = "/query";
  QueryScreen({Key key}) : super(key: key);

  @override
  _QueryScreenState createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerPlate = TextEditingController();
  bool _inProgress = false;
  bool _isSubmitButtonDisabled = false;
  bool _isResultsHidden = true;
  String resultText = SAMPLE_TEXT_4;
  String _plate = "";

  Future<void> _queryPlate() async {
    if (!_formKey.currentState.validate()) {
      return null;
    }
    FocusManager.instance.primaryFocus.unfocus();
    setState(() {
      _inProgress = true;
      // _isSubmitButtonDisabled = true;
      _isResultsHidden = true;
    });
    _formKey.currentState.save();
    if (!await Utils.instance.isConnected()) {
      Toast.show("Please check your internet connection.", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      setState(() {
        // _isSubmitButtonDisabled = false;
        _inProgress = false;
      });
    } else {
      var queryResponse = await NetworkHelper.instance.query(_plate);

      setState(() {
        if (queryResponse.isEmpty) {
          resultText = SAMPLE_TEXT_4;
        } else {
          resultText = queryResponse;
        }
        _isResultsHidden = false;
        // _isSubmitButtonDisabled = false;
        _inProgress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(PAGENAME_3),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _inProgress,
        dismissible: false,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    SAMPLE_TEXT_3,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _controllerPlate,
                    decoration: InputDecoration(
                      hintText: LABEL_14,
                      labelText: LABEL_14,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    onSaved: (value) {
                      setState(() {
                        _plate = value;
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
                  _isSubmitButtonDisabled
                      ? (Container(
                          child: Text(
                            'Please Wait',
                            textAlign: TextAlign.center,
                          ),
                        ))
                      : (SubmitButtonWidget(
                          onPressed: () {
                            _queryPlate();
                          },
                          title: QUERY,
                        )),
                  SizedBox(height: 20),
                  _isResultsHidden
                      ? (Container())
                      : (Container(
                          width: double.infinity,
                          color: Color.fromRGBO(247, 247, 247, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(resultText),
                          ),
                        ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
