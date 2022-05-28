import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolechosser/roleChooser/widgets/role.dart';
import '../controllers/role_comment_offset_notifier.dart';
import '../controllers/role_notifier.dart';
import 'role_chooser_constant.dart';

class AuthRoleForm extends StatefulWidget {
  const AuthRoleForm({Key? key}) : super(key: key);

  @override
  _AuthRoleForm createState() => _AuthRoleForm();
}

class _AuthRoleForm extends State<AuthRoleForm> with TickerProviderStateMixin {
  late AnimationController _roleAnimationController;

  @override
  void initState() {
    super.initState();
    // Horizontal animation notifier

    _roleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _roleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size windowSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Form(
        child: ChangeNotifierProvider(
          create: (_) => RoleNotifier(),
          child: ChangeNotifierProvider(
            create: (_) => RoleCommentAnimationNotifier(_roleAnimationController),
            child: Consumer2<RoleNotifier, RoleCommentAnimationNotifier>(
              builder: (context, _notifier, animation, child) {
                return Stack(
                  children: [
                    ///--------Back Button--------\\\

                    ///-----------Title-----------\\\
                    Positioned(
                      top:windowSize.height * 0.1,
                      width: windowSize.width,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Now tell us who do you want to take care of?',
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 15,
                                fontWeight: FontWeight.bold
                                  ),
                            ),
                            SizedBox(height: 8 * 0.4,),
                            Opacity(
                              opacity: 1 - 1 * animation.value,
                              child: Text(
                                'Choose one of the below situations',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black26,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0,-30+30*(animation.value)),
                              child: Opacity(
                                opacity: animation.value,
                                child: Text(
                                  'I want to take care of',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: Colors.black26,
                                        fontSize: 14,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8,),
                            Transform.translate(
                              offset: Offset(-80+80*(animation.value),0),
                              child: Opacity(
                                opacity: animation.value,
                                child:RoleConstant.GetRole(context,currentRole:_notifier.offsetList[0]!.currentRole),
                              ),
                            ),
                            SizedBox(height: 8,),
                            SizedBox(height: 8,),
                            Transform.translate(
                              offset: Offset(0,-50+50*(animation.value)),
                              child: Opacity(
                                opacity:animation.value,
                                child: GestureDetector(
                                  onTap: ()
                                  {
                                    animation.animationController.reverse();
                                    _notifier.refresh();
                                  },
                                  child: Text(
                                    'Choose another',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black26,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///------Comment section------\\\
                    Container(
                      margin: const EdgeInsets.only(bottom: 120),
                      child: Transform.translate(
                        offset: Offset(animation.value * 250, 0),
                        child: Opacity(
                          opacity: 1-animation.value,
                          child: GestureDetector(
                              onTap: () {
                                animation.animationController.forward();
                                _notifier.gotoRole(
                                    cRole: _notifier.offsetList[1]!.currentRole,
                                    lastPosition: {
                                      4: (_notifier.offsetList[4]!),
                                      3: (_notifier.offsetList[3]!),
                                      2: (_notifier.offsetList[2]!),
                                      1: (_notifier.offsetList[1]!),
                                      0: (_notifier.offsetList[0]!),
                                    });
                              },
                              child:
                                  RoleConstant.arrow_I(windowSize.width,context)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 50, right: windowSize.width * 0.13),
                      child: Transform.translate(
                          offset: Offset(animation.value * 300, 0),
                          child: Opacity(
                            opacity: 1-animation.value,
                            child: GestureDetector(
                                onTap: () {
                                  animation.animationController.forward();
                                  _notifier.gotoRole(
                                      cRole: _notifier.offsetList[2]!.currentRole,
                                      lastPosition: {
                                        4: (_notifier.offsetList[4]!),
                                        3: (_notifier.offsetList[3]!),
                                        2: (_notifier.offsetList[2]!),
                                        1: (_notifier.offsetList[1]!),
                                        0: (_notifier.offsetList[0]!),
                                      });
                                },
                                child: RoleConstant.arrow_II(
                                    windowSize.width, context)),
                          )),
                    ),
                    Container(
                      margin:const EdgeInsets.only(bottom: 110,right: 0),
                      child: Transform.translate(
                          offset: Offset(animation.value * 400, 0),
                          child: Opacity(
                            opacity: 1-animation.value,
                            child: GestureDetector(
                                onTap: () {
                                  animation.animationController.forward();
                                  _notifier.gotoRole(
                                      cRole: _notifier.offsetList[0]!.currentRole,
                                      lastPosition: {
                                        4: (_notifier.offsetList[4]!),
                                        3: (_notifier.offsetList[3]!),
                                        2: (_notifier.offsetList[2]!),
                                        1: (_notifier.offsetList[1]!),
                                        0: (_notifier.offsetList[0]!),
                                      });
                                },
                                child: RoleConstant.arrow_III(
                                    windowSize.width, context)),
                          )),
                    ),
                    Container(
                      margin:const EdgeInsets.only(
                          bottom: 100,right: 0),
                      child: Transform.translate(
                          offset: Offset(-animation.value * 340, 0),
                          child: Opacity(
                            opacity: 1-animation.value,
                            child: GestureDetector(
                                onTap: () {
                                  animation.animationController.forward();
                                  _notifier.gotoRole(
                                      cRole: _notifier.offsetList[3]!.currentRole,
                                      lastPosition: {
                                        4: (_notifier.offsetList[4]!),
                                        3: (_notifier.offsetList[3]!),
                                        2: (_notifier.offsetList[2]!),
                                        1: (_notifier.offsetList[1]!),
                                        0: (_notifier.offsetList[0]!),
                                      });
                                },
                                child: RoleConstant.arrow_IV(
                                    windowSize.width, context)),
                          )),
                    ),
                    Container(
                      margin:const EdgeInsets.only(
                          bottom: 110, right:0),
                      child: Transform.translate(
                          offset: Offset(-animation.value * 250, 0),
                          child: Opacity(
                            opacity: 1-animation.value,
                            child: GestureDetector(
                                onTap: () {
                                  animation.animationController.forward();
                                  _notifier.gotoRole(
                                      cRole: _notifier.offsetList[4]!.currentRole,
                                      lastPosition: {
                                        4: (_notifier.offsetList[4]!),
                                        3: (_notifier.offsetList[3]!),
                                        2: (_notifier.offsetList[2]!),
                                        1: (_notifier.offsetList[1]!),
                                        0: (_notifier.offsetList[0]!),
                                      });
                                },
                                child: RoleConstant.arrow_V(
                                    windowSize.width, context)),
                          )),
                    ),
                    ///---End of Comment section---\\\
                    ///--------Ring Section--------\\\
                    Stack(
                      children: [
                        Positioned(
                          left:
                              _notifier.offsetList[4]!.offset * windowSize.width,
                          bottom: _notifier.offsetList[4]!.height,
                          child: GestureDetector(
                            onTap: () => _notifier.gotoRole(
                                cRole: _notifier.offsetList[4]!.currentRole,
                                lastPosition: {
                                  4: (_notifier.offsetList[4]!),
                                  3: (_notifier.offsetList[3]!),
                                  2: (_notifier.offsetList[2]!),
                                  1: (_notifier.offsetList[1]!),
                                  0: (_notifier.offsetList[0]!),
                                }),
                            child: Role(
                              image: RoleConstant
                                  .myRoles[_notifier.offsetList[4]!.currentRole]!,
                              opacity: 1,
                              size: _notifier.offsetList[4]!.size,
                              myrole: _notifier.offsetList[4]!.currentRole,
                              key: ValueKey(_notifier.offsetList[4]!.currentRole),
                            ),
                          ),
                        ),
                        Positioned(
                          left:
                              _notifier.offsetList[3]!.offset * windowSize.width,
                          bottom: _notifier.offsetList[3]!.height,
                          child: GestureDetector(
                            onTap: () => _notifier.gotoRole(
                                cRole: _notifier.offsetList[3]!.currentRole,
                                lastPosition: {
                                  4: (_notifier.offsetList[4]!),
                                  3: (_notifier.offsetList[3]!),
                                  2: (_notifier.offsetList[2]!),
                                  1: (_notifier.offsetList[1]!),
                                  0: (_notifier.offsetList[0]!),
                                }),
                            child: Role(
                              image: RoleConstant
                                  .myRoles[_notifier.offsetList[3]!.currentRole]!,
                              opacity: 1,
                              size: _notifier.offsetList[3]!.size,
                              myrole: _notifier.offsetList[3]!.currentRole,
                              key: ValueKey(_notifier.offsetList[3]!.currentRole),
                            ),
                          ),
                        ),
                        Positioned(
                          left:
                              _notifier.offsetList[0]!.offset * windowSize.width,
                          bottom: _notifier.offsetList[0]!.height,
                          child: GestureDetector(
                            onTap: () => _notifier.gotoRole(
                                cRole: _notifier.offsetList[0]!.currentRole,
                                lastPosition: {
                                  4: (_notifier.offsetList[4]!),
                                  3: (_notifier.offsetList[3]!),
                                  2: (_notifier.offsetList[2]!),
                                  1: (_notifier.offsetList[1]!),
                                  0: (_notifier.offsetList[0]!),
                                }),
                            child: Role(
                              image: RoleConstant
                                  .myRoles[_notifier.offsetList[0]!.currentRole]!,
                              opacity: 1,
                              size: _notifier.offsetList[0]!.size,
                              myrole: _notifier.offsetList[0]!.currentRole,
                              key: ValueKey(_notifier.offsetList[0]!.currentRole),
                            ),
                          ),
                        ),
                        Positioned(
                          left:
                              _notifier.offsetList[2]!.offset * windowSize.width,
                          bottom: _notifier.offsetList[2]!.height,
                          child: GestureDetector(
                            onTap: () => _notifier.gotoRole(
                                cRole: _notifier.offsetList[2]!.currentRole,
                                lastPosition: {
                                  4: (_notifier.offsetList[4]!),
                                  3: (_notifier.offsetList[3]!),
                                  2: (_notifier.offsetList[2]!),
                                  1: (_notifier.offsetList[1]!),
                                  0: (_notifier.offsetList[0]!),
                                }),
                            child: Role(
                              image: RoleConstant
                                  .myRoles[_notifier.offsetList[2]!.currentRole]!,
                              opacity: 1,
                              size: _notifier.offsetList[2]!.size,
                              myrole: _notifier.offsetList[2]!.currentRole,
                              key: ValueKey(_notifier.offsetList[2]!.currentRole),
                            ),
                          ),
                        ),
                        Positioned(
                          left:
                              _notifier.offsetList[1]!.offset * windowSize.width,
                          bottom: _notifier.offsetList[1]!.height,
                          child: GestureDetector(
                            onTap: () => _notifier.gotoRole(
                                cRole: _notifier.offsetList[1]!.currentRole,
                                lastPosition: {
                                  4: (_notifier.offsetList[4]!),
                                  3: (_notifier.offsetList[3]!),
                                  2: (_notifier.offsetList[2]!),
                                  1: (_notifier.offsetList[1]!),
                                  0: (_notifier.offsetList[0]!),
                                }),
                            child: Role(
                              image: RoleConstant
                                  .myRoles[_notifier.offsetList[1]!.currentRole]!,
                              opacity: 1,
                              size: _notifier.offsetList[1]!.size,
                              myrole: _notifier.offsetList[1]!.currentRole,
                              key: ValueKey(_notifier.offsetList[1]!.currentRole),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ///-----End of Ring Section-----\\\
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
