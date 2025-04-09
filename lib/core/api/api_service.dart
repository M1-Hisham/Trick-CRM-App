import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_request_body.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_response.dart';
import 'package:trick_crm_app/features/brokers/create-broker/data/model/create_broker_request_body.dart';
import 'package:trick_crm_app/features/brokers/create-broker/data/model/create_brokers_model.dart';
import 'package:trick_crm_app/features/brokers/data/model/brokers_model.dart';
import 'package:trick_crm_app/features/calls/call-view/call-view/data/model/call_view_model.dart';
import 'package:trick_crm_app/features/campaigns/create-campaign/data/model/create_campaign_request_body.dart';
import 'package:trick_crm_app/features/clients/client-view/client-view/data/model/clients_view_model.dart';
import 'package:trick_crm_app/features/deals/deal-view/deal-view/data/model/deal_view_model.dart';
import 'package:trick_crm_app/features/deals/deals/data/model/deals_model.dart';
import 'package:trick_crm_app/features/leads/create-lead/data/models/create_lead_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/Campaigns/create-campaigns/data/model/campaign_leads_request_body.dart';
import 'package:trick_crm_app/features/leads/leads/data/models/leads_model.dart';
import 'package:trick_crm_app/features/meetings/meeting-view/meeting-view/data/model/meeting_view_model.dart';
import 'package:trick_crm_app/features/projects/payment-plans/payment-plans-view/data/model/payment_plans_model.dart';
import 'package:trick_crm_app/features/tasks/task-view/task-view/data/model/task_view_model.dart';
import 'package:trick_crm_app/features/tasks/tasks/data/model/tasks_model.dart';

import '../../features/calls/create-call/data/model/create_call_model.dart';
import '../../features/calls/create-call/data/model/create_call_request_body.dart';
import '../../features/calls/calls/data/model/calls_model.dart';
import '../../features/campaigns/create-campaign/data/model/create_campaign_model.dart';
import '../../features/campaigns/campaigns/model/campaigns_model.dart';
import '../../features/clients/clients/data/model/clients_model.dart';
import '../../features/clients/create-client/data/model/create_client_model.dart';
import '../../features/clients/create-client/data/model/create_client_request_body.dart';
import '../../features/contacts/contact-view/contact-view/data/model/contacts_view_model.dart';
import '../../features/contacts/create-contacts/data/model/create_contact_model.dart';
import '../../features/contacts/create-contacts/data/model/create_contact_request_body.dart';
import '../../features/contacts/contacts/data/contacts_model.dart';
import '../../features/deals/create-deal/data/model/create_deal_model.dart';
import '../../features/deals/create-deal/data/model/create_deal_request_body.dart';
import '../../features/home/data/models/dashboard_response.dart';
import '../../features/leads/create-lead/data/models/create_lead_request_body.dart';
import '../../features/leads/lead-view/Attatchments/create-attachment/data/model/create_attachment_model.dart';
import '../../features/leads/lead-view/Campaigns/create-campaigns/data/model/create_campaign_leads_model.dart';
import '../../features/leads/lead-view/Information/data/model/edit_lead_model.dart';
import '../../features/leads/lead-view/Open-Activities/open-meetings/create-lead-meeting/data/model/create_lead_meeting_model.dart';
import '../../features/leads/lead-view/Open-Activities/open-meetings/create-lead-meeting/data/model/create_lead_meeting_request_body.dart';
import '../../features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/data/model/create_lead_task_model.dart';
import '../../features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/data/model/create_lead_task_request_body.dart';
import '../../features/leads/lead-view/notes/create-note/data/model/create_lead_note_model.dart';
import '../../features/leads/lead-view/notes/create-note/data/model/create_lead_note_reqest_body.dart';
import '../../features/leads/lead-view/notes/delete-note/data/model/delete_note_model.dart';
import '../../features/leads/lead-view/Attatchments/delete_attachment/data/model/delete_attachment_model.dart';
import '../../features/leads/lead-view/lead-view/data/model/leads_view_model.dart';
import '../../features/leads/lead-view/notes/update-note/data/models/update_lead_note_model.dart';
import '../../features/leads/lead-view/notes/update-note/data/models/update_lead_note_request_body.dart';
import '../../features/meetings/create-meeting/data/model/create_meeting_model.dart';
import '../../features/meetings/create-meeting/data/model/create_meeting_request_body.dart';
import '../../features/meetings/meetings/data/model/meetings_model.dart';
import '../../features/projects/payment-plans/create-payment-plans/data/model/create_payment_plans_model.dart';
import '../../features/projects/payment-plans/create-payment-plans/data/model/create_payment_plans_request_body.dart';
import '../../features/projects/projects/create-project/data/model/create_project_model.dart';
import '../../features/projects/projects/create-project/data/model/create_project_request_body.dart';
import '../../features/projects/projects/data/model/projects_model.dart';
import '../../features/tasks/create-task/data/model/create_task_model.dart';
import '../../features/tasks/create-task/data/model/create_task_request_body.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

