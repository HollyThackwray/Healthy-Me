import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollythackwray/res/app_colors.dart';
import 'package:hollythackwray/res/app_constants.dart';
import 'package:hollythackwray/res/images.dart';
import 'package:hollythackwray/widgets/top_banner_sub_heading_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  late QRViewController controller;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightBlackHeading,
      body: Column(
        children: [
          Container(
            height: AppBar().preferredSize.height,
            width: double.infinity,
            color: AppColors.lightBlue,
          ),
          Column(
            children: [
              Center(
                child: SizedBox(
                  height: 15,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Container(
                color: AppColors.lightBlue,
                child: Center(
                  child: Text(
                    'HEALTHY ME',
                    style: AppConstants.topBarTextStyle.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 15,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Container(
                color: AppColors.lightBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          Images.back_arrow,
                          color: Theme.of(context).iconTheme.color,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'SCAN',
                        style: AppConstants.labelStyle.copyWith(
                          color: Theme.of(context).primaryColor,
                          // fontSize: 34,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        Images.back_arrow,
                        color: Colors.transparent,
                        height: 20,
                        width: 20,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  height: 5,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: size.height * 0.2,
          // ),
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
