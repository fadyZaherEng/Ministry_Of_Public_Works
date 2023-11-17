// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get projects {
    return Intl.message(
      'Projects',
      name: 'projects',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Risks`
  String get risks {
    return Intl.message(
      'Risks',
      name: 'risks',
      desc: '',
      args: [],
    );
  }

  /// `Issues`
  String get issues {
    return Intl.message(
      'Issues',
      name: 'issues',
      desc: '',
      args: [],
    );
  }

  /// `Milestone`
  String get milestone {
    return Intl.message(
      'Milestone',
      name: 'milestone',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Search payment`
  String get searchPayment {
    return Intl.message(
      'Search payment',
      name: 'searchPayment',
      desc: '',
      args: [],
    );
  }

  /// `Variation Order`
  String get variationOrder {
    return Intl.message(
      'Variation Order',
      name: 'variationOrder',
      desc: '',
      args: [],
    );
  }

  /// `Penalties`
  String get penalties {
    return Intl.message(
      'Penalties',
      name: 'penalties',
      desc: '',
      args: [],
    );
  }

  /// `Supervision Services `
  String get consultantAgreement {
    return Intl.message(
      'Supervision Services ',
      name: 'consultantAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Search project`
  String get searchProject {
    return Intl.message(
      'Search project',
      name: 'searchProject',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message(
      'Sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Search report`
  String get searchReport {
    return Intl.message(
      'Search report',
      name: 'searchReport',
      desc: '',
      args: [],
    );
  }

  /// `More Details`
  String get moreDetails {
    return Intl.message(
      'More Details',
      name: 'moreDetails',
      desc: '',
      args: [],
    );
  }

  /// `Open Report`
  String get openReport {
    return Intl.message(
      'Open Report',
      name: 'openReport',
      desc: '',
      args: [],
    );
  }

  /// `View Report`
  String get viewReport {
    return Intl.message(
      'View Report',
      name: 'viewReport',
      desc: '',
      args: [],
    );
  }

  /// `Open PDF`
  String get downloadReport {
    return Intl.message(
      'Open PDF',
      name: 'downloadReport',
      desc: '',
      args: [],
    );
  }

  /// `Sort ascending (a-z)`
  String get sortAscending {
    return Intl.message(
      'Sort ascending (a-z)',
      name: 'sortAscending',
      desc: '',
      args: [],
    );
  }

  /// `Sort descending (z-a)`
  String get sortDescending {
    return Intl.message(
      'Sort descending (z-a)',
      name: 'sortDescending',
      desc: '',
      args: [],
    );
  }

  /// `Recently added`
  String get recentlyAdded {
    return Intl.message(
      'Recently added',
      name: 'recentlyAdded',
      desc: '',
      args: [],
    );
  }

  /// `Old date`
  String get oldDate {
    return Intl.message(
      'Old date',
      name: 'oldDate',
      desc: '',
      args: [],
    );
  }

  /// `Contract Number`
  String get agreementNumber {
    return Intl.message(
      'Contract Number',
      name: 'agreementNumber',
      desc: '',
      args: [],
    );
  }

  /// `Project Phase`
  String get projectPhase {
    return Intl.message(
      'Project Phase',
      name: 'projectPhase',
      desc: '',
      args: [],
    );
  }

  /// `End User`
  String get endUser {
    return Intl.message(
      'End User',
      name: 'endUser',
      desc: '',
      args: [],
    );
  }

  /// `Sector`
  String get sector {
    return Intl.message(
      'Sector',
      name: 'sector',
      desc: '',
      args: [],
    );
  }

  /// `Creation Date`
  String get creationDate {
    return Intl.message(
      'Creation Date',
      name: 'creationDate',
      desc: '',
      args: [],
    );
  }

  /// `Project Engineer`
  String get projectEngineer {
    return Intl.message(
      'Project Engineer',
      name: 'projectEngineer',
      desc: '',
      args: [],
    );
  }

  /// `Contract Amount`
  String get contractAmount {
    return Intl.message(
      'Contract Amount',
      name: 'contractAmount',
      desc: '',
      args: [],
    );
  }

  /// `Search risk`
  String get searchRisk {
    return Intl.message(
      'Search risk',
      name: 'searchRisk',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Assigned To`
  String get assignedTo {
    return Intl.message(
      'Assigned To',
      name: 'assignedTo',
      desc: '',
      args: [],
    );
  }

  /// `Probability`
  String get probability {
    return Intl.message(
      'Probability',
      name: 'probability',
      desc: '',
      args: [],
    );
  }

  /// `Impact`
  String get impact {
    return Intl.message(
      'Impact',
      name: 'impact',
      desc: '',
      args: [],
    );
  }

  /// `Severity`
  String get severity {
    return Intl.message(
      'Severity',
      name: 'severity',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get riskDescription {
    return Intl.message(
      'Description',
      name: 'riskDescription',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get statusOnly {
    return Intl.message(
      'Status',
      name: 'statusOnly',
      desc: '',
      args: [],
    );
  }

  /// `Due Date`
  String get dueDate {
    return Intl.message(
      'Due Date',
      name: 'dueDate',
      desc: '',
      args: [],
    );
  }

  /// `Search issue`
  String get searchIssue {
    return Intl.message(
      'Search issue',
      name: 'searchIssue',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Search milestone`
  String get searchMilestone {
    return Intl.message(
      'Search milestone',
      name: 'searchMilestone',
      desc: '',
      args: [],
    );
  }

  /// `Planned Finish Date`
  String get plannedFinishDate {
    return Intl.message(
      'Planned Finish Date',
      name: 'plannedFinishDate',
      desc: '',
      args: [],
    );
  }

  /// `Actual Finish Date`
  String get actualFinishDate {
    return Intl.message(
      'Actual Finish Date',
      name: 'actualFinishDate',
      desc: '',
      args: [],
    );
  }

  /// `Warranties`
  String get warranties {
    return Intl.message(
      'Warranties',
      name: 'warranties',
      desc: '',
      args: [],
    );
  }

  /// `Search warranties`
  String get searchWarranties {
    return Intl.message(
      'Search warranties',
      name: 'searchWarranties',
      desc: '',
      args: [],
    );
  }

  /// `Warranty Type`
  String get warrantyType {
    return Intl.message(
      'Warranty Type',
      name: 'warrantyType',
      desc: '',
      args: [],
    );
  }

  /// `Warranty Amount`
  String get warrantyAmount {
    return Intl.message(
      'Warranty Amount',
      name: 'warrantyAmount',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Payment Amount`
  String get paymentAmount {
    return Intl.message(
      'Payment Amount',
      name: 'paymentAmount',
      desc: '',
      args: [],
    );
  }

  /// `Approval Date`
  String get approvalDate {
    return Intl.message(
      'Approval Date',
      name: 'approvalDate',
      desc: '',
      args: [],
    );
  }

  /// `Planned Payment Date`
  String get plannedPaymentDate {
    return Intl.message(
      'Planned Payment Date',
      name: 'plannedPaymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Actual Payment Date`
  String get actualPaymentDate {
    return Intl.message(
      'Actual Payment Date',
      name: 'actualPaymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Variation`
  String get variation {
    return Intl.message(
      'Variation',
      name: 'variation',
      desc: '',
      args: [],
    );
  }

  /// `Search variation`
  String get searchVariation {
    return Intl.message(
      'Search variation',
      name: 'searchVariation',
      desc: '',
      args: [],
    );
  }

  /// `Impact on Cost`
  String get impactOnCost {
    return Intl.message(
      'Impact on Cost',
      name: 'impactOnCost',
      desc: '',
      args: [],
    );
  }

  /// `Variation Order Value`
  String get variationValue {
    return Intl.message(
      'Variation Order Value',
      name: 'variationValue',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Search penalties`
  String get searchPenalties {
    return Intl.message(
      'Search penalties',
      name: 'searchPenalties',
      desc: '',
      args: [],
    );
  }

  /// `Contractor`
  String get contractor {
    return Intl.message(
      'Contractor',
      name: 'contractor',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Search agreement`
  String get searchAgreement {
    return Intl.message(
      'Search agreement',
      name: 'searchAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Project Phase`
  String get phase {
    return Intl.message(
      'Project Phase',
      name: 'phase',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `No records are found`
  String get noRecordText {
    return Intl.message(
      'No records are found',
      name: 'noRecordText',
      desc: '',
      args: [],
    );
  }

  /// `Download Gallery`
  String get downloadGallery {
    return Intl.message(
      'Download Gallery',
      name: 'downloadGallery',
      desc: '',
      args: [],
    );
  }

  /// `Download Documents`
  String get downloadDocuments {
    return Intl.message(
      'Download Documents',
      name: 'downloadDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Head Of Department`
  String get headOfDepartment {
    return Intl.message(
      'Head Of Department',
      name: 'headOfDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Contract Signing Date`
  String get contractSigningDate {
    return Intl.message(
      'Contract Signing Date',
      name: 'contractSigningDate',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Reports`
  String get monthlyReports {
    return Intl.message(
      'Monthly Reports',
      name: 'monthlyReports',
      desc: '',
      args: [],
    );
  }

  /// `Supervision Service`
  String get consultantAgreements {
    return Intl.message(
      'Supervision Service',
      name: 'consultantAgreements',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Milestones`
  String get milestones {
    return Intl.message(
      'Milestones',
      name: 'milestones',
      desc: '',
      args: [],
    );
  }

  /// `Variation Orders`
  String get variationOrdersCard {
    return Intl.message(
      'Variation Orders',
      name: 'variationOrdersCard',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back !`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back !',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Execution`
  String get execution {
    return Intl.message(
      'Execution',
      name: 'execution',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get design {
    return Intl.message(
      'Design',
      name: 'design',
      desc: '',
      args: [],
    );
  }

  /// `Tendering`
  String get tendering {
    return Intl.message(
      'Tendering',
      name: 'tendering',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Report Summary`
  String get monthlyReportSummary {
    return Intl.message(
      'Monthly Report Summary',
      name: 'monthlyReportSummary',
      desc: '',
      args: [],
    );
  }

  /// `Submitted Reports`
  String get submittedReports {
    return Intl.message(
      'Submitted Reports',
      name: 'submittedReports',
      desc: '',
      args: [],
    );
  }

  /// `UnSubmitted Reports`
  String get unSubmittedReports {
    return Intl.message(
      'UnSubmitted Reports',
      name: 'unSubmittedReports',
      desc: '',
      args: [],
    );
  }

  /// `Penalties Type`
  String get penaltiesType {
    return Intl.message(
      'Penalties Type',
      name: 'penaltiesType',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to download gallery?`
  String get downloadGalleryMessage {
    return Intl.message(
      'Do you want to download gallery?',
      name: 'downloadGalleryMessage',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to download documents?`
  String get downloadDocumentsMessage {
    return Intl.message(
      'Do you want to download documents?',
      name: 'downloadDocumentsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Identification`
  String get identification {
    return Intl.message(
      'Identification',
      name: 'identification',
      desc: '',
      args: [],
    );
  }

  /// `Design Contract Number`
  String get designContractNumber {
    return Intl.message(
      'Design Contract Number',
      name: 'designContractNumber',
      desc: '',
      args: [],
    );
  }

  /// `Financial System Reference Number`
  String get financialSystemReferenceNumber {
    return Intl.message(
      'Financial System Reference Number',
      name: 'financialSystemReferenceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Project Engineer Phone Number `
  String get projectEngineerPhoneNumber {
    return Intl.message(
      'Project Engineer Phone Number ',
      name: 'projectEngineerPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Project Engineer Fax`
  String get projectEngineerFax {
    return Intl.message(
      'Project Engineer Fax',
      name: 'projectEngineerFax',
      desc: '',
      args: [],
    );
  }

  /// `Project Engineer Email`
  String get projectEngineerEmail {
    return Intl.message(
      'Project Engineer Email',
      name: 'projectEngineerEmail',
      desc: '',
      args: [],
    );
  }

  /// `Head Of Department Email`
  String get headOfDepartmentEmail {
    return Intl.message(
      'Head Of Department Email',
      name: 'headOfDepartmentEmail',
      desc: '',
      args: [],
    );
  }

  /// `Deputy Manager`
  String get deputyManager {
    return Intl.message(
      'Deputy Manager',
      name: 'deputyManager',
      desc: '',
      args: [],
    );
  }

  /// `Deputy Manager Phone Number`
  String get deputyManagerPhoneNumber {
    return Intl.message(
      'Deputy Manager Phone Number',
      name: 'deputyManagerPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Deputy Manager Email`
  String get deputyManagerEmail {
    return Intl.message(
      'Deputy Manager Email',
      name: 'deputyManagerEmail',
      desc: '',
      args: [],
    );
  }

  /// `Deputy Manager Fax`
  String get deputyManagerFax {
    return Intl.message(
      'Deputy Manager Fax',
      name: 'deputyManagerFax',
      desc: '',
      args: [],
    );
  }

  /// `Consultant`
  String get consultant {
    return Intl.message(
      'Consultant',
      name: 'consultant',
      desc: '',
      args: [],
    );
  }

  /// `Project Information`
  String get projectInformation {
    return Intl.message(
      'Project Information',
      name: 'projectInformation',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get governorate {
    return Intl.message(
      'Governorate',
      name: 'governorate',
      desc: '',
      args: [],
    );
  }

  /// `Site Area (m2)`
  String get siteArea {
    return Intl.message(
      'Site Area (m2)',
      name: 'siteArea',
      desc: '',
      args: [],
    );
  }

  /// `Build-up Area (m2)`
  String get buildUpArea {
    return Intl.message(
      'Build-up Area (m2)',
      name: 'buildUpArea',
      desc: '',
      args: [],
    );
  }

  /// `Project Components`
  String get components {
    return Intl.message(
      'Project Components',
      name: 'components',
      desc: '',
      args: [],
    );
  }

  /// `Time Schedule Details`
  String get timeInformation {
    return Intl.message(
      'Time Schedule Details',
      name: 'timeInformation',
      desc: '',
      args: [],
    );
  }

  /// `Total Duration`
  String get totalDuration {
    return Intl.message(
      'Total Duration',
      name: 'totalDuration',
      desc: '',
      args: [],
    );
  }

  /// `Agreement Period`
  String get agreementPeriod {
    return Intl.message(
      'Agreement Period',
      name: 'agreementPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Agreement Sign Date`
  String get agreementSignDate {
    return Intl.message(
      'Agreement Sign Date',
      name: 'agreementSignDate',
      desc: '',
      args: [],
    );
  }

  /// `Consultancy Services Start Date`
  String get consultancyServicesStartDate {
    return Intl.message(
      'Consultancy Services Start Date',
      name: 'consultancyServicesStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Planned Implementation Date`
  String get plannedImplementationDate {
    return Intl.message(
      'Planned Implementation Date',
      name: 'plannedImplementationDate',
      desc: '',
      args: [],
    );
  }

  /// `Planned Handover Date`
  String get plannedHandoverDate {
    return Intl.message(
      'Planned Handover Date',
      name: 'plannedHandoverDate',
      desc: '',
      args: [],
    );
  }

  /// `Consultancy Services Expiration Date`
  String get consultancyServicesExpirationDate {
    return Intl.message(
      'Consultancy Services Expiration Date',
      name: 'consultancyServicesExpirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Tender Date`
  String get tenderDate {
    return Intl.message(
      'Tender Date',
      name: 'tenderDate',
      desc: '',
      args: [],
    );
  }

  /// `Financial Information`
  String get paymentsInformation {
    return Intl.message(
      'Financial Information',
      name: 'paymentsInformation',
      desc: '',
      args: [],
    );
  }

  /// `Budget Clause Number `
  String get budgetClauseNumber {
    return Intl.message(
      'Budget Clause Number ',
      name: 'budgetClauseNumber',
      desc: '',
      args: [],
    );
  }

  /// `The Estimated Value Of The Project`
  String get theEstimatedValueOfTheProject {
    return Intl.message(
      'The Estimated Value Of The Project',
      name: 'theEstimatedValueOfTheProject',
      desc: '',
      args: [],
    );
  }

  /// `Total Optional Amount`
  String get totalOptionalAmount {
    return Intl.message(
      'Total Optional Amount',
      name: 'totalOptionalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Project Basic Information`
  String get projectBasicInformation {
    return Intl.message(
      'Project Basic Information',
      name: 'projectBasicInformation',
      desc: '',
      args: [],
    );
  }

  /// `Consultant Phone Number`
  String get consultantPhoneNumber {
    return Intl.message(
      'Consultant Phone Number',
      name: 'consultantPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Consultant Email`
  String get consultantEmail {
    return Intl.message(
      'Consultant Email',
      name: 'consultantEmail',
      desc: '',
      args: [],
    );
  }

  /// `Budget Clause Number Excution`
  String get budgetClauseNumberExcution {
    return Intl.message(
      'Budget Clause Number Excution',
      name: 'budgetClauseNumberExcution',
      desc: '',
      args: [],
    );
  }

  /// `Contractor Phone Number`
  String get contractorPhoneNumber {
    return Intl.message(
      'Contractor Phone Number',
      name: 'contractorPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Contractor Fax`
  String get contractorFax {
    return Intl.message(
      'Contractor Fax',
      name: 'contractorFax',
      desc: '',
      args: [],
    );
  }

  /// `Components Of The Project`
  String get componentsOfTheProject {
    return Intl.message(
      'Components Of The Project',
      name: 'componentsOfTheProject',
      desc: '',
      args: [],
    );
  }

  /// `Expect Start Date`
  String get expectStartDate {
    return Intl.message(
      'Expect Start Date',
      name: 'expectStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Time Schedule Details`
  String get scheduleDetails {
    return Intl.message(
      'Time Schedule Details',
      name: 'scheduleDetails',
      desc: '',
      args: [],
    );
  }

  /// `Consultancy Service Finish Date`
  String get consultancyServiceFinishDate {
    return Intl.message(
      'Consultancy Service Finish Date',
      name: 'consultancyServiceFinishDate',
      desc: '',
      args: [],
    );
  }

  /// `Actual Percentage of Completion`
  String get actualPercentageOfComplete {
    return Intl.message(
      'Actual Percentage of Completion',
      name: 'actualPercentageOfComplete',
      desc: '',
      args: [],
    );
  }

  /// `Planned Percentage Of Completion `
  String get plannedPercentageOfCompletion {
    return Intl.message(
      'Planned Percentage Of Completion ',
      name: 'plannedPercentageOfCompletion',
      desc: '',
      args: [],
    );
  }

  /// `Extension Period (Day)`
  String get extensionPeriod {
    return Intl.message(
      'Extension Period (Day)',
      name: 'extensionPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Percentage (%)`
  String get exchangePercentage {
    return Intl.message(
      'Exchange Percentage (%)',
      name: 'exchangePercentage',
      desc: '',
      args: [],
    );
  }

  /// `Elapsed Time (Day)`
  String get elapsedTime {
    return Intl.message(
      'Elapsed Time (Day)',
      name: 'elapsedTime',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of Elapsed Time`
  String get percentageOfElapsedTime {
    return Intl.message(
      'Percentage of Elapsed Time',
      name: 'percentageOfElapsedTime',
      desc: '',
      args: [],
    );
  }

  /// `Count of Actual Delay`
  String get countOffActualDelay {
    return Intl.message(
      'Count of Actual Delay',
      name: 'countOffActualDelay',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Duration`
  String get remainingDuration {
    return Intl.message(
      'Remaining Duration',
      name: 'remainingDuration',
      desc: '',
      args: [],
    );
  }

  /// `Financial Details`
  String get financialDetails {
    return Intl.message(
      'Financial Details',
      name: 'financialDetails',
      desc: '',
      args: [],
    );
  }

  /// `Project Works`
  String get projectWorks {
    return Intl.message(
      'Project Works',
      name: 'projectWorks',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get actionTaken {
    return Intl.message(
      'Actions',
      name: 'actionTaken',
      desc: '',
      args: [],
    );
  }

  /// `Completed Work During this Month`
  String get completedWorkDuringThisMonth {
    return Intl.message(
      'Completed Work During this Month',
      name: 'completedWorkDuringThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Delay Reasons`
  String get reasonForTheDelay {
    return Intl.message(
      'Delay Reasons',
      name: 'reasonForTheDelay',
      desc: '',
      args: [],
    );
  }

  /// `Additional Information`
  String get additionalInformation {
    return Intl.message(
      'Additional Information',
      name: 'additionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Financial Provision (Current Year)`
  String get financialProvision {
    return Intl.message(
      'Financial Provision (Current Year)',
      name: 'financialProvision',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Financial Provision (Next Year)`
  String get estimatedFinancialProvision {
    return Intl.message(
      'Estimated Financial Provision (Next Year)',
      name: 'estimatedFinancialProvision',
      desc: '',
      args: [],
    );
  }

  /// `Last Payment Certificate Amount (KD)`
  String get lastPaymentCertificateAmount {
    return Intl.message(
      'Last Payment Certificate Amount (KD)',
      name: 'lastPaymentCertificateAmount',
      desc: '',
      args: [],
    );
  }

  /// `Last Payment Certificate Date`
  String get lastPaymentCertificateDate {
    return Intl.message(
      'Last Payment Certificate Date',
      name: 'lastPaymentCertificateDate',
      desc: '',
      args: [],
    );
  }

  /// `Consultancy ServiceAgreement Value`
  String get consultancyServiceAgreementValue {
    return Intl.message(
      'Consultancy ServiceAgreement Value',
      name: 'consultancyServiceAgreementValue',
      desc: '',
      args: [],
    );
  }

  /// `Total Value of Outgoing Payments (financial department)`
  String get totalValueOfOutgoingPaymentsFinancialDepartment {
    return Intl.message(
      'Total Value of Outgoing Payments (financial department)',
      name: 'totalValueOfOutgoingPaymentsFinancialDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Total Value of Outgoing Payments(sector)`
  String get totalValueOfOutgoingPaymentsSector {
    return Intl.message(
      'Total Value of Outgoing Payments(sector)',
      name: 'totalValueOfOutgoingPaymentsSector',
      desc: '',
      args: [],
    );
  }

  /// `Optional Works Agreement Amount`
  String get optionalWorksAgreementAmount {
    return Intl.message(
      'Optional Works Agreement Amount',
      name: 'optionalWorksAgreementAmount',
      desc: '',
      args: [],
    );
  }

  /// `Supervision Agreement Amount`
  String get supervisionAgreementAmount {
    return Intl.message(
      'Supervision Agreement Amount',
      name: 'supervisionAgreementAmount',
      desc: '',
      args: [],
    );
  }

  /// `Agreement Total Amount`
  String get agreementTotalAmount {
    return Intl.message(
      'Agreement Total Amount',
      name: 'agreementTotalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Variation Orders`
  String get variationOrders {
    return Intl.message(
      'Variation Orders',
      name: 'variationOrders',
      desc: '',
      args: [],
    );
  }

  /// `Latest Payment Certificate Number`
  String get latestPaymentCertificateNumber {
    return Intl.message(
      'Latest Payment Certificate Number',
      name: 'latestPaymentCertificateNumber',
      desc: '',
      args: [],
    );
  }

  /// `Variation Orders Percentage`
  String get variationOrdersPercentage {
    return Intl.message(
      'Variation Orders Percentage',
      name: 'variationOrdersPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Total Contract Amount After Extension`
  String get totalContractAmountAfterExtension {
    return Intl.message(
      'Total Contract Amount After Extension',
      name: 'totalContractAmountAfterExtension',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Dashboards`
  String get dashboards {
    return Intl.message(
      'Dashboards',
      name: 'dashboards',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Final Data Package Dashboard`
  String get finalDataPackage {
    return Intl.message(
      'Final Data Package Dashboard',
      name: 'finalDataPackage',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchPackages {
    return Intl.message(
      'Search',
      name: 'searchPackages',
      desc: '',
      args: [],
    );
  }

  /// `Final Handover Certification`
  String get finalHandoverCertification {
    return Intl.message(
      'Final Handover Certification',
      name: 'finalHandoverCertification',
      desc: '',
      args: [],
    );
  }

  /// `Final Payment`
  String get finalPayment {
    return Intl.message(
      'Final Payment',
      name: 'finalPayment',
      desc: '',
      args: [],
    );
  }

  /// `Initial Handover Certification`
  String get initialHandoverCertification {
    return Intl.message(
      'Initial Handover Certification',
      name: 'initialHandoverCertification',
      desc: '',
      args: [],
    );
  }

  /// `Final Insurance Release`
  String get finalInsuranceRelease {
    return Intl.message(
      'Final Insurance Release',
      name: 'finalInsuranceRelease',
      desc: '',
      args: [],
    );
  }

  /// `Release Reserved Warranty`
  String get releaseReservedWarranty {
    return Intl.message(
      'Release Reserved Warranty',
      name: 'releaseReservedWarranty',
      desc: '',
      args: [],
    );
  }

  /// `FP KPI`
  String get fpKPI {
    return Intl.message(
      'FP KPI',
      name: 'fpKPI',
      desc: '',
      args: [],
    );
  }

  /// `Planning and Budgeting`
  String get planningAndBudgeting {
    return Intl.message(
      'Planning and Budgeting',
      name: 'planningAndBudgeting',
      desc: '',
      args: [],
    );
  }

  /// `Search planning and budgeting`
  String get searchPlanningAndBudgeting {
    return Intl.message(
      'Search planning and budgeting',
      name: 'searchPlanningAndBudgeting',
      desc: '',
      args: [],
    );
  }

  /// `PB KPI`
  String get pbKPI {
    return Intl.message(
      'PB KPI',
      name: 'pbKPI',
      desc: '',
      args: [],
    );
  }

  /// `Execution Contracts`
  String get executionContracts {
    return Intl.message(
      'Execution Contracts',
      name: 'executionContracts',
      desc: '',
      args: [],
    );
  }

  /// `Search execution contracts`
  String get searchExecutionContracts {
    return Intl.message(
      'Search execution contracts',
      name: 'searchExecutionContracts',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Contract Date`
  String get maintenanceContractDate {
    return Intl.message(
      'Maintenance Contract Date',
      name: 'maintenanceContractDate',
      desc: '',
      args: [],
    );
  }

  /// `Delay`
  String get delay {
    return Intl.message(
      'Delay',
      name: 'delay',
      desc: '',
      args: [],
    );
  }

  /// `Elapsed - Exchange`
  String get elapsedExchange {
    return Intl.message(
      'Elapsed - Exchange',
      name: 'elapsedExchange',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get low {
    return Intl.message(
      'Low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get high {
    return Intl.message(
      'High',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `PDF`
  String get download {
    return Intl.message(
      'PDF',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Download All`
  String get downloadAll {
    return Intl.message(
      'Download All',
      name: 'downloadAll',
      desc: '',
      args: [],
    );
  }

  /// `There is no attachments to download`
  String get attachmentsError {
    return Intl.message(
      'There is no attachments to download',
      name: 'attachmentsError',
      desc: '',
      args: [],
    );
  }

  /// `Permission Denied`
  String get permissionDenied {
    return Intl.message(
      'Permission Denied',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Download Success`
  String get downloadSuccess {
    return Intl.message(
      'Download Success',
      name: 'downloadSuccess',
      desc: '',
      args: [],
    );
  }

  /// `KWD`
  String get currency {
    return Intl.message(
      'KWD',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Actual finish date`
  String get actualFinishDateMilestone {
    return Intl.message(
      'Actual finish date',
      name: 'actualFinishDateMilestone',
      desc: '',
      args: [],
    );
  }

  /// `Warranty Start Date`
  String get warrantyStartDate {
    return Intl.message(
      'Warranty Start Date',
      name: 'warrantyStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Warranty Expiry Date`
  String get warrantyExpiryDate {
    return Intl.message(
      'Warranty Expiry Date',
      name: 'warrantyExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Consultant Agreement Number`
  String get consultantAgreementNumber {
    return Intl.message(
      'Consultant Agreement Number',
      name: 'consultantAgreementNumber',
      desc: '',
      args: [],
    );
  }

  /// `Resident Engineer`
  String get residentEngineer {
    return Intl.message(
      'Resident Engineer',
      name: 'residentEngineer',
      desc: '',
      args: [],
    );
  }

  /// `Resident Engineer Phone Number`
  String get residentEngineerPhoneNumber {
    return Intl.message(
      'Resident Engineer Phone Number',
      name: 'residentEngineerPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Resident Engineer Email`
  String get residentEngineerEmail {
    return Intl.message(
      'Resident Engineer Email',
      name: 'residentEngineerEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resident Engineer Fax`
  String get residentEngineerFax {
    return Intl.message(
      'Resident Engineer Fax',
      name: 'residentEngineerFax',
      desc: '',
      args: [],
    );
  }

  /// `Contractual Completion Date`
  String get contractualCompletionDate {
    return Intl.message(
      'Contractual Completion Date',
      name: 'contractualCompletionDate',
      desc: '',
      args: [],
    );
  }

  /// `Contractual`
  String get contractual {
    return Intl.message(
      'Contractual',
      name: 'contractual',
      desc: '',
      args: [],
    );
  }

  /// `Completion Date`
  String get completionDate {
    return Intl.message(
      'Completion Date',
      name: 'completionDate',
      desc: '',
      args: [],
    );
  }

  /// `Completion Date After Extension`
  String get completionDateAfterExtension {
    return Intl.message(
      'Completion Date After Extension',
      name: 'completionDateAfterExtension',
      desc: '',
      args: [],
    );
  }

  /// `After Extension`
  String get afterExtension {
    return Intl.message(
      'After Extension',
      name: 'afterExtension',
      desc: '',
      args: [],
    );
  }

  /// `Consultant Contract Amount`
  String get consultantContractAmount {
    return Intl.message(
      'Consultant Contract Amount',
      name: 'consultantContractAmount',
      desc: '',
      args: [],
    );
  }

  /// `Total Paid Amount`
  String get totalPaidAmount {
    return Intl.message(
      'Total Paid Amount',
      name: 'totalPaidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Completed Services Fees Amount Percentage`
  String get completedServicesFeesAmountPercentage {
    return Intl.message(
      'Completed Services Fees Amount Percentage',
      name: 'completedServicesFeesAmountPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Completed Services Fees Amount`
  String get completedServicesFeesAmount {
    return Intl.message(
      'Completed Services Fees Amount',
      name: 'completedServicesFeesAmount',
      desc: '',
      args: [],
    );
  }

  /// `Last Payment Net Amount`
  String get lastPaymentNetAmount {
    return Intl.message(
      'Last Payment Net Amount',
      name: 'lastPaymentNetAmount',
      desc: '',
      args: [],
    );
  }

  /// `Last Payment Net Amount Date`
  String get lastPaymentNetAmountDate {
    return Intl.message(
      'Last Payment Net Amount Date',
      name: 'lastPaymentNetAmountDate',
      desc: '',
      args: [],
    );
  }

  /// `Total Paid Percentage`
  String get totalPaidPercentage {
    return Intl.message(
      'Total Paid Percentage',
      name: 'totalPaidPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Value of the Agreement After Variation and Extension Orders`
  String get valueOfTheAgreementAfterVariationAndExtensionOrders {
    return Intl.message(
      'Value of the Agreement After Variation and Extension Orders',
      name: 'valueOfTheAgreementAfterVariationAndExtensionOrders',
      desc: '',
      args: [],
    );
  }

  /// `Summary for Consultant Work`
  String get summaryForConsultantWork {
    return Intl.message(
      'Summary for Consultant Work',
      name: 'summaryForConsultantWork',
      desc: '',
      args: [],
    );
  }

  /// `Payment Date`
  String get paymentDate {
    return Intl.message(
      'Payment Date',
      name: 'paymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Contractor`
  String get agreementContractor {
    return Intl.message(
      'Contractor',
      name: 'agreementContractor',
      desc: '',
      args: [],
    );
  }

  /// `Total Duration`
  String get agreementTotalDuration {
    return Intl.message(
      'Total Duration',
      name: 'agreementTotalDuration',
      desc: '',
      args: [],
    );
  }

  /// `Attachments`
  String get attachments {
    return Intl.message(
      'Attachments',
      name: 'attachments',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Warranty Description`
  String get warrantyDescription {
    return Intl.message(
      'Warranty Description',
      name: 'warrantyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Attached Payment`
  String get attachedPayment {
    return Intl.message(
      'Attached Payment',
      name: 'attachedPayment',
      desc: '',
      args: [],
    );
  }

  /// `Variation Order Justification`
  String get variationOrderJustification {
    return Intl.message(
      'Variation Order Justification',
      name: 'variationOrderJustification',
      desc: '',
      args: [],
    );
  }

  /// `User who Asked for Variation Order`
  String get userWhoAskedForVariationOrder {
    return Intl.message(
      'User who Asked for Variation Order',
      name: 'userWhoAskedForVariationOrder',
      desc: '',
      args: [],
    );
  }

  /// `Project Engineer`
  String get projectEng {
    return Intl.message(
      'Project Engineer',
      name: 'projectEng',
      desc: '',
      args: [],
    );
  }

  /// `Penalties Date`
  String get penaltiesDate {
    return Intl.message(
      'Penalties Date',
      name: 'penaltiesDate',
      desc: '',
      args: [],
    );
  }

  /// `Penalties Amount`
  String get penaltiesAmount {
    return Intl.message(
      'Penalties Amount',
      name: 'penaltiesAmount',
      desc: '',
      args: [],
    );
  }

  /// `Penalties Description`
  String get penaltiesDescription {
    return Intl.message(
      'Penalties Description',
      name: 'penaltiesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Number of Projects`
  String get numberOfProjects {
    return Intl.message(
      'Number of Projects',
      name: 'numberOfProjects',
      desc: '',
      args: [],
    );
  }

  /// `Contracts Amount`
  String get contractsAmount {
    return Intl.message(
      'Contracts Amount',
      name: 'contractsAmount',
      desc: '',
      args: [],
    );
  }

  /// `Total Payments Per Fiscal Year`
  String get totalPaymentsPerFiscalYear {
    return Intl.message(
      'Total Payments Per Fiscal Year',
      name: 'totalPaymentsPerFiscalYear',
      desc: '',
      args: [],
    );
  }

  /// `Number of Projects by Sector`
  String get numberOfProjectsBySector {
    return Intl.message(
      'Number of Projects by Sector',
      name: 'numberOfProjectsBySector',
      desc: '',
      args: [],
    );
  }

  /// `Number of Projects by Phase`
  String get numberOfProjectsByPhase {
    return Intl.message(
      'Number of Projects by Phase',
      name: 'numberOfProjectsByPhase',
      desc: '',
      args: [],
    );
  }

  /// `Work in Progress`
  String get workInProgress {
    return Intl.message(
      'Work in Progress',
      name: 'workInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Analysis Module`
  String get analysisModule {
    return Intl.message(
      'Analysis Module',
      name: 'analysisModule',
      desc: '',
      args: [],
    );
  }

  /// `Overview Dashboard`
  String get overviewDashboard {
    return Intl.message(
      'Overview Dashboard',
      name: 'overviewDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Risk Dashboard`
  String get riskDashboard {
    return Intl.message(
      'Risk Dashboard',
      name: 'riskDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Risk Analysis Per Sector`
  String get riskAnalysisPerSector {
    return Intl.message(
      'Risk Analysis Per Sector',
      name: 'riskAnalysisPerSector',
      desc: '',
      args: [],
    );
  }

  /// `Risk Analysis Per Phase`
  String get riskAnalysisPerPhase {
    return Intl.message(
      'Risk Analysis Per Phase',
      name: 'riskAnalysisPerPhase',
      desc: '',
      args: [],
    );
  }

  /// `Low Severity`
  String get lowSeverity {
    return Intl.message(
      'Low Severity',
      name: 'lowSeverity',
      desc: '',
      args: [],
    );
  }

  /// `Medium Severity`
  String get mediumSeverity {
    return Intl.message(
      'Medium Severity',
      name: 'mediumSeverity',
      desc: '',
      args: [],
    );
  }

  /// `High Severity`
  String get highSeverity {
    return Intl.message(
      'High Severity',
      name: 'highSeverity',
      desc: '',
      args: [],
    );
  }

  /// `Actives Risk`
  String get activesRisk {
    return Intl.message(
      'Actives Risk',
      name: 'activesRisk',
      desc: '',
      args: [],
    );
  }

  /// `High Risk`
  String get highRisk {
    return Intl.message(
      'High Risk',
      name: 'highRisk',
      desc: '',
      args: [],
    );
  }

  /// `Issue Dashboard`
  String get issueDashboard {
    return Intl.message(
      'Issue Dashboard',
      name: 'issueDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Issues Analysis Per Sector`
  String get issuesAnalysisPerSector {
    return Intl.message(
      'Issues Analysis Per Sector',
      name: 'issuesAnalysisPerSector',
      desc: '',
      args: [],
    );
  }

  /// `Issues Analysis Per Phase`
  String get issuesAnalysisPerPhase {
    return Intl.message(
      'Issues Analysis Per Phase',
      name: 'issuesAnalysisPerPhase',
      desc: '',
      args: [],
    );
  }

  /// `Active Issues`
  String get activesIssues {
    return Intl.message(
      'Active Issues',
      name: 'activesIssues',
      desc: '',
      args: [],
    );
  }

  /// `High Issues`
  String get highIssues {
    return Intl.message(
      'High Issues',
      name: 'highIssues',
      desc: '',
      args: [],
    );
  }

  /// `Low Priority`
  String get lowPriority {
    return Intl.message(
      'Low Priority',
      name: 'lowPriority',
      desc: '',
      args: [],
    );
  }

  /// `Medium Priority`
  String get mediumPriority {
    return Intl.message(
      'Medium Priority',
      name: 'mediumPriority',
      desc: '',
      args: [],
    );
  }

  /// `High Priority`
  String get highPriority {
    return Intl.message(
      'High Priority',
      name: 'highPriority',
      desc: '',
      args: [],
    );
  }

  /// `Penalties Dashboard`
  String get penaltiesDashboard {
    return Intl.message(
      'Penalties Dashboard',
      name: 'penaltiesDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Penalties Analysis for Design`
  String get penaltiesAnalysisForDesign {
    return Intl.message(
      'Penalties Analysis for Design',
      name: 'penaltiesAnalysisForDesign',
      desc: '',
      args: [],
    );
  }

  /// `Penalties Analysis for Execution`
  String get penaltiesAnalysisForExecution {
    return Intl.message(
      'Penalties Analysis for Execution',
      name: 'penaltiesAnalysisForExecution',
      desc: '',
      args: [],
    );
  }

  /// `No Penalties`
  String get noPenalties {
    return Intl.message(
      'No Penalties',
      name: 'noPenalties',
      desc: '',
      args: [],
    );
  }

  /// `Total Penalties < 10%`
  String get totalPenaltiesLessThanTen {
    return Intl.message(
      'Total Penalties < 10%',
      name: 'totalPenaltiesLessThanTen',
      desc: '',
      args: [],
    );
  }

  /// `Total Penalties >= 10%`
  String get totalPenaltiesGreaterOrEqualTen {
    return Intl.message(
      'Total Penalties >= 10%',
      name: 'totalPenaltiesGreaterOrEqualTen',
      desc: '',
      args: [],
    );
  }

  /// `Total Penalties < 20`
  String get totalPenaltiesLessThanTwenty {
    return Intl.message(
      'Total Penalties < 20',
      name: 'totalPenaltiesLessThanTwenty',
      desc: '',
      args: [],
    );
  }

  /// `Total Penalties >= 20%`
  String get totalPenaltiesGreaterOrEqualTwenty {
    return Intl.message(
      'Total Penalties >= 20%',
      name: 'totalPenaltiesGreaterOrEqualTwenty',
      desc: '',
      args: [],
    );
  }

  /// `Total Penalties`
  String get totalPenalties {
    return Intl.message(
      'Total Penalties',
      name: 'totalPenalties',
      desc: '',
      args: [],
    );
  }

  /// `Indicator`
  String get indicator {
    return Intl.message(
      'Indicator',
      name: 'indicator',
      desc: '',
      args: [],
    );
  }

  /// `Design Process Dashboard`
  String get designProcessDashboard {
    return Intl.message(
      'Design Process Dashboard',
      name: 'designProcessDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Ministry Evaluation Analysis`
  String get ministryEvaluationAnalysis {
    return Intl.message(
      'Ministry Evaluation Analysis',
      name: 'ministryEvaluationAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Design Process Analysis`
  String get designProcessAnalysis {
    return Intl.message(
      'Design Process Analysis',
      name: 'designProcessAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Total Delay <= 120%`
  String get totalDelayLessEqualThan {
    return Intl.message(
      'Total Delay <= 120%',
      name: 'totalDelayLessEqualThan',
      desc: '',
      args: [],
    );
  }

  /// `Total Delay > 120%`
  String get totalDelayMoreThan {
    return Intl.message(
      'Total Delay > 120%',
      name: 'totalDelayMoreThan',
      desc: '',
      args: [],
    );
  }

  /// `Planning Planned`
  String get planningPlanned {
    return Intl.message(
      'Planning Planned',
      name: 'planningPlanned',
      desc: '',
      args: [],
    );
  }

  /// `Planning Actual`
  String get planningActual {
    return Intl.message(
      'Planning Actual',
      name: 'planningActual',
      desc: '',
      args: [],
    );
  }

  /// `Design Tendering Planned`
  String get designTenderingPlanned {
    return Intl.message(
      'Design Tendering Planned',
      name: 'designTenderingPlanned',
      desc: '',
      args: [],
    );
  }

  /// `Design Tendering Actual`
  String get designTenderingActual {
    return Intl.message(
      'Design Tendering Actual',
      name: 'designTenderingActual',
      desc: '',
      args: [],
    );
  }

  /// `Data Collecting planned`
  String get dataCollectingPlanned {
    return Intl.message(
      'Data Collecting planned',
      name: 'dataCollectingPlanned',
      desc: '',
      args: [],
    );
  }

  /// `Data Collecting Actual`
  String get dataCollectingActual {
    return Intl.message(
      'Data Collecting Actual',
      name: 'dataCollectingActual',
      desc: '',
      args: [],
    );
  }

  /// `Concept Design Planned`
  String get conceptDesignPlanned {
    return Intl.message(
      'Concept Design Planned',
      name: 'conceptDesignPlanned',
      desc: '',
      args: [],
    );
  }

  /// `Concept Design Actual`
  String get conceptDesignActual {
    return Intl.message(
      'Concept Design Actual',
      name: 'conceptDesignActual',
      desc: '',
      args: [],
    );
  }

  /// `Design Development Planned`
  String get designDevelopmentPlanned {
    return Intl.message(
      'Design Development Planned',
      name: 'designDevelopmentPlanned',
      desc: '',
      args: [],
    );
  }

  /// `Design Development Actual`
  String get designDevelopmentActual {
    return Intl.message(
      'Design Development Actual',
      name: 'designDevelopmentActual',
      desc: '',
      args: [],
    );
  }

  /// `Preliminary Design Planned`
  String get preliminaryDesignPlanned {
    return Intl.message(
      'Preliminary Design Planned',
      name: 'preliminaryDesignPlanned',
      desc: '',
      args: [],
    );
  }

  /// `Preliminary Design Actual`
  String get preliminaryDesignActual {
    return Intl.message(
      'Preliminary Design Actual',
      name: 'preliminaryDesignActual',
      desc: '',
      args: [],
    );
  }

  /// `Final Design Planned`
  String get finalDesignPlanned {
    return Intl.message(
      'Final Design Planned',
      name: 'finalDesignPlanned',
      desc: '',
      args: [],
    );
  }

  /// `Final Design Actual`
  String get finalDesignActual {
    return Intl.message(
      'Final Design Actual',
      name: 'finalDesignActual',
      desc: '',
      args: [],
    );
  }

  /// `Construction Tender Planned`
  String get constructionTenderPlanned {
    return Intl.message(
      'Construction Tender Planned',
      name: 'constructionTenderPlanned',
      desc: '',
      args: [],
    );
  }

  /// `Construction Tender Actual`
  String get constructionTenderActual {
    return Intl.message(
      'Construction Tender Actual',
      name: 'constructionTenderActual',
      desc: '',
      args: [],
    );
  }

  /// `Design KPI`
  String get designKPI {
    return Intl.message(
      'Design KPI',
      name: 'designKPI',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of completion in the execution contracts`
  String get completionInTheExecutionContracts {
    return Intl.message(
      'Percentage of completion in the execution contracts',
      name: 'completionInTheExecutionContracts',
      desc: '',
      args: [],
    );
  }

  /// `Projects Completion Analysis`
  String get projectsCompletionAnalysis {
    return Intl.message(
      'Projects Completion Analysis',
      name: 'projectsCompletionAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Schedule Approved Analysis`
  String get scheduleApprovedAnalysis {
    return Intl.message(
      'Schedule Approved Analysis',
      name: 'scheduleApprovedAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Variance Percentage`
  String get variancePercentage {
    return Intl.message(
      'Variance Percentage',
      name: 'variancePercentage',
      desc: '',
      args: [],
    );
  }

  /// `Delay <= 3%`
  String get greenDelay {
    return Intl.message(
      'Delay <= 3%',
      name: 'greenDelay',
      desc: '',
      args: [],
    );
  }

  /// `3% < Delay <= 20%`
  String get orangeDelay {
    return Intl.message(
      '3% < Delay <= 20%',
      name: 'orangeDelay',
      desc: '',
      args: [],
    );
  }

  /// `Delay > 20%`
  String get redDelay {
    return Intl.message(
      'Delay > 20%',
      name: 'redDelay',
      desc: '',
      args: [],
    );
  }

  /// `Elapsed - Exchange <= 15%`
  String get greenElapsedExchange {
    return Intl.message(
      'Elapsed - Exchange <= 15%',
      name: 'greenElapsedExchange',
      desc: '',
      args: [],
    );
  }

  /// `15% < Elapsed - Exchange <= 30%`
  String get orangeElapsedExchange {
    return Intl.message(
      '15% < Elapsed - Exchange <= 30%',
      name: 'orangeElapsedExchange',
      desc: '',
      args: [],
    );
  }

  /// `Elapsed - Exchange > 30%`
  String get redElapsedExchange {
    return Intl.message(
      'Elapsed - Exchange > 30%',
      name: 'redElapsedExchange',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `Unapproved`
  String get unApproved {
    return Intl.message(
      'Unapproved',
      name: 'unApproved',
      desc: '',
      args: [],
    );
  }

  /// `Schedule Approval`
  String get scheduleApproval {
    return Intl.message(
      'Schedule Approval',
      name: 'scheduleApproval',
      desc: '',
      args: [],
    );
  }

  /// `Operation and Maintenance Contract`
  String get operationAndMaintenanceContract {
    return Intl.message(
      'Operation and Maintenance Contract',
      name: 'operationAndMaintenanceContract',
      desc: '',
      args: [],
    );
  }

  /// `Variance Percentage (Elapsed – Exchange)`
  String get variancePercentageElapsedExchange {
    return Intl.message(
      'Variance Percentage (Elapsed – Exchange)',
      name: 'variancePercentageElapsedExchange',
      desc: '',
      args: [],
    );
  }

  /// `Variation Order Analysis`
  String get variationOrderAnalysis {
    return Intl.message(
      'Variation Order Analysis',
      name: 'variationOrderAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Total VO <= 5%`
  String get variationOrderGreen {
    return Intl.message(
      'Total VO <= 5%',
      name: 'variationOrderGreen',
      desc: '',
      args: [],
    );
  }

  /// ` 5% < Total VO < 10%`
  String get variationOrderOrange {
    return Intl.message(
      ' 5% < Total VO < 10%',
      name: 'variationOrderOrange',
      desc: '',
      args: [],
    );
  }

  /// `Total VO >= 10%`
  String get variationOrderRed {
    return Intl.message(
      'Total VO >= 10%',
      name: 'variationOrderRed',
      desc: '',
      args: [],
    );
  }

  /// `Total VO`
  String get TotalVO {
    return Intl.message(
      'Total VO',
      name: 'TotalVO',
      desc: '',
      args: [],
    );
  }

  /// `Variation Order KPI`
  String get variationOrderKPI {
    return Intl.message(
      'Variation Order KPI',
      name: 'variationOrderKPI',
      desc: '',
      args: [],
    );
  }

  /// `Payments Dashboard`
  String get paymentsDashboard {
    return Intl.message(
      'Payments Dashboard',
      name: 'paymentsDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Payment Analysis`
  String get paymentAnalysis {
    return Intl.message(
      'Payment Analysis',
      name: 'paymentAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Variance <= 30 day`
  String get paymentVariantGreen {
    return Intl.message(
      'Variance <= 30 day',
      name: 'paymentVariantGreen',
      desc: '',
      args: [],
    );
  }

  /// `Variance > 30 day`
  String get paymentVariantRed {
    return Intl.message(
      'Variance > 30 day',
      name: 'paymentVariantRed',
      desc: '',
      args: [],
    );
  }

  /// `Payment Variance`
  String get paymentVariance {
    return Intl.message(
      'Payment Variance',
      name: 'paymentVariance',
      desc: '',
      args: [],
    );
  }

  /// `Final Data Package Analysis`
  String get finalDataPackageAnalysis {
    return Intl.message(
      'Final Data Package Analysis',
      name: 'finalDataPackageAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Total NO <= 40%`
  String get totalNOGreen {
    return Intl.message(
      'Total NO <= 40%',
      name: 'totalNOGreen',
      desc: '',
      args: [],
    );
  }

  /// `60% > Total NO > 40%`
  String get totalNOOrange {
    return Intl.message(
      '60% > Total NO > 40%',
      name: 'totalNOOrange',
      desc: '',
      args: [],
    );
  }

  /// `Total NO >= 60%`
  String get totalNORed {
    return Intl.message(
      'Total NO >= 60%',
      name: 'totalNORed',
      desc: '',
      args: [],
    );
  }

  /// `Project Name`
  String get projectName {
    return Intl.message(
      'Project Name',
      name: 'projectName',
      desc: '',
      args: [],
    );
  }

  /// `Contractual Completion Date and Completion Date After Extension`
  String get contractualCompletionDateAndCompletionDateAfterExtension {
    return Intl.message(
      'Contractual Completion Date and Completion Date After Extension',
      name: 'contractualCompletionDateAndCompletionDateAfterExtension',
      desc: '',
      args: [],
    );
  }

  /// `Execution Contract Number`
  String get executionContractNumber {
    return Intl.message(
      'Execution Contract Number',
      name: 'executionContractNumber',
      desc: '',
      args: [],
    );
  }

  /// `Supervision Service Contract Number`
  String get supervisionServiceContractNumber {
    return Intl.message(
      'Supervision Service Contract Number',
      name: 'supervisionServiceContractNumber',
      desc: '',
      args: [],
    );
  }

  /// `Direct Supervision`
  String get directSupervision {
    return Intl.message(
      'Direct Supervision',
      name: 'directSupervision',
      desc: '',
      args: [],
    );
  }

  /// `Is it an operation and maintenance contract?`
  String get isItanoperationandmaintenancecontract {
    return Intl.message(
      'Is it an operation and maintenance contract?',
      name: 'isItanoperationandmaintenancecontract',
      desc: '',
      args: [],
    );
  }

  /// `Design Contract Sign Date`
  String get designContractSignDate {
    return Intl.message(
      'Design Contract Sign Date',
      name: 'designContractSignDate',
      desc: '',
      args: [],
    );
  }

  /// `Design Commence Date`
  String get designCommenceDate {
    return Intl.message(
      'Design Commence Date',
      name: 'designCommenceDate',
      desc: '',
      args: [],
    );
  }

  /// `Design Duration (Month)`
  String get designDurationMonth {
    return Intl.message(
      'Design Duration (Month)',
      name: 'designDurationMonth',
      desc: '',
      args: [],
    );
  }

  /// `Design Duration (Day)`
  String get designDurationDay {
    return Intl.message(
      'Design Duration (Day)',
      name: 'designDurationDay',
      desc: '',
      args: [],
    );
  }

  /// `Design Completion Date`
  String get designCompletionDate {
    return Intl.message(
      'Design Completion Date',
      name: 'designCompletionDate',
      desc: '',
      args: [],
    );
  }

  /// `Execution Expected Tendering Date`
  String get executionExpectedTenderingDate {
    return Intl.message(
      'Execution Expected Tendering Date',
      name: 'executionExpectedTenderingDate',
      desc: '',
      args: [],
    );
  }

  /// `Execution Expected Start Date`
  String get executionExpectedStartDate {
    return Intl.message(
      'Execution Expected Start Date',
      name: 'executionExpectedStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Execution Expected Completion Date`
  String get executionExpectedCompletionDate {
    return Intl.message(
      'Execution Expected Completion Date',
      name: 'executionExpectedCompletionDate',
      desc: '',
      args: [],
    );
  }

  /// `Closeout Date`
  String get closeoutDate {
    return Intl.message(
      'Closeout Date',
      name: 'closeoutDate',
      desc: '',
      args: [],
    );
  }

  /// `Execution Duration (Month)`
  String get executionDurationMonth {
    return Intl.message(
      'Execution Duration (Month)',
      name: 'executionDurationMonth',
      desc: '',
      args: [],
    );
  }

  /// `Execution Duration (Day)`
  String get executionDurationDay {
    return Intl.message(
      'Execution Duration (Day)',
      name: 'executionDurationDay',
      desc: '',
      args: [],
    );
  }

  /// `Commence Date`
  String get commenceDate {
    return Intl.message(
      'Commence Date',
      name: 'commenceDate',
      desc: '',
      args: [],
    );
  }

  /// `Project Number (Financial)`
  String get projectNumberFinancial {
    return Intl.message(
      'Project Number (Financial)',
      name: 'projectNumberFinancial',
      desc: '',
      args: [],
    );
  }

  /// `Contract Amount (KD)`
  String get contractAmountKD {
    return Intl.message(
      'Contract Amount (KD)',
      name: 'contractAmountKD',
      desc: '',
      args: [],
    );
  }

  /// `Optional Works Amount (KD)`
  String get optionalWorksAmountKD {
    return Intl.message(
      'Optional Works Amount (KD)',
      name: 'optionalWorksAmountKD',
      desc: '',
      args: [],
    );
  }

  /// `Project Estimated value (KD)`
  String get projectEstimatedValueKD {
    return Intl.message(
      'Project Estimated value (KD)',
      name: 'projectEstimatedValueKD',
      desc: '',
      args: [],
    );
  }

  /// `Total Reserve Items Amount`
  String get totalReserveItemsAmount {
    return Intl.message(
      'Total Reserve Items Amount',
      name: 'totalReserveItemsAmount',
      desc: '',
      args: [],
    );
  }

  /// `Total Optional Items Amount`
  String get totalOptionalItemsAmount {
    return Intl.message(
      'Total Optional Items Amount',
      name: 'totalOptionalItemsAmount',
      desc: '',
      args: [],
    );
  }

  /// `Deputy Project Engineer`
  String get deputyProjectEngineer {
    return Intl.message(
      'Deputy Project Engineer',
      name: 'deputyProjectEngineer',
      desc: '',
      args: [],
    );
  }

  /// `Deputy Project Engineer Phone Number`
  String get deputyProjectEngineerPhoneNumber {
    return Intl.message(
      'Deputy Project Engineer Phone Number',
      name: 'deputyProjectEngineerPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Deputy Project Engineer Email`
  String get deputyProjectEngineerEmail {
    return Intl.message(
      'Deputy Project Engineer Email',
      name: 'deputyProjectEngineerEmail',
      desc: '',
      args: [],
    );
  }

  /// `Design Finish Date After Extension`
  String get designCompletionDateAfterExtension {
    return Intl.message(
      'Design Finish Date After Extension',
      name: 'designCompletionDateAfterExtension',
      desc: '',
      args: [],
    );
  }

  /// `Contract Duration (Day)`
  String get contractDurationDay {
    return Intl.message(
      'Contract Duration (Day)',
      name: 'contractDurationDay',
      desc: '',
      args: [],
    );
  }

  /// `Actual delay (Day)`
  String get actualDelayDay {
    return Intl.message(
      'Actual delay (Day)',
      name: 'actualDelayDay',
      desc: '',
      args: [],
    );
  }

  /// `Design Finish Date with Extension`
  String get designFinishDateWithExtension {
    return Intl.message(
      'Design Finish Date with Extension',
      name: 'designFinishDateWithExtension',
      desc: '',
      args: [],
    );
  }

  /// `Expected Completion Date (Update)`
  String get expectedCompletionDateUpdate {
    return Intl.message(
      'Expected Completion Date (Update)',
      name: 'expectedCompletionDateUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Delay (Day)`
  String get delayDay {
    return Intl.message(
      'Delay (Day)',
      name: 'delayDay',
      desc: '',
      args: [],
    );
  }

  /// `Delay Percentage (%)`
  String get delayPercentage {
    return Intl.message(
      'Delay Percentage (%)',
      name: 'delayPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Duration (Day)`
  String get remainingDurationDay {
    return Intl.message(
      'Remaining Duration (Day)',
      name: 'remainingDurationDay',
      desc: '',
      args: [],
    );
  }

  /// `Early Planned Percentage of Completion`
  String get earlyPlannedPercentageOfCompletion {
    return Intl.message(
      'Early Planned Percentage of Completion',
      name: 'earlyPlannedPercentageOfCompletion',
      desc: '',
      args: [],
    );
  }

  /// `Late Planned Percentage of Completion`
  String get latePlannedPercentageofCompletion {
    return Intl.message(
      'Late Planned Percentage of Completion',
      name: 'latePlannedPercentageofCompletion',
      desc: '',
      args: [],
    );
  }

  /// `Project Estimated Value`
  String get projectEstimatedValue {
    return Intl.message(
      'Project Estimated Value',
      name: 'projectEstimatedValue',
      desc: '',
      args: [],
    );
  }

  /// `Design Value (KD)`
  String get designValueKD {
    return Intl.message(
      'Design Value (KD)',
      name: 'designValueKD',
      desc: '',
      args: [],
    );
  }

  /// `Optional Works Value (KD)`
  String get optionalWorksValueKD {
    return Intl.message(
      'Optional Works Value (KD)',
      name: 'optionalWorksValueKD',
      desc: '',
      args: [],
    );
  }

  /// `Supervision Services Value (KD)`
  String get supervisionServicesValueKD {
    return Intl.message(
      'Supervision Services Value (KD)',
      name: 'supervisionServicesValueKD',
      desc: '',
      args: [],
    );
  }

  /// `Contract Total Amount (KD)`
  String get contractTotalAmountKD {
    return Intl.message(
      'Contract Total Amount (KD)',
      name: 'contractTotalAmountKD',
      desc: '',
      args: [],
    );
  }

  /// `Total Value of Outgoing Payments (KD)`
  String get totalValueOfOutgoingPaymentsKD {
    return Intl.message(
      'Total Value of Outgoing Payments (KD)',
      name: 'totalValueOfOutgoingPaymentsKD',
      desc: '',
      args: [],
    );
  }

  /// `Variation Orders (KD)`
  String get variationOrdersKD {
    return Intl.message(
      'Variation Orders (KD)',
      name: 'variationOrdersKD',
      desc: '',
      args: [],
    );
  }

  /// `The value of the execution contract without protection works (KD)`
  String get theValueOfTheExecutionContractWithoutProtectionWorksKD {
    return Intl.message(
      'The value of the execution contract without protection works (KD)',
      name: 'theValueOfTheExecutionContractWithoutProtectionWorksKD',
      desc: '',
      args: [],
    );
  }

  /// `Inactive Provisional Sum (KD)`
  String get inactiveProvisionalSumKD {
    return Intl.message(
      'Inactive Provisional Sum (KD)',
      name: 'inactiveProvisionalSumKD',
      desc: '',
      args: [],
    );
  }

  /// `Inactive Provisional Sum Percentage`
  String get inactiveProvisionalSumPercentage {
    return Intl.message(
      'Inactive Provisional Sum Percentage',
      name: 'inactiveProvisionalSumPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Active Provisional Sum (KD)`
  String get activeProvisionalSumKD {
    return Intl.message(
      'Active Provisional Sum (KD)',
      name: 'activeProvisionalSumKD',
      desc: '',
      args: [],
    );
  }

  /// `Active Provisional Sum Percentage`
  String get activeProvisionalSumPercentage {
    return Intl.message(
      'Active Provisional Sum Percentage',
      name: 'activeProvisionalSumPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Remeasure Items Amount (KD)`
  String get remeasureItemsAmountKD {
    return Intl.message(
      'Remeasure Items Amount (KD)',
      name: 'remeasureItemsAmountKD',
      desc: '',
      args: [],
    );
  }

  /// `Remeasure Items Percentage `
  String get remeasureItemsPercentage {
    return Intl.message(
      'Remeasure Items Percentage ',
      name: 'remeasureItemsPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Payment Certificate Number `
  String get paymentCertificateNumber {
    return Intl.message(
      'Payment Certificate Number ',
      name: 'paymentCertificateNumber',
      desc: '',
      args: [],
    );
  }

  /// `Payment Certificate`
  String get paymentCertificate {
    return Intl.message(
      'Payment Certificate',
      name: 'paymentCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Completed Work Amount (KD)  `
  String get completedWorkAmountKD {
    return Intl.message(
      'Completed Work Amount (KD)  ',
      name: 'completedWorkAmountKD',
      desc: '',
      args: [],
    );
  }

  /// `Completed Work Amount Date  `
  String get completedWorkAmountDate {
    return Intl.message(
      'Completed Work Amount Date  ',
      name: 'completedWorkAmountDate',
      desc: '',
      args: [],
    );
  }

  /// `Completed Work and Stored Materials (KD)`
  String get completedWorkAndStoredMaterialsKD {
    return Intl.message(
      'Completed Work and Stored Materials (KD)',
      name: 'completedWorkAndStoredMaterialsKD',
      desc: '',
      args: [],
    );
  }

  /// `Completed Work and Stored Materials Percentage`
  String get completedWorkAndStoredMaterialsPercentage {
    return Intl.message(
      'Completed Work and Stored Materials Percentage',
      name: 'completedWorkAndStoredMaterialsPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Last Payment Net Amount (KD)`
  String get lastPaymentNetAmountKD {
    return Intl.message(
      'Last Payment Net Amount (KD)',
      name: 'lastPaymentNetAmountKD',
      desc: '',
      args: [],
    );
  }

  /// `Total Paid (KD)`
  String get totalPaidKD {
    return Intl.message(
      'Total Paid (KD)',
      name: 'totalPaidKD',
      desc: '',
      args: [],
    );
  }

  /// `Total Paid With Advanced Payment (KD)`
  String get totalPaidWithAdvancedPaymentKD {
    return Intl.message(
      'Total Paid With Advanced Payment (KD)',
      name: 'totalPaidWithAdvancedPaymentKD',
      desc: '',
      args: [],
    );
  }

  /// `Actual Cost (KD)`
  String get actualCostKD {
    return Intl.message(
      'Actual Cost (KD)',
      name: 'actualCostKD',
      desc: '',
      args: [],
    );
  }

  /// `Contractual Finish Date`
  String get contractualFinishDate {
    return Intl.message(
      'Contractual Finish Date',
      name: 'contractualFinishDate',
      desc: '',
      args: [],
    );
  }

  /// `Finish Date After Extension`
  String get finishDateAfterExtension {
    return Intl.message(
      'Finish Date After Extension',
      name: 'finishDateAfterExtension',
      desc: '',
      args: [],
    );
  }

  /// `Supervision Contract Amount`
  String get supervisionContractAmount {
    return Intl.message(
      'Supervision Contract Amount',
      name: 'supervisionContractAmount',
      desc: '',
      args: [],
    );
  }

  /// `Payment Number`
  String get paymentNumber {
    return Intl.message(
      'Payment Number',
      name: 'paymentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Completed Services Amount`
  String get completedServicesAmount {
    return Intl.message(
      'Completed Services Amount',
      name: 'completedServicesAmount',
      desc: '',
      args: [],
    );
  }

  /// `Completed Services percentage`
  String get completedServicesPercentage {
    return Intl.message(
      'Completed Services percentage',
      name: 'completedServicesPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Total Payment Net Amount (KD)`
  String get totalPaymentNetAmountKD {
    return Intl.message(
      'Total Payment Net Amount (KD)',
      name: 'totalPaymentNetAmountKD',
      desc: '',
      args: [],
    );
  }

  /// `Total Paid Amount (KD)`
  String get totalPaidAmountKD {
    return Intl.message(
      'Total Paid Amount (KD)',
      name: 'totalPaidAmountKD',
      desc: '',
      args: [],
    );
  }

  /// `Contract Value After Variation order and Extension Orders`
  String get contractValueAfterVariationOrderAndExtensionOrders {
    return Intl.message(
      'Contract Value After Variation order and Extension Orders',
      name: 'contractValueAfterVariationOrderAndExtensionOrders',
      desc: '',
      args: [],
    );
  }

  /// `Forms`
  String get forms {
    return Intl.message(
      'Forms',
      name: 'forms',
      desc: '',
      args: [],
    );
  }

  /// `Actual Payment Date`
  String get actualPaymentDateTitle {
    return Intl.message(
      'Actual Payment Date',
      name: 'actualPaymentDateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Final Data Package`
  String get finalDataPackageTitle {
    return Intl.message(
      'Final Data Package',
      name: 'finalDataPackageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of Completion in The Execution Contracts `
  String get completionInTheExecutionContractsTitle {
    return Intl.message(
      'Percentage of Completion in The Execution Contracts ',
      name: 'completionInTheExecutionContractsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Design Process`
  String get designProcess {
    return Intl.message(
      'Design Process',
      name: 'designProcess',
      desc: '',
      args: [],
    );
  }

  /// `Variation Orders`
  String get variationOrdersTitle {
    return Intl.message(
      'Variation Orders',
      name: 'variationOrdersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mega`
  String get mega {
    return Intl.message(
      'Mega',
      name: 'mega',
      desc: '',
      args: [],
    );
  }

  /// `Sanitary`
  String get sanitary {
    return Intl.message(
      'Sanitary',
      name: 'sanitary',
      desc: '',
      args: [],
    );
  }

  /// `Construction`
  String get construction {
    return Intl.message(
      'Construction',
      name: 'construction',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get form {
    return Intl.message(
      'Form',
      name: 'form',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get issueDescription {
    return Intl.message(
      'Description',
      name: 'issueDescription',
      desc: '',
      args: [],
    );
  }

  /// `Actual`
  String get actual {
    return Intl.message(
      'Actual',
      name: 'actual',
      desc: '',
      args: [],
    );
  }

  /// `Estimated`
  String get estimated {
    return Intl.message(
      'Estimated',
      name: 'estimated',
      desc: '',
      args: [],
    );
  }

  /// `Approved Payment Date`
  String get approvedPaymentDate {
    return Intl.message(
      'Approved Payment Date',
      name: 'approvedPaymentDate',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
