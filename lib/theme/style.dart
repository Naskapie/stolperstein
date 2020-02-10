import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blueGrey,
  );
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(widget._scannerType == TEXT_SCANNER
//             ? 'Text Recognition'
//             : 'Barcode Scanner'),
//       ),
//       body: Column(
//         children: <Widget>[
//           buildImage(context),
//           buildTextList(_currentTextLabels)
//         ],
//       ));
// }

// Widget buildImage(BuildContext context) {
//   return Expanded(
//     flex: 2,
//     child: Container(
//       decoration: BoxDecoration(color: Colors.black),
//       child: Center(
//         child: FutureBuilder<Size>(
//           future: _getImageSize(Image.file(widget._file, fit: BoxFit.fitWidth)),
//           builder: (BuildContext context, AsyncSnapshot<Size> snapshot) {
//             if (snapshot.hasData) {
//               return Container(
//                   foregroundDecoration:
//                       TextDetectDecoration(_currentTextLabels, snapshot.data),
//                   child: Image.file(widget._file, fit: BoxFit.fitWidth));
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     ),
//   );
// }

//   Widget buildTextList(List<VisionText> texts) {
//     if (texts.length == 0) {
//       return Expanded(
//         flex: 1,
//         child: Center(child: Text('No text detected', style: Theme.of(context).textTheme.subhead),
//       ));
//     }
//     return Expanded(
//       flex: 1,
//       child: Container(
//         child: ListView.builder(
//             padding: const EdgeInsets.all(1.0),
//             itemCount: texts.length,
//             itemBuilder: (context, i) {
//               return _buildTextRow(texts[i].text);
//             }),
//       ),
//     );
//   }

//   Widget _buildTextRow(text) {
//     return ListTile(
//       title: Text(
//         "$text",
//       ),
//       dense: true,
//     );
//   }
