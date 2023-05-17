import 'package:facetrip/core/constants/constants.dart';
import 'package:facetrip/core/shered/widget/react_widget.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/settings/presentation/bloc/settings_bloc.dart';
import 'package:facetrip/modules/settings/presentation/widgets/interesses_widget.dart';
import 'package:facetrip/modules/settings/presentation/widgets/show_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SettingWidget extends StatefulWidget {
  final UserEntity user;
  const SettingWidget({Key? key, required this.user}) : super(key: key);

  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  late final FormGroup _form;

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  String imageFile = '';
  bool isTravaled = false;
  List<String> listInterests = [];
  @override
  void initState() {
    super.initState();
    isTravaled = widget.user.isTraveled;
    listInterests.addAll(widget.user.listInterests);
    _form = FormGroup({
      'name': FormControl<String>(
        value: widget.user.name,
        validators: [Validators.required, Validators.minLength(3)],
      ),
      'description': FormControl<String>(
        value: widget.user.description,
        validators: [Validators.required, Validators.minLength(3)],
      ),
      'email': FormControl<String>(
        value: widget.user.email,
        validators: [Validators.required, Validators.email],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) async {
        if (state.status.isError) {
          _btnController.error();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
            ),
          );
          await Future.delayed(const Duration(seconds: 1));
          _btnController.reset();
        } else if (state.status.isUpdated) {
          _btnController.success();
          await Future.delayed(const Duration(seconds: 1));
          _btnController.reset();
        }
        imageFile = state.imageFile;
      },
      child: Scaffold(
        body: ReactiveForm(
          formGroup: _form,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: paddingHorizonteLarge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        margin: paddingTitele,
                        child: InkWell(
                          onTap: () {
                            context
                                .read<SettingsBloc>()
                                .add(SettingsEvent.setAvatarUrl(imageFile));
                          },
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: ShowImageWidget(
                              imageFile: imageFile,
                              imageUrl: widget.user.url,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SwitchListTile(
                        selected: isTravaled,
                        title: const Text('Is traveling'),
                        value: isTravaled,
                        secondary: const Icon(
                          Icons.travel_explore,
                        ),
                        onChanged: (onChanged) {
                          setState(() {
                            isTravaled = onChanged;
                          });
                        }),
                    const SizedBox(height: 10),
                    const ReactWidget(name: 'Name'),
                    const ReactWidget(name: 'Email'),
                    const ReactWidget(name: 'Description'),
                    InteressesWidget(
                      list: listInterests,
                      changeList: (onChanged, string) {
                        if (onChanged) {
                          listInterests.add(string);
                        } else {
                          listInterests
                              .removeWhere((element) => element == string);
                        }
                        setState(() {});
                      },
                    ),
                    RoundedLoadingButton(
                      color: Theme.of(context).cardColor,
                      controller: _btnController,
                      onPressed: () {
                        if (_form.valid) {
                          final email = _form.value['email'] as String;
                          final name = _form.value['name'] as String;
                          final description =
                              _form.value['description'] as String;
                          var newUser = widget.user.copyWith(
                              description: description,
                              email: email,
                              name: name,
                              isTraveled: isTravaled,
                              listInterests: listInterests);
                          context.read<SettingsBloc>().add(
                              SettingsEvent.updateUser(newUser, imageFile));
                        } else {
                          _form.markAllAsTouched();
                          _btnController.reset();
                        }
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
