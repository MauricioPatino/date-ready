
// List<User> users = [
//   User(
//       id: 0,
//       name: 'Alfred',
//       age: 23,
//       imageUrls: [
//         'https://i.kym-cdn.com/photos/images/original/002/250/753/a0a.jpg'
//       ],
//       bio: 'I hate you Mao',
//       jobTitle: 'Barista')
// ];
//

//   SwipeableCardSectionController _cardController =
//   SwipeableCardSectionController();
// int counter = 4;
// child: _pages.elementAt(_selectedIndex), Used to display icon


// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     SwipeableCardsSection(
//       cardController: _cardController,
//       context: context,
//       //add the first 3 cards
//       items: [
//         CardView(text: "Juli", age: "19"),
//         CardView(text: "Reyna", age: "29"),
//         CardView(text: "Jessy", age: "21"),
//         CardView(text: "Sarah"),
//         CardView(text: "Maggs"),
//         CardView(text: "Lucy"),
//         CardView(text: "Patricia"),
//         CardView(text: "Ashley"),
//         CardView(text: "Priya"),
//       ],
//       onCardSwiped: (dir, index, widget) {
//         //Add the next card
//         if (counter <= 13) {
//           _cardController.addItem(CardView(age: "100"));
//
//           counter++;
//         }
//
//         if (dir == Direction.left) {
//           print('onDisliked ${(widget as CardView).text} $index');
//         } else if (dir == Direction.right) {
//           print('onLiked ${(widget as CardView).text} $index');
//         } else if (dir == Direction.up) {
//           print('onUp ${(widget as CardView).text} $index');
//         } else if (dir == Direction.down) {
//           print('onDown ${(widget as CardView).text} $index');
//         }
//       },
//       enableSwipeUp: true,
//       enableSwipeDown: true,
//     ),
//     Container(
//       margin: EdgeInsets.symmetric(vertical: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             child: Icon(Icons.chevron_left),
//             onPressed: () => _cardController.triggerSwipeLeft(),
//           ),
//           FloatingActionButton(
//             child: Icon(Icons.chevron_right),
//             onPressed: () => _cardController.triggerSwipeRight(),
//           ),
//           FloatingActionButton(
//             child: Icon(Icons.arrow_upward),
//             onPressed: () => _cardController.triggerSwipeUp(),
//           ),
//           FloatingActionButton(
//             child: Icon(Icons.arrow_downward),
//             onPressed: () => _cardController.triggerSwipeDown(),
//           ),
//         ],
//       ),
//     )
//   ],
// ),


// children: users.map((users) => playCards(users)).toList(),
