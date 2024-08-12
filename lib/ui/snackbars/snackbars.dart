import 'package:flutter/material.dart';
import 'package:sustainaville/ui/snackbars/snackbar.dart';
import 'package:sustainaville/utils/constants/colors.dart';

abstract class GameSnackbars {
  static GameSnackbar gameSaved() {
    return const GameSnackbar(
      message: 'Game saved',
      icon: Icons.check,
    );
  }

  static GameSnackbar errorSavingGame() {
    return const GameSnackbar(
      message: 'Game not saved. Error occured',
      icon: Icons.close,
      backgroundColor: AppColors.snackbarErrorBackground,
      foregroundColor: AppColors.snackbarErrorForeground,
    );
  }

  static GameSnackbar gameLoaded() {
    return const GameSnackbar(
      message: 'Game loaded',
      icon: Icons.check,
    );
  }

  static GameSnackbar errorLoadingGame() {
    return const GameSnackbar(
      message: 'Game not loaded. Error occured',
      icon: Icons.close,
      backgroundColor: AppColors.snackbarErrorBackground,
      foregroundColor: AppColors.snackbarErrorForeground,
    );
  }

  static GameSnackbar gameExported() {
    return const GameSnackbar(
      message: 'Game Exported!',
      icon: Icons.check,
    );
  }

  static GameSnackbar errorExportingGame() {
    return const GameSnackbar(
      message: 'Game not exported. Error occured',
      icon: Icons.close,
      backgroundColor: AppColors.snackbarErrorBackground,
      foregroundColor: AppColors.snackbarErrorForeground,
    );
  }

  static GameSnackbar fundingSuccess({
    required num funds,
    num constituency = 0,
    num publicOpinion = 0,
  }) {
    String text = 'Funding secured: $funds';
    if (constituency != 0) {
      text += '\nConstituency: ${constituency > 0 ? '+$constituency' : constituency}';
    }
    if (publicOpinion != 0) {
      text += '\nPublic Opinion: ${publicOpinion > 0 ? '+$publicOpinion' : publicOpinion}';
    }

    return GameSnackbar(
      message: text,
      icon: Icons.check,
    );
  }

  static GameSnackbar fundingFailed({
    num constituency = 0,
    num publicOpinion = 0,
  }) {
    String text = 'Funding not secured';
    if (constituency != 0) {
      text += '\nConstituency: ${constituency > 0 ? '+$constituency' : constituency}';
    }
    if (publicOpinion != 0) {
      text += '\nPublic Opinion: ${publicOpinion > 0 ? '+$publicOpinion' : publicOpinion}';
    }

    return GameSnackbar(
      message: text,
      icon: Icons.close,
      backgroundColor: AppColors.snackbarErrorBackground,
      foregroundColor: AppColors.snackbarErrorForeground,
    );
  }

  static GameSnackbar campaignNotEnoughFunds() {
    return const GameSnackbar(
      message: 'Not enough funds for creating a campaign',
      icon: Icons.close,
      backgroundColor: AppColors.snackbarErrorBackground,
      foregroundColor: AppColors.snackbarErrorForeground,
    );
  }

  static GameSnackbar campaignExecuted({
    required num funds,
    num constituency = 0,
    num publicOpinion = 0,
  }) {
    String text = 'Campaign executed';
    if (funds > 0) {
      text += '\nFunds Spent: $funds';
    }
    if (constituency != 0) {
      text += '\nConstituency: ${constituency > 0 ? '+$constituency' : constituency}';
    }
    if (publicOpinion != 0) {
      text += '\nPublic Opinion: ${publicOpinion > 0 ? '+$publicOpinion' : publicOpinion}';
    }

    return GameSnackbar(
      message: text,
      icon: Icons.check,
    );
  }

  static GameSnackbar feedbackFailed() {
    return const GameSnackbar(
      message: 'Error getting feedback',
      icon: Icons.close,
      backgroundColor: AppColors.snackbarErrorBackground,
      foregroundColor: AppColors.snackbarErrorForeground,
    );
  }

  static GameSnackbar messageBlocked(String blockMessage) {
    return GameSnackbar(
      message: 'Message was blocked: $blockMessage',
      icon: Icons.close,
      backgroundColor: AppColors.snackbarErrorBackground,
      foregroundColor: AppColors.snackbarErrorForeground,
    );
  }

  static GameSnackbar messageFailed() {
    return const GameSnackbar(
      message: 'Message sending failed',
      icon: Icons.close,
      backgroundColor: AppColors.snackbarErrorBackground,
      foregroundColor: AppColors.snackbarErrorForeground,
    );
  }
}
