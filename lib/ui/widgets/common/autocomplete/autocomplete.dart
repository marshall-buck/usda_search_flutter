import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'autocomplete_model.dart';

class Autocomplete extends StackedView<AutocompleteModel> {
  const Autocomplete({super.key});

  @override
  Widget builder(
    BuildContext context,
    AutocompleteModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  AutocompleteModel viewModelBuilder(
    BuildContext context,
  ) =>
      AutocompleteModel();
}
