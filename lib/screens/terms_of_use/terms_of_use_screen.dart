import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);
  static const String routeName = '/terms_of_use_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms of use',
        ),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: const [
          Text(
              '''Terms and Conditions ("Terms")Last updated: ​(add date)Please read these Terms and Conditions ("Terms", "Terms and Conditions") carefully before usingthe ​http://www.mywebsite.com (change this)​ website and the ​My Mobile App (change this)​ mobileapplication (the "Service") operated by ​My Company (change this)​ ("us", "we", or "our").Your access to and use of the Service is conditioned on your acceptance of and compliance withthese Terms. These Terms apply to all visitors, users and others who access or use the Service.By accessing or using the Service you agree to be bound by these Terms. If you disagreewith any part of the terms then you may not access the Service.PurchasesIf you wish to purchase any product or service made available through the Service ("Purchase"),you may be asked to supply certain information relevant to your Purchase including, withoutlimitation, your ...The Purchases section is for businesses that sell online (physical or digital). For the fulldisclosure section, ​create your own Terms and Conditions​.SubscriptionsSome parts of the Service are billed on a subscription basis ("Subscription(s)"). You will be billed inadvance on a recurring ...The Subscriptions section is for SaaS businesses. For the full disclosure section, ​create yourown Terms and Conditions​.ContentOur Service allows you to post, link, store, share and otherwise make available certain information,text, graphics, videos, or other material ("Content"). You are responsible for the ...The Content section is for businesses that allow users to create, edit, share, make content ontheir websites or apps. For the full disclosure section, ​create your own Terms and Conditions​.
Links To Other Web SitesOur Service may contain links to third-party web sites or services that are not owned or controlledby ​My Company (change this).My Company (change this)​ has no control over, and assumes no responsibility for, the content,privacy policies, or practices of any third party web sites or services. You further acknowledge andagree that ​My Company (change this)​ shall not be responsible or liable, directly or indirectly, for anydamage or loss caused or alleged to be caused by or in connection with use of or reliance on anysuch content, goods or services available on or through any such web sites or services.ChangesWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If arevision is material we will try to provide at least ​30 (change this)​ days' notice prior to any new termstaking effect. What constitutes a material change will be determined at our sole discretion.Contact UsIf you have any questions about these Terms, please contact us.Create your own Terms and ConditionsFor websites, apps and more. Download as HTML or Text. Unlock premium content.Disclaimer: Legal information is not legal advice. ​Read the disclaimer​.
'''),
        ],
      ),
    );
  }
}
