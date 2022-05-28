import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'icons.dart';

enum role {
  MYSELF,
  LOVED,
  GIRL,
  PATIENT,
  FRIEND,
}

class RoleConstant {
  RoleConstant._();

  static Map<role, Set<String>> roles = {
    role.FRIEND: RoleConstant.roles_friend,
    role.GIRL: RoleConstant.roles_girl,
    role.LOVED: RoleConstant.roles_loved,
    role.MYSELF: RoleConstant.roles_myself,
    role.PATIENT: RoleConstant.roles_patient,
  };
  static Map<role, String> myRoles = {
    role.FRIEND: AppIcons.auth_role_friend,
    role.GIRL: AppIcons.auth_role_girl,
    role.LOVED: AppIcons.auth_role_loved,
    role.MYSELF: AppIcons.auth_role_myself,
    role.PATIENT: AppIcons.auth_role_patient,
  };

  static Map<role, Set<role>> roles_type = {
    role.FRIEND: RoleConstant.roles_friend_type,
    role.GIRL: RoleConstant.roles_girl_type,
    role.LOVED: RoleConstant.roles_loved_type,
    role.MYSELF: RoleConstant.roles_myself_type,
    role.PATIENT: RoleConstant.roles_patient_type,
  };

  ///-------Index-------\\\
  ///----MYSELF- =======> 0
  ///----LOVED-- =======> 1
  ///----GIRL--- =======> 2
  ///----PATIENT =======> 3
  ///----FRIEND- =======> 4

  ///Size based on index
  static List<double> sizes = [
    120.0, // Index=> 4
    80.0, // Index=> 3
    300.0, // Index=> 0
    80.0, // Index=> 2
    120.0, // Index=> 1
  ];

  //SVG
  static Set<String> roles_myself = {
    AppIcons.auth_role_friend,
    AppIcons.auth_role_patient,
    AppIcons.auth_role_myself,
    AppIcons.auth_role_girl,
    AppIcons.auth_role_loved,
  };
  static Set<String> roles_loved = {
    AppIcons.auth_role_myself,
    AppIcons.auth_role_friend,
    AppIcons.auth_role_loved,
    AppIcons.auth_role_patient,
    AppIcons.auth_role_girl,
  };
  static Set<String> roles_girl = {
    AppIcons.auth_role_loved,
    AppIcons.auth_role_myself,
    AppIcons.auth_role_girl,
    AppIcons.auth_role_friend,
    AppIcons.auth_role_patient,
  };
  static Set<String> roles_patient = {
    AppIcons.auth_role_girl,
    AppIcons.auth_role_loved,
    AppIcons.auth_role_patient,
    AppIcons.auth_role_myself,
    AppIcons.auth_role_friend,
  };
  static Set<String> roles_friend = {
    AppIcons.auth_role_patient,
    AppIcons.auth_role_girl,
    AppIcons.auth_role_friend,
    AppIcons.auth_role_loved,
    AppIcons.auth_role_myself,
  };

  //Role
  static Set<role> roles_myself_type = {
    role.FRIEND,
    role.PATIENT,
    role.MYSELF,
    role.GIRL,
    role.LOVED
  };
  static Set<role> roles_loved_type = {
    role.MYSELF,
    role.FRIEND,
    role.LOVED,
    role.PATIENT,
    role.GIRL,
  };
  static Set<role> roles_girl_type = {
    role.LOVED,
    role.MYSELF,
    role.GIRL,
    role.FRIEND,
    role.PATIENT,
  };
  static Set<role> roles_patient_type = {
    role.GIRL,
    role.LOVED,
    role.PATIENT,
    role.MYSELF,
    role.FRIEND,
  };
  static Set<role> roles_friend_type = {
    role.PATIENT,
    role.GIRL,
    role.FRIEND,
    role.LOVED,
    role.MYSELF,
  };

