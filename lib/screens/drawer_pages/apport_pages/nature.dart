import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../bottompage/bottom_page.dart';
import '../../home_page/acceuil.dart';
import '../../sidepage/side_page.dart';
import '../profileditor.dart';

class NatureScreen extends StatefulWidget {
  const NatureScreen({Key? key}) : super(key: key);

  @override
  _NatureScreenState createState() => _NatureScreenState();

}


class _NatureScreenState extends State<NatureScreen> {
  List<String> _contributions = ["Scolaire", "Appareils", "Immobilier", "Fêtes"];
  List<String> _membres = ["Jacques DOE", "Alice DOE", "Annicette DOE", "John DOE"];
  List<String> _dons = ["Riz", "Boissons", "Gâteaux", "Pâtes alimentaire", "Autres"];
  List<String> _quantity = ["1-5", "5-10", "Autres"];


  String? _selectedContrib;
  String? _selectedmember;
  String? _selecteddons;
  String? _selectedquantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        bottomOpacity: 2,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,
                  color: Color(0xFF0e3664),
                  size: 30 // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('images/logo.png', height: 77)),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Color(0xFF0e3664),
                size: 35,
              ),
              onPressed: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Color(0xFF0e3664),
                size: 37,
              ),
              onPressed: null,
            ),
          ),
        ],
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal:85.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: new Icon(
                            Icons.fastfood_outlined,
                            color: Color(0xFF0e3664),
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'Apport en nature',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF0e3664),
                            fontWeight: FontWeight.w700,

                          ),
                        ),

                      ],
                    ),
                  ),

                  Padding(padding:  EdgeInsets.all(15),

                    child: Container(

                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFe6e6e6),
                        borderRadius: BorderRadius.circular(5.5),

                      ),
                      child: DropdownButton<String>(
                        onChanged: (value) {
                          setState(() {
                            _selectedContrib = value;
                          });
                        },
                        value: _selectedContrib,

                        // Hide the default underline
                        underline: Container(),
                        hint: Center(
                            child: Text(
                              'Choisissez une contribution',textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey),
                            )),
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Color(0xFF0e3664),
                        ),
                        isExpanded: true,

                        // The list of options
                        items: _contributions
                            .map((e) => DropdownMenuItem(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          value: e,
                        ))
                            .toList(),

                        // Customize the selected item
                        selectedItemBuilder: (BuildContext context) => _contributions
                            .map((e) => Center(
                          child: Text(
                            e,textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF0e3664),
                            ),
                          ),
                        ))
                            .toList(),
                      ),
                    ),


                  ),
                  Padding(padding:  EdgeInsets.all(15),

                    child: Container(

                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFe6e6e6),
                        borderRadius: BorderRadius.circular(5.5),

                      ),
                      child: DropdownButton<String>(
                        onChanged: (value) {
                          setState(() {
                            _selectedmember = value;
                          });
                        },
                        value: _selectedmember,

                        // Hide the default underline
                        underline: Container(),
                        hint: Center(
                            child: Text(
                              'Sélectionnez les membres concernés',textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey),
                            )),
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Color(0xFF0e3664),
                        ),
                        isExpanded: true,

                        // The list of options
                        items: _membres
                            .map((e) => DropdownMenuItem(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          value: e,
                        ))
                            .toList(),

                        // Customize the selected item
                        selectedItemBuilder: (BuildContext context) => _membres
                            .map((e) => Center(
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF0e3664),

                            ),
                          ),
                        ))
                            .toList(),
                      ),
                    ),






                  ),



                  Padding(padding:  EdgeInsets.all(15),

                    child: Container(

                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFe6e6e6),
                        borderRadius: BorderRadius.circular(5.5),

                      ),
                      child: DropdownButton<String>(
                        onChanged: (value) {
                          setState(() {
                            _selecteddons = value;
                          });
                        },
                        value: _selecteddons,

                        // Hide the default underline
                        underline: Container(),
                        hint: Center(
                            child: Text(
                              'Sélectionnez le don voulu',textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey),
                            )),
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Color(0xFF0e3664),
                        ),
                        isExpanded: true,

                        // The list of options
                        items: _dons
                            .map((e) => DropdownMenuItem(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          value: e,
                        ))
                            .toList(),

                        // Customize the selected item
                        selectedItemBuilder: (BuildContext context) => _dons
                            .map((e) => Center(
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF0e3664),

                            ),
                          ),
                        ))
                            .toList(),
                      ),
                    ),






                  ),
                  Padding(padding:  EdgeInsets.all(15),

                    child: Container(

                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFe6e6e6),
                        borderRadius: BorderRadius.circular(5.5),

                      ),
                      child: DropdownButton<String>(
                        onChanged: (value) {
                          setState(() {
                            _selectedquantity = value;
                          });
                        },
                        value: _selectedquantity,

                        // Hide the default underline
                        underline: Container(),
                        hint: Center(
                            child: Text(
                              'Sélectionnez la quantité',textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey),
                            )),
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Color(0xFF0e3664),
                        ),
                        isExpanded: true,

                        // The list of options
                        items: _quantity
                            .map((e) => DropdownMenuItem(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          value: e,
                        ))
                            .toList(),

                        // Customize the selected item
                        selectedItemBuilder: (BuildContext context) => _quantity
                            .map((e) => Center(
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF0e3664),

                            ),
                          ),
                        ))
                            .toList(),
                      ),
                    ),






                  ),
                  Padding(padding:  EdgeInsets.all(15),

                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),




                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),

                        hintText: "Ecrivez quelque chose",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Color(0xFFe6e6e6),

                      ),

                    ),






                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 60),

                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editorScreen ()),
                        );
                      },
                      child: Text('Valider',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      style: ElevatedButton.styleFrom(

                        fixedSize: const Size(220, 50),
                        primary: Color(0xFF0e3664),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 15.0,
                      ),
                    ),

                  )

                ],



              ),


            ),

          ),
        ),
      ),


      bottomNavigationBar: BottomNavBarSection(),
    );
  }
}
