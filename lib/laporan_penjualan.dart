// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:sticky_headers/sticky_headers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'laporan_penjualan_model.dart';
// export 'laporan_penjualan_model.dart';

// class LaporanPenjualanWidget extends StatefulWidget {
//   const LaporanPenjualanWidget({super.key});

//   @override
//   State<LaporanPenjualanWidget> createState() => _LaporanPenjualanWidgetState();
// }

// class _LaporanPenjualanWidgetState extends State<LaporanPenjualanWidget> {
//   late LaporanPenjualanModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => LaporanPenjualanModel());
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
//           title: Text(
//             'Laporan Penjualan',
//             style: FlutterFlowTheme.of(context).headlineLarge.override(
//                   fontFamily: 'Outfit',
//                   fontSize: 27,
//                 ),
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
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                           child: Text(
//                             'Date',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Readex Pro',
//                                   color: FlutterFlowTheme.of(context).info,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                           child: Text(
//                             'Product',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Readex Pro',
//                                   color: FlutterFlowTheme.of(context).info,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                           child: Text(
//                             'Harga Jual',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Readex Pro',
//                                   color: FlutterFlowTheme.of(context).info,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                           child: Text(
//                             'Qty Terjual',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'Readex Pro',
//                                   color: FlutterFlowTheme.of(context).info,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
//                           child: Text(
//                             'Total',
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
//                                                   10, 0, 0, 0),
//                                           child: Text(
//                                             '22 - 01 - 2024',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   fontFamily: 'Readex Pro',
//                                                   fontSize: 12,
//                                                 ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   18, 0, 0, 0),
//                                           child: Text(
//                                             '100',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   fontFamily: 'Readex Pro',
//                                                   fontSize: 12,
//                                                 ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   30, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   fontFamily: 'Readex Pro',
//                                                   fontSize: 12,
//                                                 ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   40, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   fontFamily: 'Readex Pro',
//                                                   fontSize: 12,
//                                                 ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   40, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                                   fontFamily: 'Readex Pro',
//                                                   fontSize: 12,
//                                                 ),
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
//                                                   10, 0, 0, 0),
//                                           child: Text(
//                                             'Minyak',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   75, 0, 0, 0),
//                                           child: Text(
//                                             '100',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   30, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   40, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
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
//                                                   10, 0, 0, 0),
//                                           child: Text(
//                                             'Gula',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   92, 0, 0, 0),
//                                           child: Text(
//                                             '100',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   30, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   40, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
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
//                                                   10, 0, 0, 0),
//                                           child: Text(
//                                             'snack',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   86, 0, 0, 0),
//                                           child: Text(
//                                             '100',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   30, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   40, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
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
//                                                   10, 0, 0, 0),
//                                           child: Text(
//                                             'permen',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   71, 0, 0, 0),
//                                           child: Text(
//                                             '100',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   30, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   40, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
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
//                                                   10, 0, 0, 0),
//                                           child: Text(
//                                             'Tissue',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   80, 0, 0, 0),
//                                           child: Text(
//                                             '100',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   30, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   40, 0, 0, 0),
//                                           child: Text(
//                                             'Rp.10.000',
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

