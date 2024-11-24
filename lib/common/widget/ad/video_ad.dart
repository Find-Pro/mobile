import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/services/manager/ad_manager.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class VideoAd extends StatefulWidget {
  const VideoAd({super.key});

  @override
  State<VideoAd> createState() => _VideoAdState();
}

class _VideoAdState extends State<VideoAd> {
  bool _isAdReady = false;

  @override
  void initState() {
    super.initState();
    _loadAdAndShow();
  }

  void _loadAdAndShow() {
    UnityAds.load(
      placementId: AdManager.interstitialVideoAdPlacement,
      onComplete: (placementId) {
        setState(() {
          _isAdReady = true;
        });
        _showAd();
      },
      onFailed: (placementId, error, message) {
        setState(() {
          _isAdReady = false;
        });
        context.router.pop();
      },
    );
  }

  void _showAd() {
    if (_isAdReady) {
      UnityAds.showVideoAd(
        placementId: AdManager.interstitialVideoAdPlacement,
        onComplete: (placementId) {
          context.router.pop();
        },
        onClick: (placementId) {},
        onFailed: (placementId, error, message) {
          context.router.pop();
        },
      );
      setState(() {
        _isAdReady = false;
      });
    } else {
      context.router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomCircular(),
    );
  }
}
