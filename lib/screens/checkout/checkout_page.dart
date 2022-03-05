import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({Key? key}) : super(key: key);

  @override
  _CheckoutpageState createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
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
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/chevron-left.svg',
              width: 24,
              height: 24,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.27,
              color: Colors.red,

            ),
            const SizedBox(
              height: 22,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextFormField(
                cursorColor: ColorsWeplant.colorPrimary,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                validator: (value) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: ColorsWeplant.colorTextfield,
                  filled: true,
                  hintText: "Address Details",
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
            )
          ],
        ),
      ),
    );
  }
}
