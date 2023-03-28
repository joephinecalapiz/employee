import 'package:flutter/material.dart';
import 'package:frontend_diaryapp/experiment/data_table.dart';

class ActionButtons extends StatefulWidget {

  final Function change;
  const ActionButtons({super.key, required this.change});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  bool isFront = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          // today chip
          Container(
            width: 155.0,
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // sun icon
                const Icon(Icons.wb_sunny_rounded),
                const SizedBox(width: 10.0),

                // today details (date, month)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Oranienbaum",
                        ),
                      ),
                      Text(
                        'MAR 23/2023',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Oranienbaum",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // edit button
          Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
            ),
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white
                ),
                onPressed: () async{
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeData()
                      )
                  );
                },
                child: const Icon(Icons.mode_edit_outlined,color: Colors.white,)

            ),
          ),
          const SizedBox(width: 10.0),
          // calender switch button
          InkWell(
            onTap: () {
              widget.change();
              setState(() {
                isFront = !isFront;
              });
            },
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: isFront ? Colors.black87 : Colors.cyan,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFront ? Icons.calendar_month_rounded : Icons.undo_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
