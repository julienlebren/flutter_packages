library avatar;

import 'dart:io';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:layout_builder/layout_builder.dart';

part 'avatar_colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.file,
    this.url,
    this.name,
    required this.color,
    this.radius = 20,
  }) : super(key: key);

  final int color;
  final File? file;
  final String? url;
  final String? name;
  final double? radius;

  @override
  Widget build(context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final _radius = radius != null ? radius! : constraints.maxWidth / 2;
      return ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: Container(
          width: _radius * 2,
          height: _radius * 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AvatarColors.fromIndex(color).lighten(0.15),
                AvatarColors.fromIndex(color),
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: (() {
            if (file != null) {
              return Image.file(file!);
            } else if (url != null) {
              return CachedNetworkAvatar(url!);
            } else if (name != "") {
              return Padding(
                padding: EdgeInsets.all(_radius / 3),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    name!.initials,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: isCupertino() ? -1 : 0,
                    ),
                  ),
                ),
              );
            }
          }()),
        ),
      );
    });
  }
}

class CachedNetworkAvatar extends StatelessWidget {
  const CachedNetworkAvatar(this.imageUrl) : super();

  final String imageUrl;

  @override
  Widget build(context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(
        strokeWidth: 2,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
