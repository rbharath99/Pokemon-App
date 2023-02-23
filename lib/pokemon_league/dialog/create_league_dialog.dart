import 'package:flutter/material.dart';

class CreateLeagueDialog extends StatelessWidget {
  const CreateLeagueDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final participantsController = TextEditingController();
    final entryFeeController = TextEditingController();
    final prizeFeeController = TextEditingController();
    return Dialog(
      child: SizedBox(
        width: 500,
        height: 500,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Name'),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(),
                    controller: nameController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Participants'),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(),
                    controller: participantsController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Entry Fee'),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(),
                    controller: entryFeeController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Prize Fee'),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(),
                    controller: prizeFeeController,
                  ),
                ),
              ],
            ),
            TextButton(
              child: Text('Create League!'),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
