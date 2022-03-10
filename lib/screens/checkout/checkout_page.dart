import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobile_flutter/bloc/transaksi_bloc.dart';
import 'package:mobile_flutter/model/transaksi_event.dart';
import 'package:mobile_flutter/model/transaksi_state.dart';
import 'package:mobile_flutter/screens/cart/cart_page.dart';
import 'package:mobile_flutter/screens/transaksi_page.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/transaksi_api.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({Key? key}) : super(key: key);

  @override
  _CheckoutpageState createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  late GoogleMapController _mapController;
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(-6.200000, 106.816666),
  );
  Marker marker = const Marker(markerId: MarkerId('init'));

  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _provinceController = TextEditingController();
  final _postalCodeController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _cityController.dispose();
    _addressController.dispose();
    _provinceController.dispose();
    _postalCodeController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    getlocation();
    super.initState();
  }

  void _onMapCreate(GoogleMapController controller) {
    _mapController = controller;
  }

  void updateLocation(LocationData locationData) async {
    LatLng latLng = LatLng(locationData.latitude!, locationData.longitude!);
    final address = await geocoding.placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!);
    await _mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 20.00,
            target: LatLng(locationData.latitude!, locationData.longitude!))));
    marker = Marker(
      markerId: const MarkerId('Home'),
      position: latLng,
      rotation: locationData.heading!,
    );
    setState(() {
      _addressController.text = address.first.locality!;
      _provinceController.text = address.first.administrativeArea!;
      _cityController.text = address.first.subAdministrativeArea!;
      _postalCodeController.text = address.first.postalCode!;
    });
  }

  void getlocation() async {
    final location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final _locationData = await location.getLocation();

    updateLocation(_locationData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Checkout',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext c) => const CartsPage()));
            },
            icon: SvgPicture.asset(
              'assets/icons/chevron-left.svg',
              width: 24,
              height: 24,
            )),
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    color: Colors.red,
                    child: GoogleMap(
                      markers: {if (marker.markerId.value == "Home") marker},
                      onMapCreated: _onMapCreate,
                      initialCameraPosition: _initialCameraPosition,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: TextFormField(
                      controller: _addressController,
                      cursorColor: ColorsWeplant.colorPrimary,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      validator: (value) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: ColorsWeplant.colorTextfield,
                        filled: true,
                        hintText: "Street",
                        hintStyle: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: TextFormField(
                      controller: _cityController,
                      cursorColor: ColorsWeplant.colorPrimary,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      validator: (value) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: ColorsWeplant.colorTextfield,
                        filled: true,
                        hintText: "City",
                        hintStyle: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: TextFormField(
                      controller: _provinceController,
                      cursorColor: ColorsWeplant.colorPrimary,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      validator: (value) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: ColorsWeplant.colorTextfield,
                        filled: true,
                        hintText: "Province",
                        hintStyle: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: TextFormField(
                      controller: _postalCodeController,
                      cursorColor: ColorsWeplant.colorPrimary,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      validator: (value) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: ColorsWeplant.colorTextfield,
                        filled: true,
                        hintText: "Postal Code",
                        hintStyle: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 31),
                    child: Text(
                      'before entering payment please make sure everything is correct',
                      style: TextStyle(fontSize: 18, color: Color(0xffC4C4C4)),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        final token = sp.getString('token').toString();
                        final idUser = sp.getString('idCustomer').toString();
                        try {
                          print('masuk');
                          final transaksi = await TransaksiApi().postTransaksi(
                              idUser,
                              token,
                              _addressController.text,
                              _cityController.text,
                              _provinceController.text,
                              _postalCodeController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext c) =>
                                      TransaksiPage(img: transaksi)));
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Text('checkout'))
                ],
              ),
            ),
          )),
    );
  }
}
