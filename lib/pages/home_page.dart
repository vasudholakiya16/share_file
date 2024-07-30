import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(
        context,
      ),
    );
  }

  Widget _buildUI(
    BuildContext context,
  ) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _shareTextButton(),
          _shareFileButton(),
        ],
      ),
    );
  }

  Widget _shareTextButton() {
    return MaterialButton(
      onPressed: () async {
        final result = await Share.shareWithResult(
          'Check out my website https://hussainmustafa.com',
        );
      },
      color: Colors.green,
      child: const Text(
        "Share Text",
      ),
    );
  }

  Widget _shareFileButton() {
    return MaterialButton(
      onPressed: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );
        if (image != null) {
          await Share.shareXFiles(
            [
              XFile(image.path),
            ],
            // text: 'Great picture',
          );
        }
      },
      color: Colors.red,
      child: const Text("Share File"),
    );
  }
}
