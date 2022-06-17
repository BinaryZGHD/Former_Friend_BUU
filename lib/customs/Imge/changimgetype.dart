import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ChangeImageType extends StatelessWidget {
  final String urlimge_l;
  const ChangeImageType({Key? key, required this.urlimge_l}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FChangeImageType(
      urlimge_f: urlimge_l,
    );
  }
}

class _FChangeImageType extends StatefulWidget {
  const _FChangeImageType({
    Key? key,
    required this.urlimge_f,
  }) : super(key: key);
  final String urlimge_f;

  @override
  State<_FChangeImageType> createState() => _FChangeImageTypeState();
}

class _FChangeImageTypeState extends State<_FChangeImageType> {
  @override
  Widget build(BuildContext context) {
    String img_err = widget.urlimge_f;

    RegExp exp = RegExp(r'.svg', caseSensitive: false);
    String str = "${img_err}";
    Iterable<RegExpMatch> matches = exp.allMatches(str);

    if (exp.hasMatch(str)) {
      return SvgPicture.network(
        "${img_err}",
      );
    } else {
      return Image.network(
        "${img_err}",
      );
    }
  }
}
