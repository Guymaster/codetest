
import 'package:groupe/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GroupProgress{

    static groupProgress(){
      return LoadingAnimationWidget.beat(
          color: secondaryColor,
          size: 25
      );
    }

}