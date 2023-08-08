import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({Key? key}) : super(key: key);

  @override
  LocationFormState createState() => LocationFormState();
}

class LocationFormState extends State<LocationForm> {
  TextEditingController locationController = TextEditingController();

  String locationMessage = '';

  @override
  void dispose() {
    locationController.dispose();

    super.dispose();
  }

  void _getCurrentLocation() async {
    Position? position;

    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      debugPrint(e.toString());

      position = null;
    }

    if (position != null) {
      await _getAddressFromCoordinates(position.latitude, position.longitude);
    } else {
      setState(() {
        locationMessage = "Could not fetch the location.";
      });
    }
  }

  Future<void> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    final addresses = await GeocodingPlatform.instance
        .placemarkFromCoordinates(latitude, longitude);

    if (addresses.isNotEmpty) {
      final firstAddress = addresses.first;

      String addressLine = firstAddress.street ?? "";

      String city = firstAddress.locality ?? "";

      String state = firstAddress.administrativeArea ?? "";

      String postalCode = firstAddress.postalCode ?? "";

      String country = firstAddress.country ?? "";

      setState(() {
        locationMessage = "$addressLine, $city, $state, $postalCode, $country";

        locationController.text = locationMessage;
      });
    } else {
      setState(() {
        locationMessage = "Address not available";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Currnet Location')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: locationController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Current Location',
                suffixIcon: IconButton(
                    onPressed: _getCurrentLocation,
                    icon: const Icon(CupertinoIcons.location_fill)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
