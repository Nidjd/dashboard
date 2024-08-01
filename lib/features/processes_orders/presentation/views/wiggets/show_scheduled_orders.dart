import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShowScheduledOrders extends StatelessWidget {
  ShowScheduledOrders({super.key});
  var name;
  var suburb;
  var street;

  Future<String> getReverseGeocoding(double latitude, double longitude) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latitude&lon=$longitude');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final displayName = data['display_name'] as String;
      final addressParts = displayName.split(', ');
      name = addressParts[0];
      suburb = addressParts[1];
      street = addressParts[2];
      print(name);
      print(suburb);
      print(street);
      return '$name, $suburb, $street';
    } else {
      throw Exception('Failed to fetch address');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            width: size.width * 0.2, // Set the desired width of the box
            height: size.height * 1, // Set the desired height of the box
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color
              // borderRadius:
              //   BorderRadius.circular(10.0), // Apply rounded corners
              border: Border.all(
                // Add the border
                color: Colors.grey, // Set the color of the border
                width: 2.0, // Set the thickness of the border
              ),
            ),
            child: ListView(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.assignment_turned_in,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                    Column(
                      children: [
                        Center(child: Text("0959636242")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                            Text(
                              "Qatana District,Rif Dimashq Governorate",
                              style: TextStyle(fontSize: size.width * 0.007),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: Colors.blue,
                  height: 20,
                  thickness: 2,
                  indent: 6,
                  endIndent: 6,
                ),
                Center(
                  child: ElevatedButton(
                      child: Text('Look up address'),
                      onPressed: () async {
                        final address =
                            await getReverseGeocoding(33.4397141, 36.1626865);
                        print(address);

                        // final latitude = double.parse(_latitudeController.text);
                        // final longitude =
                        //     double.parse(_longitudeController.text);
                        // print("latitude + ${latitude}");
                        // List<Placemark> placemarks =
                        //     await placemarkFromCoordinates(
                        //         52.2165157, 6.9437819);
                        // print(placemarks[0].country);

                        // await placemarkFromCoordinates(52.2165157, 6.9437819)
                        //     .then((placemarks) {
                        //   var output = 'No results found.';
                        //   if (placemarks.isNotEmpty) {
                        //     output = placemarks[0].toString();
                        //     print("================");
                        //     print(output);
                        //   }
                        // });
                      }),
                ),
              ],
            )));
  }
}