  static Container arrow_I(double width, BuildContext context) => Container(
    margin: EdgeInsets.only(right: width*0.07),
    child: Stack(
          children: [
            Positioned(
              right: 11.5*widthWeight(context),
              bottom: 356*heightWeight(context),
              child: Transform.rotate(
                angle: -math.pi / 3.0,
                child: Container(
                  height: 100*heightWeight(context),
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 12,
                        offset: const Offset(0, 8), // Shadow position
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 2*widthWeight(context),
              bottom: 10,
              child: Container(
                height: 370*heightWeight(context),
                width: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20*widthWeight(context),
              bottom: 428*heightWeight(context),
              child: Container(
                height: 40*heightWeight(context),
                width: 40*widthWeight(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'My loved one 👫🏼',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
  );

  static Container arrow_II(double width,BuildContext context) => Container(
    margin: EdgeInsets.only(right: width*0.025),

    child: Stack(
          children: [
            Positioned(
              right: 65,
              bottom: 10*heightWeight(context),
              child: Container(
                height: 150*heightWeight(context),
                width: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 160*heightWeight(context),
              child: Container(
                height: 40*heightWeight(context),
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'My Little Girl 👧🏼',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),

              ),
            ),
          ],
        ),
  );

  static Container arrow_III(double width,BuildContext context) => Container(
    margin: EdgeInsets.only(right: width*0.010*widthWeight(context)),

    child: Stack(
          children: [
            Positioned(
              right: 43*widthWeight(context),
              bottom: 184*heightWeight(context),
              child: Transform.rotate(
                angle: math.pi / 3.0,
                child: Container(
                  height: 60*heightWeight(context),
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 12,
                        offset: const Offset(0, 8), // Shadow position
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 49*widthWeight(context),
              bottom: 10*heightWeight(context),
              child: Container(
                height: 190*heightWeight(context),
                width: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10*widthWeight(context),
              bottom: 216*heightWeight(context),
              child: Container(
                height: 40*heightWeight(context),
                width: 33*widthWeight(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Myself 💁🏼‍♀️',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
  );

  static Container arrow_IV(double width,BuildContext context) => Container(
    margin: EdgeInsets.only(right: width*0.016*widthWeight(context)),

    child: Stack(
          children: [
            Positioned(
              right: 56*widthWeight(context),
              bottom: 283*heightWeight(context),
              child: Transform.rotate(
                angle: math.pi / 3.0,
                child: Container(
                  height: 100*heightWeight(context),
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 12,
                        offset: const Offset(0, 8), // Shadow position
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right:65*widthWeight(context),
              bottom: 10,
              child: Container(
                height: 297*heightWeight(context),
                width: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right:22*widthWeight(context),
              bottom: 330*heightWeight(context),
              child: Container(
                height: 40*heightWeight(context),
                width: 35*widthWeight(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'My Patient 👩🏼‍⚕️',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
  );

  static Container arrow_V(double width,BuildContext context) => Container(
    child: Stack(
          children: [
            Positioned(
              right: 80.5*widthWeight(context),
              bottom: 464*heightWeight(context),
              child: Transform.rotate(
                angle: math.pi / 3.0,
                child: Container(
                  height: 100*heightWeight(context),
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 12,
                        offset: const Offset(0, 8), // Shadow position
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 90*widthWeight(context),
              bottom: 10*heightWeight(context),
              child: Container(
                height: 480*heightWeight(context),
                width: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 41*widthWeight(context),
              bottom: 520*heightWeight(context),
              child: Container(
                height: 40*heightWeight(context),
                width: 38*widthWeight(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'My Best Friend 👭🏼️',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),

              ),
            ),
          ],
        ),
  );



     /// Role Convert to String
     static Text GetRole(BuildContext context,{required role currentRole}){
       String value;
       switch(currentRole){
         case role.MYSELF:
           value ='Myself 💁🏼‍♀️';
           break;
         case role.FRIEND:
           value ='My Best Friend 👭🏼️';
           break;
         case role.GIRL:
           value ='My Little Girl 👧🏼';
           break;
         case role.PATIENT:
           value ='My Patient 👩🏼‍⚕️';
           break;
         case role.LOVED:
           value ='My loved one 👫🏼';
           break;
         default:
           value ='Myself 💁🏼‍♀';
           break;
       }
       return Text(
         value,
         style: Theme.of(context).textTheme.bodyText1!.copyWith(
             fontWeight: FontWeight.w600,
             color: Colors.black,
             fontSize:18 ),
       );
     }

     static double widthWeight(BuildContext context){
       if (kDebugMode) {
         print('W-weight'+(MediaQuery.of(context).size.width/100).toString());
       }
       return MediaQuery.of(context).size.width/100;

     }
     static double heightWeight(BuildContext context){
       if (kDebugMode) {
         print('H-weight'+(MediaQuery.of(context).size.height/100).toString());
       }
       return MediaQuery.of(context).size.height/1000;

     }
}
