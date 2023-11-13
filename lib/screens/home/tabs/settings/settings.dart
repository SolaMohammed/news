import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool arSwitch=false;
  late SettingsProvider provider;

  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings,style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              SizedBox(width: 12,),
              Text(AppLocalizations.of(context)!.arabic,style: TextStyle(fontSize: 22,)),
              Spacer(),
              Switch(value: arSwitch, onChanged: (newValue) {
                arSwitch=newValue;
                if(arSwitch){
                  provider.setCurrentLocale("ar");
                }else{
                  provider.setCurrentLocale("en");
                }

              },activeColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

