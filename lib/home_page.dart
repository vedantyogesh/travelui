import 'package:flutter/material.dart';
import './custom_clipper.dart';

List<String> locations = ['DELHI (DEL)', 'MUMBAI (MUM)', 'JAIPUR (JAI)'];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          TopPart(),
        ],
      ),
    );
  }
}

const TextStyle DropDownStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);

const TextStyle DropDownMenuStyle = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
);

class TopPart extends StatefulWidget {
  _TopPartState createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  var selectedLocationIndex = 0;
  var isFLightSelected = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF47D15), Color(0xFFEF772C)],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocationIndex],
                              style: DropDownStyle,
                            ),
                            Icon(Icons.keyboard_arrow_down,
                                color: Colors.white),
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(
                                  locations[0],
                                  style: DropDownMenuStyle,
                                ),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(
                                  locations[1],
                                  style: DropDownMenuStyle,
                                ),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text(
                                  locations[2],
                                  style: DropDownMenuStyle,
                                ),
                                value: 2,
                              ),
                            ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Where do you\nwant to go?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 7.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        controller: TextEditingController(
                          text: locations[selectedLocationIndex],
                        ),
                        style: DropDownMenuStyle,
                        cursorColor: Color(0xFF3791A),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(Icons.search, color: Colors.black),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                        child: ChoiceChip(
                            Icons.flight_takeoff, "FLight", isFLightSelected),
                        onTap: () {
                          setState(() {
                            isFLightSelected = true;
                          });
                        }),
                    SizedBox(height: 20.0),
                    InkWell(
                      child:
                          ChoiceChip(Icons.hotel, "Hotels", !isFLightSelected),
                      onTap: () {
                        setState(() {
                          isFLightSelected = false;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  ChoiceChip(this.icon, this.text, this.isSelected);
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)))
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              widget.icon,
              color: Colors.white,
            ),
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
