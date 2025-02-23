// import 'package:findpro/common/services/manager/ad_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:unity_ads_plugin/unity_ads_plugin.dart';
//
// class BannerAd extends StatefulWidget {
//   const BannerAd({super.key});
//
//   @override
//   State<BannerAd> createState() => _BannerAdState();
// }
//
// class _BannerAdState extends State<BannerAd> {
//   bool _isAdReady = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     UnityAds.init(
//       gameId: AdManager.gameId,
//     ).then((value) {
//       setState(() {
//         _isAdReady = true;
//       });
//     }).catchError((error) {
//       setState(() {
//         _isAdReady = false;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _isAdReady
//         ? UnityBannerAd(placementId: AdManager.bannerAdPlacement)
//         : const Text('');
//   }
// }