/// This is the API service class that handles all the API calls.
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  /// service for login
  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody);

  /// service for dashboard
  @GET(ApiConstants.dashboard)
  Future<DashboardResponseModel> getDashboard();

  /// service for Leads
  @GET(ApiConstants.leads)
  Future<LeadsModel> getLeads();

  /// service for create Lead
  @POST(ApiConstants.createLead)
  Future<CreateLeadModel> createLead(
      @Body() CreateLeadRequestBody createLeadRequestBody);

  /// service for Leads View
  @GET("/leads/{id}/view")
  Future<LeadsViewModel> getLeadsView(@Path("id") int id);

  /// service for Leads Edit
  @GET("/leads/{id}/edit")
  Future<EditLeadModel> getEditLead(@Path("id") int id);

  /// service for create Lead Note
  @POST("/leads/{id}/create-note")
  Future<CreateLeadNoteModel> createLeadNote(@Path("id") int id,
      @Body() CreateLeadNoteRequestBody createLeadNoteRequestBody);

  /// service for update Lead Note
  @PUT("/leads/{id}/{idNote}/update-note")
  Future<UpdateLeadNoteModel> updateLeadNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() UpdateLeadNoteRequestBody updateLeadNoteRequestBody);

  /// service for delete Lead Note
  @GET("/leads/{id}/{idNote}/delete-note")
  Future<DeleteNoteModel> deleteLeadNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for create attachment
  @POST("/leads/{id}/create-attachment")
  Future<CreateAttachmentModel> createAttachment(
    @Path("id") int leadId,
    @Body() File attachment,
  );

  /// service for delete attachment
  @GET("/leads/{id}/{idAttachment}/delete-attachment")
  Future<DeleteAttachmentModel> deleteAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  /// service for create lead campaign
  @POST("/leads/{id}/create-campaign")
  Future<CreateCampaignLeadsModel> createLeadCampaign(
    @Path("id") int leadId,
    @Body() CampaignLeadsRequestBody campaignLeadsRequestBody,
  );

  /// service for create lead task
  @POST("/leads/{id}/create-task")
  Future<CreateLeadTaskModel> createLeadTask(
    @Path("id") int leadId,
    @Body() CreateLeadTaskRequestBody createLeadTaskRequestBody,
  );

  /// service for create lead meeting
  @POST("/leads/{id}/create-meeting")
  Future<CreateLeadMeetingModel> createLeadMeeting(
    @Path("id") int leadId,
    @Body() CreateLeadMeetingRequestBody createLeadMeetingRequestBody,
  );

  /// service for Clients
  @GET(ApiConstants.clients)
  Future<ClientsModel> getClients();

  /// service for create Client
  @POST(ApiConstants.createClient)
  Future<CreateClientModel> createClient(
      @Body() CreateClientRequestBody createClientRequestBody);

  /// service for Client View
  @GET("/clients/{id}/view")
  Future<ClientsViewModel> getClientView(@Path("id") int id);

  /// service for Contacts
  @GET(ApiConstants.contacts)
  Future<ContactsModel> getContacts();

  /// service for create Contact
  @POST(ApiConstants.createContact)
  Future<CreateContactModel> createContact(
      @Body() CreateContactRequestBody createContactRequestBody);

  /// service for Contact View
  @GET("/contacts/{id}/view")
  Future<ContactsViewModel> getContactView(@Path("id") int id);

  /// service for Campaigns
  @GET(ApiConstants.campaigns)
  Future<CampaignsModel> getCampaigns();

  /// service for create Campaign
  @POST(ApiConstants.createCampaign)
  Future<CreateCampaignModel> createCampaign(
      @Body() CreateCampaignRequestBody createCampaignRequestBody);

  /// service for Tasks
  @GET(ApiConstants.tasks)
  Future<TasksModel> getTasks();

  /// service for create Task
  @POST(ApiConstants.createTask)
  Future<CreateTaskModel> createTask(
      @Body() CreateTaskRequestBody createTaskRequestBody);

  /// service for Task View
  @GET("/tasks/{id}/view")
  Future<TaskViewModel> getTaskView(@Path("id") int id);

  /// service for Meetings
  @GET(ApiConstants.meetings)
  Future<MeetingsModel> getMeetings();

  /// service for create Meeting
  @POST(ApiConstants.createMeeting)
  Future<CreateMeetingModel> createMeeting(
      @Body() CreateMeetingRequestBody createMeetingRequestBody);

  /// service for Meeting View
  @GET("/meetings/{id}/view")
  Future<MeetingViewModel> getMeetingView(@Path("id") int id);

  /// service for Calls
  @GET(ApiConstants.calls)
  Future<CallsModel> getCalls();

  /// service for create Call
  @POST(ApiConstants.createCall)
  Future<CreateCallModel> createCall(
      @Body() CreateCallRequestBody createCallRequestBody);

  /// service for Call View
  @GET("/calls/{id}/view")
  Future<CallViewModel> getCallView(@Path("id") int id);

  /// service for Deals
  @GET(ApiConstants.deals)
  Future<DealsModel> getDeals();

  /// service for create Deal
  @POST(ApiConstants.createDeal)
  Future<CreateDealModel> createDeal(
    @Body() CreateDealRequestBody createDealRequestBody,
  );

  /// service for Deal View
  @GET("/deals/{id}/view")
  Future<DealViewModel> getDealView(@Path("id") int id);

  /// service for Brokers
  @GET(ApiConstants.brokers)
  Future<BrokersModel> getBrokers();

  /// service for create Broker
  @POST(ApiConstants.createBroker)
  Future<CreateBrokersModel> createBroker(
      @Body() CreateBrokerRequestBody createBrokerRequestBody);

  /// service for projects
  @GET(ApiConstants.projects)
  Future<ProjectsModel> getProjects();

  /// service for create project
  @POST(ApiConstants.createProject)
  Future<CreateProjectModel> createProject(
      @Body() CreateProjectRequestBody createProjectRequestBody);

  /// service for payment plans
  @GET(ApiConstants.paymentPlans)
  Future<PaymentPlansModel> getPaymentPlans();

  /// service for create payment plans
  @POST(ApiConstants.createPaymentPlans)
  Future<CreatePaymentPlansModel> createPaymentPlans(
      @Body() CreatePaymentPlansRequestBody createPaymentPlansRequestBody);
}
