// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:sticky_headers/sticky_headers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'listcustomer_model.dart';
// export 'listcustomer_model.dart';

// class ListcustomerWidget extends StatefulWidget {
//   const ListcustomerWidget({super.key});

//   @override
//   State<ListcustomerWidget> createState() => _ListcustomerWidgetState();
// }

// class _ListcustomerWidgetState extends State<ListcustomerWidget> {
//   late ListcustomerModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ListcustomerModel());
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isiOS) {
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(
//           statusBarBrightness: Theme.of(context).brightness,
//           systemStatusBarContrastEnforced: true,
//         ),
//       );
//     }

//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         appBar: AppBar(
//           backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//           automaticallyImplyLeading: false,
//           title: Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
//             child: Text(
//               'List Customer',
//               style: FlutterFlowTheme.of(context).headlineLarge.override(
//                     fontFamily: 'Outfit',
//                     fontSize: 25,
//                   ),
//             ),
//           ),
//           actions: [],
//           centerTitle: false,
//           elevation: 0,
//         ),
//         body: SafeArea(
//           top: true,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 StickyHeader(
//                   overlapHeaders: false,
//                   header: Container(
//                     width: double.infinity,
//                     height: 50,
//                     constraints: BoxConstraints(
//                       maxWidth: 430,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFC42E1D),
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                     alignment: AlignmentDirectional(-1, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(44, 0, 30, 0),
//                           child: Text(
//                             'Nama',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Readex Pro',
//                                   color: FlutterFlowTheme.of(context).info,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
//                           child: Text(
//                             'Alamat',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Readex Pro',
//                                   color: FlutterFlowTheme.of(context).info,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(56, 0, 0, 0),
//                           child: Text(
//                             'No Telephone',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Readex Pro',
//                                   color: FlutterFlowTheme.of(context).info,
//                                 ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   content: Container(
//                     width: double.infinity,
//                     constraints: BoxConstraints(
//                       maxWidth: 430,
//                     ),
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                     child: ListView(
//                       padding: EdgeInsets.zero,
//                       primary: false,
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       children: [
//                         Align(
//                           alignment: AlignmentDirectional(0, 0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 0,
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     offset: Offset(0, 1),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     0, 12, 16, 12),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   48, 0, 60, 0),
//                                           child: Text(
//                                             'alif',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   28, 0, 0, 0),
//                                           child: Text(
//                                             'Malang',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   55, 0, 0, 0),
//                                           child: Text(
//                                             '081234567891',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(0, 0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 0,
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     offset: Offset(0, 1),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     0, 12, 16, 12),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   45, 0, 60, 0),
//                                           child: Text(
//                                             'Toni',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   24, 0, 0, 0),
//                                           child: Text(
//                                             'Malang',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   55, 0, 0, 0),
//                                           child: Text(
//                                             '081234567891',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(0, 0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 0,
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     offset: Offset(0, 1),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     0, 12, 16, 12),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   44, 0, 60, 0),
//                                           child: Text(
//                                             'Iham',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   17, 0, 0, 0),
//                                           child: Text(
//                                             'Malang',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   55, 0, 0, 0),
//                                           child: Text(
//                                             '081234567891',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(0, 0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 0,
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     offset: Offset(0, 1),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     0, 12, 16, 12),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   44, 0, 60, 0),
//                                           child: Text(
//                                             'rendy',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   15, 0, 0, 0),
//                                           child: Text(
//                                             'Malang',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   55, 0, 0, 0),
//                                           child: Text(
//                                             '081234567891',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(0, 0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 0,
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     offset: Offset(0, 1),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     0, 12, 16, 12),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   43, 0, 60, 0),
//                                           child: Text(
//                                             'squash',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   8, 0, 0, 0),
//                                           child: Text(
//                                             'Malang',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   55, 0, 0, 0),
//                                           child: Text(
//                                             '081234567891',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(0, 0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 0,
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     offset: Offset(0, 1),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     0, 12, 16, 12),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   44, 0, 60, 0),
//                                           child: Text(
//                                             'abdul',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   16, 0, 0, 0),
//                                           child: Text(
//                                             'Malang',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   55, 0, 0, 0),
//                                           child: Text(
//                                             '081234567891',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(0, 0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 0,
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     offset: Offset(0, 1),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme.of(context)
//                                       .primaryBackground,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     0, 12, 16, 12),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   44, 0, 60, 0),
//                                           child: Text(
//                                             'rehan',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   15, 0, 0, 0),
//                                           child: Text(
//                                             'Malang',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   55, 0, 0, 0),
//                                           child: Text(
//                                             '081234567891',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 400),
//                   child: StickyHeader(
//                     overlapHeaders: false,
//                     header: Container(),
//                     content: Container(
//                       width: double.infinity,
//                       constraints: BoxConstraints(
//                         maxWidth: 430,
//                       ),
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
