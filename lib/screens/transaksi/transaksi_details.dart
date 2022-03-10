import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/model/transaksi_model.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class DetailsTransaksi extends StatefulWidget {
  final TransaksiModel model;

  const DetailsTransaksi({Key? key, required this.model}) : super(key: key);

  @override
  _DetailsTransaksiState createState() => _DetailsTransaksiState();
}

class _DetailsTransaksiState extends State<DetailsTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff263238),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Detail Payment',
          style:
              GoogleFonts.workSans(fontWeight: FontWeight.w700, fontSize: 28),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    widget.model.qr_code,
                    width: 225,
                    height: 225,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Address',
                  style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: ColorsWeplant.colorPrimary),
                ),
                const SizedBox(
                  height: 21,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 21),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xffD5DDE0), width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.address['address'],
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Text(
                        widget.model.address['city'],
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Text(
                        widget.model.address['province'],
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Text(
                        widget.model.address['postal_code'],
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Product',
                  style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: ColorsWeplant.colorPrimary),
                ),
                const SizedBox(
                  height: 21,
                ),
                Column(
                  children: List.generate(
                      widget.model.products.length,
                      (i) => Container(
                          height: 108,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xffD5DDE0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16)),
                                child: Image.network(
                                  widget.model.products[i]['main_image']['url'],
                                  width: 137,
                                  height: 166,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.model.products[i]['name']
                                                .substring(0, 12) +
                                            '..',
                                        style: GoogleFonts.workSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                            color: Color(0xff24243F)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            NumberFormat.currency(
                                                    locale: 'IDR',
                                                    symbol: 'Rp',
                                                    decimalDigits: 0)
                                                .format(widget.model.products[i]
                                                    ['price']),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    ColorsWeplant.colorPrimary,
                                                fontSize: 14),
                                          ),
                                          Text(
                                              'stock: ${widget.model.products[i]['quantity'].toString()}')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ))),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
