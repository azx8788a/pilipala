import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pilipala/http/init.dart';

class SponsorBlockSegment {
  final double startTime;
  final double endTime;
  final String category;
  const SponsorBlockSegment({
    required this.startTime,
    required this.endTime,
    required this.category,
  });
}

class SponsorBlockService {
  static const _baseUrl = 'https://sponsor.ajay.app';

  static Future<List<SponsorBlockSegment>> fetchSegments(String videoId) async {
    try {
      final resp = await Request.dio.get(
        '$_baseUrl/api/skipSegments',
        queryParameters: {
          'videoID': videoId,
          'category': json.encode([
            'sponsor',
            'intro',
            'outro',
            'interaction',
            'selfpromo',
          ]),
        },
      );
      if (resp.data is List) {
        return (resp.data as List).map((e) {
          final seg = e['segment'] as List;
          return SponsorBlockSegment(
            startTime: (seg[0] as num).toDouble(),
            endTime: (seg[1] as num).toDouble(),
            category: e['category'] as String,
          );
        }).toList();
      }
    } catch (_) {}
    return [];
  }
}
