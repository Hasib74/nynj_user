import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/spaces/AppSpaces.dart';

typedef CountNumber = Function(int, bool);
//typedef WantedToRemove = Function(bool);

class AppCounterWidget extends StatefulWidget {
  CountNumber? countNumber;

//  WantedToRemove wantedToRemove;
  int initial;

  AppCounterWidget({
    this.countNumber,
    this.initial = 1,
  });

  @override
  _AppCounterWidgetState createState() => _AppCounterWidgetState();
}

class _AppCounterWidgetState extends State<AppCounterWidget> {
  int? _count;

  TextEditingController countTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _count = widget.initial;
    countTextController.text = _count.toString();
  }

  @override
  Widget build(BuildContext context) {
    countTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: countTextController.text.length));

    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppSpaces.spaces_width_5,
            Expanded(
              child: minusButton(),
            ),
            // Text(_count.toString()),

            Expanded(
              child: Center(
                child: TextField(
                  // maxLength: 2,
                  // maxLines: 1,
                  //

                  autofocus: false,
                  keyboardType: TextInputType.number,
                  controller: countTextController,
                  cursorHeight: 0,
                  cursorWidth: 0,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _count = 1;
                      countTextController.text = _count.toString();
                      widget.countNumber!(_count ?? 0, false);
                    }

                    setState(() {
                      _count = int.parse(value);
                    });

                    countTextController.text = _count.toString();
                    widget.countNumber!(_count ?? 0, false);
                  },

                  textAlign: TextAlign.center,
                  cursorColor: Colors.transparent,

                  enableInteractiveSelection: false,

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    // hintText: _count.toString(),
                    // hintStyle: Get.textTheme.bodyText1,

                    contentPadding: EdgeInsets.only(top: -19.5),

                    // counter: Container(),
                  ),
                ),
              ),
            ),

            Expanded(child: pluseButton()),

            AppSpaces.spaces_width_5,
          ],
        ),
      ),
    );
  }

  InkWell pluseButton() {
    return InkWell(
        onTap: () {
          setState(() {
            _count = (_count! + 1);
          });

          widget.countNumber!(_count ?? 0, false);

          countTextController.text = _count.toString();
        },
        child: Icon(
          Icons.add,
          size: 15,
        ));
  }

  InkWell minusButton() {
    return InkWell(
        onTap: () {
          if (_count! > 1) {
            setState(() {
              _count = (_count! - 1);
            });

            widget.countNumber!(_count ?? 0, false);
            //  widget.wantedToRemove(false);
          } else {
            //   widget.wantedToRemove(true);
            widget.countNumber!(_count ?? 0, true);
          }

          countTextController.text = _count.toString();
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 10,
                  height: 1,
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
            ],
          ),
        ));
  }
}
