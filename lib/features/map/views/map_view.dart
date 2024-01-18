import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../core/theme/app_colors.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(31.2156, 29.9553),
          initialZoom: 9.2,
        ),
        children: [
          MarkerLayer(
            markers: [
              Marker(
                point: const LatLng(31.2156, 27.9553),
                width: 80,
                height: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on,
                    color: AppColors.bodySmallTextColor,
                    size: 33,
                  ),
                ),
              ),
            ],
          ),
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'Healty Life'.toUpperCase(),
                onTap: () => launchUrl(
                    Uri.parse('https://me-qr.com/data/image-pack/83826982')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
