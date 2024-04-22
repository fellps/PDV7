import 'package:bot_toast/bot_toast.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'payment_model.dart';
export 'payment_model.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:pagseguro_smart_flutter/pagseguro_smart_flutter.dart';
import './payment_controller.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final PaymentController controller = PaymentController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  double? saleValue;
  MoneyMaskedTextController moneyController =
      MoneyMaskedTextController(leftSymbol: "R\$ ", decimalSeparator: ",");

  @override
  void initState() {
    //Inicializar a classe handle para escutar os métodos e retornos da pagseguro
    PagseguroSmart.instance().initPayment(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tela de Pagamento",
        navigatorObservers: [BotToastNavigatorObserver()],
        builder: BotToastInit(),
        home: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            title: Text(
              'Pagamento',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) => setState(() {
                    controller.setSaleValue(moneyController.numberValue);
                  }),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Digite o valor"),
                  controller: moneyController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Selecione o método de pagamento",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 10.0,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text("Débito"),
                      onPressed: controller.enable
                          ? () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                controller.clickPayment = true;
                              });
                              //Chamar o método de pagamento para transação no débito
                              PagseguroSmart.instance()
                                  .payment
                                  .debitPayment(controller.saleValue);
                            }
                          : null,
                    ),
                    ElevatedButton(
                      child: const Text("Crédito"),
                      onPressed: controller.enable
                          ? () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                controller.clickPayment = true;
                              });
                              //Chamar o método de pagamento para transação no crédito a vista
                              PagseguroSmart.instance()
                                  .payment
                                  .creditPayment(controller.saleValue);
                            }
                          : null,
                    ),
                    ElevatedButton(
                      child: const Text("Crédito Parc- 2"),
                      onPressed: controller.enable
                          ? () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                controller.clickPayment = true;
                              });
                              //Chamar o método de pagamento para transação no crédito parcelado em 2x
                              PagseguroSmart.instance()
                                  .payment
                                  .creditPaymentParc(controller.saleValue, 2);
                            }
                          : null,
                    ),
                    ElevatedButton(
                      child: const Text("Voucher"),
                      onPressed: controller.enable
                          ? () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                controller.clickPayment = true;
                              });
                              //Chamar o método de pagamento para transação no voucher
                              PagseguroSmart.instance()
                                  .payment
                                  .voucherPayment(controller.saleValue);
                            }
                          : null,
                    ),
                    ElevatedButton(
                      child: const Text("PIX"),
                      onPressed: controller.enable
                          ? () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                controller.clickPayment = true;
                              });
                              //Chamar o método de pagamento para transação no pix
                              PagseguroSmart.instance()
                                  .payment
                                  .pixPayment(controller.saleValue);
                            }
                          : null,
                    ),
                    ElevatedButton(
                      child: const Text("ATIVAR PINPAD"),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          controller.clickPayment = true;
                        });
                        //Chamar o método para ativar o terminal (pinpad)
                        PagseguroSmart.instance()
                            .payment
                            .activePinpad('403938');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: controller.clickPayment
                      ? () {
                          controller.setSaleValue(0.0);
                          //Chamar o método para abortar uma transação em andamento (processamento)
                          PagseguroSmart.instance().payment.abortTransaction();
                        }
                      : null,
                  child: const Text("Cancelar Operação"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Future.delayed(const Duration(seconds: 3))
                        .then((value) => setState(() {}));
                    //Chamar o método para retornar a última transação realizada
                    PagseguroSmart.instance().payment.lastTransaction();
                  },
                  child: const Text("Ultima transação"),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (controller.enableRefund)
                  ElevatedButton(
                    onPressed: () {
                      //Chamar o método para estornar uma transação
                      PagseguroSmart.instance().payment.refund(
                          transactionCode: controller.transactionCode,
                          transactionId: controller.transactionId);
                    },
                    child: const Text("Estornar transação"),
                  ),
              ],
            ),
          ),
        ));
  }
}


// class PaymentWidget extends StatefulWidget {
//   const PaymentWidget({super.key});

//   @override
//   State<PaymentWidget> createState() => _PaymentWidgetState();
// }

// class _PaymentWidgetState extends State<PaymentWidget>
//     with TickerProviderStateMixin {
//   late PaymentModel _model;

//   double? saleValue;
//   MoneyMaskedTextController moneyController =
//       MoneyMaskedTextController(leftSymbol: "R\$ ", decimalSeparator: ",");

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   final animationsMap = <String, AnimationInfo>{};

//   final PaymentController controller = PaymentController();

//   @override
//   void initState() {
//     PagseguroSmart.instance().initPayment(controller);
//     super.initState();
//     _model = createModel(context, () => PaymentModel());
//     _model.textController ??= TextEditingController();
//     _model.textFieldFocusNode ??= FocusNode();

