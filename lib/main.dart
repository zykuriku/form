import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',

      home:  SafeArea(child: Scaffold(
          appBar: AppBar(
            title: Text('Form',
            style: TextStyle(
              color: Colors.white
            ),),
            backgroundColor: Colors.deepPurple,
          ),
          body: FormPage())),
    );
  }
}

class FormPage extends StatefulWidget {
  FormPage({super.key});


  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> countries = [
    "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda",
    "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain",
    "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan",
    "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria",
    "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia", "Cameroon", "Canada",
    "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros",
    "Congo, Democratic Republic of the", "Congo, Republic of the", "Costa Rica",
    "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica",
    "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea",
    "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland", "France",
    "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala",
    "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland",
    "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica",
    "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South",
    "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia",
    "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi",
    "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania",
    "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro",
    "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands",
    "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Macedonia", "Norway",
    "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay",
    "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda",
    "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines",
    "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia",
    "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands",
    "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname",
    "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand",
    "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey",
    "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates",
    "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu",
    "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"
  ];
  @override
  Widget build(BuildContext context) {
    return

      FormBuilder(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FormBuilderTextField(

                name: 'name',
                decoration: const InputDecoration(labelText: 'Name'
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxWordsCount(20),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FormBuilderTextField(

                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FormBuilderTextField(
                name: 'number',
                decoration: const InputDecoration(labelText: 'Mobile Number'),

                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.numeric(errorText: 'Maximum 10 digits only. '),
                ]),
              ),
            ),

    Padding(
      padding: const EdgeInsets.all(15.0),
      child: FormBuilderDropdown<String>(
      name: 'gender',

      decoration: InputDecoration(
      labelText: 'Gender',
      suffix: IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
      _formKey.currentState!.fields['gender']
          ?.reset();
      },
      ),
      hintText: 'Select Gender',
      ),
      items: genderOptions
          .map((gender) => DropdownMenuItem(
      alignment: AlignmentDirectional.center,
      value: gender,
      child: Text(gender),
      ))
          .toList(),
      ),
    ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FormBuilderDropdown<String>(
                name: 'country',

                decoration: InputDecoration(
                  labelText: 'Country',
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['country']
                          ?.reset();
                    },
                  ),
                  hintText: 'Select Country',
                ),
                items: countries
                    .map((country) => DropdownMenuItem(
                  alignment: AlignmentDirectional.center,
                  value: country,
                  child: Text(country),
                ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FormBuilderTextField(

                name: 'State',
                decoration: const InputDecoration(labelText: 'State'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxWordsCount(20),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FormBuilderTextField(

                name: 'city',
                decoration: const InputDecoration(labelText: 'City'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxWordsCount(20),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(


                color: Colors.deepPurple,
                onPressed: () {
                  // Validate and save the form values
                  _formKey.currentState?.saveAndValidate();
                  debugPrint(_formKey.currentState?.value.toString());

                  // On another side, can access all field values without saving form with instantValues
                  _formKey.currentState?.validate();
                  debugPrint(_formKey.currentState?.instantValue.toString());
                },
                child: const Text('Submit',
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
            )
          ],
        ),
      );
  }
}


