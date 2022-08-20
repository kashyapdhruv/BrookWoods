Container(
margin: const EdgeInsets.only(top: 30),
width: double.infinity,
height: 550,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
icons[current],
size: 200,
color: Colors.deepPurple,
),
const SizedBox(
height: 10,
),
Text(
items[current],
style: GoogleFonts.laila(
fontWeight: FontWeight.w500,
fontSize: 30,
color: Colors.deepPurple),
),
],
),
















List<IconData> icons = [
  Icons.home,
  Icons.explore,
  Icons.search,
  Icons.feed,
  Icons.post_add,
  Icons.local_activity,
  Icons.settings,
  Icons.person
];