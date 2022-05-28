import 'package:flutter/material.dart';
import '../../roleChooser/widgets/role_chooser_constant.dart';

class RoleNotifier with ChangeNotifier {
  int listSize = 5;

  Map<int, RoleModel> _offsetMap = {
    0: RoleModel(0.45, role.MYSELF,100,0),
    1: RoleModel(0.84, role.LOVED,100,0),
    2: RoleModel(0.6, role.GIRL,100,0),
    3: RoleModel(0.2, role.PATIENT,100,0),
    4: RoleModel(0.05, role.FRIEND,100,0)
  };



  ///------.........-Index-.........-------\\\
  ///----MYSELF- =======> 0 ---> offset: 0.50
  ///----LOVED-- =======> 1 ---> offset: 1.00
  ///----GIRL--- =======> 2 ---> offset: 0.65
  ///----PATIENT =======> 3 ---> offset: 0.25
  ///----FRIEND- =======> 4 ---> offset: 0.00

  ///---0 ---> offset: 0.50
  ///---1 ---> offset: 1.00
  ///---2 ---> offset: 0.65
  ///---3 ---> offset: 0.25
  ///---4 ---> offset: 0.00

  ///  --------------------------------------------
  ///                    .    .
  ///               3             2
  ///            .                  .
  ///           4                     1
  ///            .                  .
  ///              .              .
  ///                   .  0  .
  ///  --------------------------------------------
  ///     HOW TO COUNT  (LTR) (4---3---0---2---1)


  void gotoRole({required role cRole,required Map<int, RoleModel> lastPosition}) {
    switch (cRole) {
      case role.MYSELF:
        _offsetMap = {
          0: RoleModel(0.42, role.MYSELF,250,0),
          1: RoleModel(0.85, role.LOVED,100,8),
          2: RoleModel(0.65, role.GIRL,80,30),
          3: RoleModel(0.25, role.PATIENT,80,30),
          4: RoleModel(0.05, role.FRIEND,100,8)
        };
        break;
      case role.LOVED:
        _offsetMap = {
          4: RoleModel(0.05, role.MYSELF,100,8),
          0: RoleModel(0.35, role.LOVED,250,0),
          1: RoleModel(0.85, role.GIRL,100,8),
          2: RoleModel(0.65, role.PATIENT,80,30),
          3: RoleModel(0.2, role.FRIEND,80,30)
        };
        break;
      case role.GIRL:
        _offsetMap = {
          3: RoleModel(0.2, role.MYSELF,80,30),
          4: RoleModel(0.05, role.LOVED,100,8),
          0: RoleModel(0.3, role.GIRL,250,0),
          1: RoleModel(0.82, role.PATIENT,100,8),
          2: RoleModel(0.7, role.FRIEND,80,30)
        };
        break;
      case role.PATIENT:
        _offsetMap = {
          2: RoleModel(0.75, role.MYSELF,80,30),
          3: RoleModel(0.2, role.LOVED,80,30),
          4: RoleModel(0.05, role.GIRL,100,8),
          0: RoleModel(0.3, role.PATIENT,250,0),
          1: RoleModel(0.88, role.FRIEND,100,8),
        };
        break;
      case role.FRIEND:
        _offsetMap = {
          1: RoleModel(0.85, role.MYSELF,100,8),
          2: RoleModel(0.65, role.LOVED,80,30),
          3: RoleModel(0.25, role.GIRL,80,30),
          4: RoleModel(0.05, role.PATIENT,100,8),
          0: RoleModel(0.4, role.FRIEND,250,0)
        };
        break;
    }

    notifyListeners();
  }
  void refresh(){
    _offsetMap = {
      0: RoleModel(0.45, role.MYSELF,100,0),
      1: RoleModel(0.84, role.LOVED,100,0),
      2: RoleModel(0.6, role.GIRL,100,0),
      3: RoleModel(0.2, role.PATIENT,100,0),
      4: RoleModel(0.05, role.FRIEND,100,0)
    };
    notifyListeners();
  }


  Map<int, RoleModel> get offsetList => _offsetMap;

  void _onAnimationControllerChanged() {
    notifyListeners();
  }
}

class RoleModel {
  final double offset;
  final double size;
  final double height;
  final role currentRole;

  RoleModel(this.offset, this.currentRole, this.size, this.height);
}

