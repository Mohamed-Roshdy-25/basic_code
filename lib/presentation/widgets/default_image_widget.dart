import 'package:basic_code_for_any_project/presentation/widgets/shimmer_container_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultImageWidget extends StatefulWidget {
  final String image;
  final double? width;
  final double? height;
  final double? shimmerHeight;
  const DefaultImageWidget({super.key, required this.image, this.width, this.height, this.shimmerHeight});

  @override
  State<DefaultImageWidget> createState() => _DefaultImageWidgetState();
}

class _DefaultImageWidgetState extends State<DefaultImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.image,
      width: widget.width??double.infinity,
      height: widget.height,
      fit: BoxFit.cover,
      placeholder: (context, url) => ShimmerContainerWidget(height: widget.shimmerHeight?? MediaQuery.sizeOf(context).height*.2),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
