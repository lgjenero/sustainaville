import 'dart:ui' as ui;

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

Future<ui.Image?> createSpriteSheet(List<String> spriteSheets) async {
  if (spriteSheets.isEmpty) return null;

  final List<ui.Image> images;
  try {
    images = await Flame.images.loadAll(spriteSheets);
  } catch (_) {
    return null;
  }
  if (images.isEmpty) return null;

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final paint = Paint();

  for (final image in images) {
    canvas.drawImage(image, Offset.zero, paint);
  }

  final picture = recorder.endRecording();
  return await picture.toImage(images.first.width, images.first.height);
}
