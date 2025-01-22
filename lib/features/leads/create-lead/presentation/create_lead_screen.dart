import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trick_crm_app/core/helpers/shaerd_pref_helper.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../logic/cubit/leads_cubit.dart';
import '../logic/cubit/create_lead_cubit.dart';
import 'widgets/user_form.dart';

class CreateLeadScreen extends StatefulWidget {
  const CreateLeadScreen({super.key});

  @override
  State<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {
  List<Map<String, dynamic>>? assignedToNames;
  List<Map<String, dynamic>>? leadOwner;
  @override
  void initState() {
    super.initState();
    GetIt.I<LeadsCubit>().getLeads();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<CreateLeadCubit>(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            if (leadOwner == null || assignedToNames == null)
              Center(
                child: CircularProgressIndicator(
                  color: R.colors.primaryColor,
                ),
              )
            else
              userForm(
                context,
                leadOwner ??
                    [
                      {'name': 'No data'}
                    ],
                assignedToNames ??
                    [
                      {'name': 'No data'}
                    ],
              ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: appTopBarDialog(
                "Create New Lead",
                "complete all the fields below the form",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadUserData() async {
    try {
      final userData = await SharedPrefHelper.getUser();
      log('User data: ${userData?.name}');
      final assignedToNames = await loadAssignedToNames();
      log('Assigned to names: $assignedToNames');
      if (mounted) {
        var userName = userData?.name ?? 'Unknown User';
        var userId = userData?.id;
        setState(() {
          leadOwner = [
            {
              'name': userName,
              'id': userId,
            },
          ];
          this.assignedToNames = assignedToNames;
        });
      }
    } catch (e) {
      debugPrint('Error loading user data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> loadAssignedToNames() async {
    while (GetIt.I<LeadsCubit>().state is Loading) {
      await Future.delayed(const Duration(milliseconds: 10));
    }

    final leadsState = GetIt.I<LeadsCubit>().state;
    return leadsState.maybeWhen(
      loading: () => [
        {'name': 'Loading...', 'id': null}
      ],
      success: (leadsModel) {
        if (leadsModel.users == null || leadsModel.users!.isEmpty) {
          return [
            {'name': 'No users available', 'id': null}
          ];
        }
        return leadsModel.users!
            .map((user) => {'name': user.name ?? 'Unknown User', 'id': user.id})
            .toList();
      },
      error: (message) => [
        {'name': 'Error: $message', 'id': null}
      ],
      orElse: () => [
        {'name': 'No data available', 'id': null}
      ],
    );
  }
}
