// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

import '../points_bloc/points_bloc.dart';
import 'widgets/voucher_widget.dart';

class RedeemRewardsScreen extends StatefulWidget {
  const RedeemRewardsScreen({
    super.key,
  });

  @override
  State<RedeemRewardsScreen> createState() => _RedeemRewardsScreenState();
}

class _RedeemRewardsScreenState extends State<RedeemRewardsScreen> {
  final pointsBloc = PointsBloc();
  final String tngLogoURL =
      'https://cdn.moogold.com/2022/06/tng-ewallet-logo-2-scaled.jpg';
  final String shopeeLogoURL =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Shopee.svg/2560px-Shopee.svg.png';
  bool isVoucher1Redeemed = false;
  bool isVoucher2Redeemed = false;
  bool isVoucher3Redeemed = false;
  bool isVoucher4Redeemed = false;
  bool isVoucher5Redeemed = false;
  bool isVoucher6Redeemed = false;

  @override
  Widget build(BuildContext context) {
    //every time screen rebuilt, intialize points
    pointsBloc.add(PointsInitializePointsEvent());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Redeem Rewards',
            style: TextStyle(
              fontFamily: GlobalVariables.titleFont().fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: GlobalVariables.tertiaryColor,
              letterSpacing: 1,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    Text('Your credit'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BlocBuilder<PointsBloc, PointsState>(
                          bloc: pointsBloc,
                          builder: (context, state) {
                            if (state is PointsInitializeSuccessfulState) {
                              final currentPoints = state.points;
                              return Text(
                                currentPoints.toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  fontFamily:
                                      GlobalVariables.pointFont().fontFamily,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff7E89EB),
                                ),
                              );
                            } else {
                              return Text(
                                'Error ',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily:
                                      GlobalVariables.pointFont().fontFamily,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff7E89EB),
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            ' pts',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily:
                                  GlobalVariables.pointFont().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff7E89EB),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: VoucherWidget(
                          passedBackValue: (isRedeem) {
                            setState(() {
                              isVoucher1Redeemed = isRedeem;
                            });
                          },
                          logoName: tngLogoURL,
                          voucherDescription: 'RM20 Tng Credit',
                          points: 800,
                          isRedeemed: isVoucher1Redeemed,
                        )),
                        Expanded(
                            child: VoucherWidget(
                          passedBackValue: (isRedeem) {
                            setState(() {
                              isVoucher2Redeemed = isRedeem;
                            });
                          },
                          logoName: tngLogoURL,
                          voucherDescription: 'RM8 Tng Credit',
                          points: 40,
                          isRedeemed: isVoucher2Redeemed,
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: VoucherWidget(
                          passedBackValue: (isRedeem) {
                            setState(() {
                              isVoucher3Redeemed = isRedeem;
                              print('v3 $isVoucher3Redeemed');
                            });
                          },
                          logoName: tngLogoURL,
                          voucherDescription: 'RM8 Tng Credit',
                          points: 158,
                          isRedeemed: isVoucher3Redeemed,
                        )),
                        Expanded(
                            child: VoucherWidget(
                          passedBackValue: (isRedeem) {
                            setState(() {
                              isVoucher4Redeemed = isRedeem;
                            });
                          },
                          logoName: tngLogoURL,
                          voucherDescription: 'RM15 Tng Credit',
                          points: 1000,
                          isRedeemed: isVoucher4Redeemed,
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: VoucherWidget(
                          passedBackValue: (isRedeem) {
                            isVoucher5Redeemed = isRedeem;
                          },
                          logoName: tngLogoURL,
                          voucherDescription: 'RM100 Tng Credit',
                          points: 2000,
                          isRedeemed: isVoucher5Redeemed,
                        )),
                        Expanded(
                            child: VoucherWidget(
                          passedBackValue: (isRedeem) {
                            isVoucher6Redeemed = isRedeem;
                          },
                          logoName: tngLogoURL,
                          voucherDescription: 'RM3 Tng Credit',
                          points: 30,
                          isRedeemed: isVoucher6Redeemed,
                        )),
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
