part of 'ContactImports.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  void initState() {

    super.initState();
  }
  final contactData = ContactData();
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "contactUs"),
      back: true,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          BuildContactFormInputs(contactData: contactData),
          BuildContactButton(contactData: contactData),
        ],
      ),
    );
  }
}
