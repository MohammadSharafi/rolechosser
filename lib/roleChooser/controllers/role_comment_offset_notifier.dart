import 'package:flutter/material.dart';

class RoleCommentAnimationNotifier with ChangeNotifier {
  final AnimationController _animationController;

  RoleCommentAnimationNotifier(this._animationController) {
    _animationController.addListener(_onAnimationControllerChanged);
  }

  double get value => _animationController.value;

  AnimationController get animationController => _animationController;

  void goto(double index) => _animationController.animateTo(index,duration: const Duration(milliseconds: 1000));

  void _onAnimationControllerChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _animationController.removeListener(_onAnimationControllerChanged);
    super.dispose();
  }
}