//     animationsMap.addAll({
//       'containerOnPageLoadAnimation1': AnimationInfo(
//         trigger: AnimationTrigger.onPageLoad,
//         effectsBuilder: () => [
//           FadeEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 600.0.ms,
//             begin: 0.0,
//             end: 1.0,
//           ),
//           MoveEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 600.0.ms,
//             begin: const Offset(0.0, 110.0),
//             end: const Offset(0.0, 0.0),
//           ),
//         ],
//       ),
//       'containerOnPageLoadAnimation2': AnimationInfo(
//         trigger: AnimationTrigger.onPageLoad,
//         effectsBuilder: () => [
//           FadeEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 600.0.ms,
//             begin: 0.0,
//             end: 1.0,
//           ),
//           MoveEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 600.0.ms,
//             begin: const Offset(0.0, 110.0),
//             end: const Offset(0.0, 0.0),
//           ),
//         ],
//       ),
//       'containerOnPageLoadAnimation3': AnimationInfo(
//         trigger: AnimationTrigger.onPageLoad,
//         effectsBuilder: () => [
//           FadeEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 600.0.ms,
//             begin: 0.0,
//             end: 1.0,
//           ),
//           MoveEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 600.0.ms,
//             begin: const Offset(0.0, 110.0),
//             end: const Offset(0.0, 0.0),
//           ),
//         ],
//       ),
//     });
//     setupAnimations(
//       animationsMap.values.where((anim) =>
//           anim.trigger == AnimationTrigger.onActionTrigger ||
//           !anim.applyInitialState),
//       this,
//     );

