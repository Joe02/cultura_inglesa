import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormInput extends StatefulWidget {
  final title;
  final hint;
  final icon;
  final type;
  final updatableInputFunction;

  CustomFormInput(
      this.title, this.hint, this.icon, this.type, this.updatableInputFunction);

  @override
  CustomFormInputState createState() => CustomFormInputState();
}

class CustomFormInputState extends State<CustomFormInput> {
  final _customInputController = TextEditingController();
  var _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: widget.title == ""
                  ? Container()
                  : Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            elevation: 5,
            child: TextFormField(
              obscureText: _obscureText,
              onChanged: (value) {
                setState(() {
                  widget.updatableInputFunction(value);
                });
              },
              controller: _customInputController,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hint,
                hintStyle: TextStyle(fontSize: 19, color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 12.5),
                prefixIcon: Icon(widget.icon,
                    color: _customInputController.text == ""
                        ? Colors.grey[600]
                        : Colors.blue),
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (widget.type == "Text") {
                      setState(() {
                        _customInputController.clear();
                      });
                    } else {
                      setState(
                        () {
                          _obscureText = !_obscureText;
                        },
                      );
                    }
                  },
                  child: widget.type == "Text"
                      ? Icon(
                          Icons.clear,
                          color: _customInputController.text == ""
                              ? Colors.grey[600]
                              : Colors.blue,
                        )
                      : Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _customInputController.text == ""
                              ? Colors.grey[600]
                              : Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
