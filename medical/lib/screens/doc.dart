import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerDemo extends StatelessWidget {
  const FilePickerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Upload',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FilePickerDemo(),
    );
  }
}

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({Key? key}) : super(key: key);

  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  List<File> uploadedFiles = [];

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        uploadedFiles.addAll(result.paths.map((path) => File(path!)));
      });
    }
  }

  Widget _buildUploadedFileList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: uploadedFiles.length,
      itemBuilder: (context, index) {
        final file = uploadedFiles[index];
        final isImage = file.path.endsWith('.png') ||
            file.path.endsWith('.jpg') ||
            file.path.endsWith('.jpeg');

        return ListTile(
          leading: isImage
              ? Image.file(file, width: 50, height: 50, fit: BoxFit.cover)
              : const Icon(Icons.insert_drive_file, color: Colors.blue),
          title: Text(file.path.split('/').last),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                uploadedFiles.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Upload')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.upload_file, size: 50, color: Colors.blue),
                  const SizedBox(height: 8),
                  const Text('Drag and Drop files to upload',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _pickFiles,
                    child: const Text('Browse'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Uploaded Files:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: uploadedFiles.isNotEmpty
                  ? _buildUploadedFileList()
                  : const Center(
                      child: Text('No files uploaded yet.',
                          style: TextStyle(color: Colors.grey)),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