//     WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
//           _model.textController?.text = '0,00';
//         }));
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         appBar: AppBar(
//           backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//           automaticallyImplyLeading: false,
//           leading: FlutterFlowIconButton(
//             borderColor: Colors.transparent,
//             borderRadius: 30.0,
//             borderWidth: 1.0,
//             buttonSize: 60.0,
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: FlutterFlowTheme.of(context).primaryText,
//               size: 30.0,
//             ),
//             onPressed: () async {
//               context.safePop();
//             },
//           ),
//           title: Text(
//             'Pagamento',
//             style: FlutterFlowTheme.of(context).titleLarge.override(
//                   fontFamily: 'Outfit',
//                   letterSpacing: 0.0,
//                 ),
//           ),
//           actions: const [],
//           centerTitle: false,
//           elevation: 0.0,
//         ),
//         body: SafeArea(
//           top: true,
//           child: Stack(
//             alignment: const AlignmentDirectional(0.0, 1.0),
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsetsDirectional.fromSTEB(
//                           0.0, 16.0, 0.0, 0.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Container(
//                             decoration: const BoxDecoration(),
//                             child: TextFormField(
//                               onChanged: (value) => setState(() {
//                                 controller
//                                     .setSaleValue(moneyController.numberValue);
//                               }),
//                               keyboardType: TextInputType.number,
//                               controller: moneyController,
//                               // controller: _model.textController,
//                               focusNode: _model.textFieldFocusNode,
//                               autofocus: true,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 labelText: 'Entre com o valor da transação',
//                                 labelStyle: FlutterFlowTheme.of(context)
//                                     .labelMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       letterSpacing: 0.0,
//                                     ),
//                                 hintStyle: FlutterFlowTheme.of(context)
//                                     .labelMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       letterSpacing: 0.0,
//                                     ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color:
//                                         FlutterFlowTheme.of(context).alternate,
//                                     width: 2.0,
//                                   ),
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: FlutterFlowTheme.of(context).primary,
//                                     width: 2.0,
//                                   ),
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: FlutterFlowTheme.of(context).error,
//                                     width: 2.0,
//                                   ),
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: FlutterFlowTheme.of(context).error,
//                                     width: 2.0,
//                                   ),
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                                 contentPadding:
//                                     const EdgeInsetsDirectional.fromSTEB(
//                                         16.0, 12.0, 16.0, 12.0),
//                               ),
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .override(
//                                     fontFamily: 'Readex Pro',
//                                     letterSpacing: 0.0,
//                                   ),
//                               cursorColor: FlutterFlowTheme.of(context).primary,
//                               validator: _model.textControllerValidator
//                                   .asValidator(context),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 20.0, 0.0, 0.0),
//                             child: SizedBox(
//                               width: double.infinity, // <-- match_parent
//                               child: ElevatedButton(
//                                 child: const Text("ATIVAR PINPAD"),
//                                 onPressed: () async {
//                                   FocusScope.of(context).unfocus();
//                                   setState(() {
//                                     controller.clickPayment = true;
//                                   });
//                                   //Chamar o método para ativar o terminal (pinpad)
//                                   PagseguroSmart.instance()
//                                       .payment
//                                       .activePinpad('403938');
//                                 },
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 20.0, 0.0, 0.0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Text(
//                                   'Selecione o método de pagamento',
//                                   style: FlutterFlowTheme.of(context)
//                                       .labelLarge
//                                       .override(
//                                         fontFamily: 'Readex Pro',
//                                         letterSpacing: 0.0,
//                                       ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ].divide(const SizedBox(height: 12.0)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsetsDirectional.fromSTEB(
//                           0.0, 10.0, 0.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   0.0, 16.0, 0.0, 0.0),
//                               child: GestureDetector(
//                                 onTap: controller.enable
//                                     ? () {
//                                         FocusScope.of(context).unfocus();
//                                         setState(() {
//                                           controller.clickPayment = true;
//                                         });
//                                         //Chamar o método de pagamento para transação no crédito a vista
//                                         PagseguroSmart.instance()
//                                             .payment
//                                             .creditPayment(
//                                                 controller.saleValue);
//                                       }
//                                     : null,
//                                 child: Container(
//                                   width: 120.0,
//                                   constraints: const BoxConstraints(
//                                     maxWidth: 500.0,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: FlutterFlowTheme.of(context)
//                                         .secondaryBackground,
//                                     borderRadius: BorderRadius.circular(12.0),
//                                     border: Border.all(
//                                       color: FlutterFlowTheme.of(context)
//                                           .alternate,
//                                       width: 2.0,
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 16.0, 8.0, 16.0),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           Icons.credit_card,
//                                           color: FlutterFlowTheme.of(context)
//                                               .secondary,
//                                           size: 36.0,
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsetsDirectional
//                                               .fromSTEB(0.0, 12.0, 0.0, 0.0),
//                                           child: Text(
//                                             'Crédito',
//                                             textAlign: TextAlign.center,
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   fontFamily: 'Readex Pro',
//                                                   letterSpacing: 0.0,
//                                                 ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ).animateOnPageLoad(animationsMap[
//                                     'containerOnPageLoadAnimation1']!),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   0.0, 16.0, 0.0, 0.0),
//                               child: Container(
//                                 width: 120.0,
//                                 constraints: const BoxConstraints(
//                                   maxWidth: 500.0,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: FlutterFlowTheme.of(context)
//                                       .secondaryBackground,
//                                   borderRadius: BorderRadius.circular(12.0),
//                                   border: Border.all(
//                                     color:
//                                         FlutterFlowTheme.of(context).alternate,
//                                     width: 2.0,
//                                   ),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       8.0, 16.0, 8.0, 16.0),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.add_card_rounded,
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondary,
//                                         size: 36.0,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(0.0, 12.0, 0.0, 0.0),
//                                         child: Text(
//                                           'Credito 2x',
//                                           textAlign: TextAlign.center,
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium
//                                               .override(
//                                                 fontFamily: 'Readex Pro',
//                                                 letterSpacing: 0.0,
//                                               ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ).animateOnPageLoad(animationsMap[
//                                   'containerOnPageLoadAnimation2']!),
//                             ),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   0.0, 16.0, 0.0, 0.0),
//                               child: Container(
//                                 width: 120.0,
//                                 constraints: const BoxConstraints(
//                                   maxWidth: 500.0,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: FlutterFlowTheme.of(context)
//                                       .secondaryBackground,
//                                   borderRadius: BorderRadius.circular(12.0),
//                                   border: Border.all(
//                                     color:
//                                         FlutterFlowTheme.of(context).alternate,
//                                     width: 2.0,
//                                   ),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       8.0, 16.0, 8.0, 16.0),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.pix,
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondary,
//                                         size: 36.0,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(0.0, 12.0, 0.0, 0.0),
//                                         child: Text(
//                                           'PIX',
//                                           textAlign: TextAlign.center,
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium
//                                               .override(
//                                                 fontFamily: 'Readex Pro',
//                                                 letterSpacing: 0.0,
//                                               ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ).animateOnPageLoad(animationsMap[
//                                   'containerOnPageLoadAnimation3']!),
//                             ),
//                           ),
//                         ].divide(const SizedBox(width: 12.0)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(0.0, 1.0),
//                 child: InkWell(
//                   splashColor: Colors.transparent,
//                   focusColor: Colors.transparent,
//                   hoverColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () async {
//                     context.pushNamed(
//                       'PrintFeedback',
//                       extra: <String, dynamic>{
//                         kTransitionInfoKey: const TransitionInfo(
//                           hasTransition: true,
//                           transitionType: PageTransitionType.rightToLeft,
//                         ),
//                       },
//                     );
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     height: 60.0,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).primary,
//                       boxShadow: const [
//                         BoxShadow(
//                           blurRadius: 4.0,
//                           color: Color(0x320E151B),
//                           offset: Offset(
//                             0.0,
//                             -2.0,
//                           ),
//                         )
//                       ],
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(0.0),
//                         bottomRight: Radius.circular(0.0),
//                         topLeft: Radius.circular(16.0),
//                         topRight: Radius.circular(16.0),
//                       ),
//                     ),
//                     alignment: const AlignmentDirectional(0.0, -0.35),
//                     child: Text(
//                       'Imprimir',
//                       style:
//                           FlutterFlowTheme.of(context).headlineMedium.override(
//                                 fontFamily: 'Outfit',
//                                 color: Colors.white,
//                                 letterSpacing: 0.0,
//                               ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
