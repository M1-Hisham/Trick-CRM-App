import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_request_body.dart';
import 'package:trick_crm_app/features/auth/login/data/models/login_response.dart';
import 'package:trick_crm_app/features/brokers/broker-view/broker-view/data/model/broker_view_model.dart';
import 'package:trick_crm_app/features/brokers/create-broker/data/model/create_broker_request_body.dart';
import 'package:trick_crm_app/features/brokers/create-broker/data/model/create_brokers_model.dart';
import 'package:trick_crm_app/features/brokers/brokers/data/model/brokers_model.dart';
import 'package:trick_crm_app/features/calls/call-view/call-view/data/model/call_view_model.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/campaign-view/data/model/campaign_view_model.dart';
import 'package:trick_crm_app/features/campaigns/create-campaign/data/model/create_campaign_request_body.dart';
import 'package:trick_crm_app/features/clients/client-view/client-view/data/model/clients_view_model.dart';
import 'package:trick_crm_app/features/deals/deal-view/deal-view/data/model/deal_view_model.dart';
import 'package:trick_crm_app/features/deals/deals/data/model/deals_model.dart';
import 'package:trick_crm_app/features/leads/create-lead/data/models/create_lead_model.dart';
import 'package:trick_crm_app/features/leads/leads/data/models/leads_model.dart';
import 'package:trick_crm_app/features/meetings/meeting-view/meeting-view/data/model/meeting_view_model.dart';
import 'package:trick_crm_app/features/profile/Company/update-company/data/model/update_company_request_body.dart';
import 'package:trick_crm_app/features/profile/General-Info/general-info-view/data/model/general_info_model.dart';
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
import '../../features/leads/lead-view/Edit-lead/data/model/edit_lead_model.dart';
import '../../features/leads/lead-view/Open-Activities/open-meetings/create-lead-meeting/data/model/create_lead_meeting_model.dart';
import '../../features/leads/lead-view/Open-Activities/open-meetings/create-lead-meeting/data/model/create_lead_meeting_request_body.dart';
import '../../features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/data/model/create_lead_task_model.dart';
import '../../features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/data/model/create_lead_task_request_body.dart';
import '../../features/leads/lead-view/lead-view/data/model/leads_view_model.dart';
import '../../features/meetings/create-meeting/data/model/create_meeting_model.dart';
import '../../features/meetings/create-meeting/data/model/create_meeting_request_body.dart';
import '../../features/meetings/meetings/data/model/meetings_model.dart';
import '../../features/profile/Company/company-view/data/model/company_model.dart';
import '../../features/profile/General-Info/update-general-info/data/model/update_general_info_req_body.dart';
import '../../features/profile/Recycle-Bin/recycle-bin-view/data/model/recycle_bin_model.dart';
import '../../features/profile/Subscription/data/model/subscription_model.dart';
import '../../features/projects/payment-plans/create-payment-plans/data/model/create_payment_plans_model.dart';
import '../../features/projects/payment-plans/create-payment-plans/data/model/create_payment_plans_request_body.dart';
import '../../features/projects/projects/create-project/data/model/create_project_model.dart';
import '../../features/projects/projects/create-project/data/model/create_project_request_body.dart';
import '../../features/projects/projects/data/model/projects_model.dart';
import '../../features/tasks/create-task/data/model/create_task_model.dart';
import '../../features/tasks/create-task/data/model/create_task_request_body.dart';
import '../models/note/create_and_edit_note_request_body.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

/// This is the API service class that handles all the API calls.
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // =================== Auth ===================

  /// service for login
  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody);

  // =================== Dashboard ===================

  /// service for dashboard
  @GET(ApiConstants.dashboard)
  Future<DashboardResponseModel> getDashboard();

  // =================== Leads ===================

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
  Future<FeatStatusModel> createLeadNote(@Path("id") int id,
      @Body() CreateAndEditNoteRequestBody createLeadNoteRequestBody);

  /// service for update Lead Note
  @POST("/leads/{id}/{idNote}/update-note")
  Future<FeatStatusModel> editLeadNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() CreateAndEditNoteRequestBody editNoteRequestBody);

  /// service for delete Lead Note
  @GET("/leads/{id}/{idNote}/delete-note")
  Future<FeatStatusModel> deleteLeadNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for create attachment
  @POST("/leads/{id}/create-attachment")
  Future<CreateAttachmentModel> createAttachment(
    @Path("id") int leadId,
    @Body() File attachment,
  );

  /// service for Lead delete attachment
  @GET("/leads/{id}/{idAttachment}/delete-file")
  Future<FeatStatusModel> deleteLeadAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  /// service for create lead campaign
  @POST("/leads/{id}/create-campaign")
  Future<FeatStatusModel> createLeadCampaign(
    @Path("id") int leadId,
    @Body() Map<String, dynamic> createCampaignLeadRequestBody,
  );

  /// service for edit lead campaign
  @POST("/leads/{leadId}/{campaignId}/update-lead-campaign")
  Future<FeatStatusModel> editLeadCampaign(
    @Path("leadId") int leadId,
    @Path("campaignId") int campaignId,
    @Body() Map<String, dynamic> editLeadCampaignRequestBody,
  );

  /// service for delete lead campaign
  @GET("/leads/{leadId}/{campaignId}/delete-lead-campaign")
  Future<FeatStatusModel> deleteLeadCampaign(
    @Path("leadId") int leadId,
    @Path("campaignId") int campaignId,
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

  // =================== Clients ===================

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

  /// service for Client Create Note
  @POST("/clients/{id}/create-note")
  Future<FeatStatusModel> createClientNote(@Path("id") int id,
      @Body() CreateAndEditNoteRequestBody createClientNoteRequestBody);

  /// service for Client Delete Note
  @GET("/clients/{id}/{idNote}/delete-note")
  Future<FeatStatusModel> deleteClientNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for Client Edit Note
  @POST("/clients/{id}/{idNote}/update-note")
  Future<FeatStatusModel> editClientNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() CreateAndEditNoteRequestBody editNoteRequestBody);

  /// service for Client Delete Attachment
  @GET("/clients/{id}/{idAttachment}/delete-file")
  Future<FeatStatusModel> deleteClientAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  // =================== Contacts ===================

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

  /// service for Contact Create Note
  @POST("/contacts/{id}/create-note")
  Future<FeatStatusModel> createContactNote(@Path("id") int id,
      @Body() CreateAndEditNoteRequestBody createContactNoteRequestBody);

  /// service for Contact Delete Note
  @GET("/contacts/{id}/{idNote}/delete-note")
  Future<FeatStatusModel> deleteContactNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for Contact Edit Note
  @POST("/contacts/{id}/{idNote}/update-note")
  Future<FeatStatusModel> editContactNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() CreateAndEditNoteRequestBody editNoteRequestBody);

  /// service for Contact Delete Attachment
  @GET("/contacts/{id}/{idAttachment}/delete-file")
  Future<FeatStatusModel> deleteContactAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  // =================== Campaigns ===================

  /// service for Campaigns
  @GET(ApiConstants.campaigns)
  Future<CampaignsModel> getCampaigns();

  /// service for create Campaign
  @POST(ApiConstants.createCampaign)
  Future<CreateCampaignModel> createCampaign(
      @Body() CreateCampaignRequestBody createCampaignRequestBody);

  /// service for Campaign View
  @GET("/campaigns/{id}/view")
  Future<CampaignViewModel> getCampaignView(@Path("id") int id);

  /// service for Campaign Create Note
  @POST("/campaigns/{id}/create-note")
  Future<FeatStatusModel> createCampaignNote(@Path("id") int id,
      @Body() CreateAndEditNoteRequestBody createCampaignNoteRequestBody);

  /// service for Campaign Delete Note
  @GET("/campaigns/{id}/{idNote}/delete-note")
  Future<FeatStatusModel> deleteCampaignNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for Campaign Edit Note
  @POST("/campaigns/{id}/{idNote}/update-note")
  Future<FeatStatusModel> editCampaignNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() CreateAndEditNoteRequestBody editNoteRequestBody);

  /// service for Campaign Delete Attachment
  @GET("/campaigns/{id}/{idAttachment}/delete-file")
  Future<FeatStatusModel> deleteCampaignAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  /// service for Campaign Create Lead
  @POST("/campaigns/{id}/create-lead")
  Future<FeatStatusModel> createCampaignLead(@Path("id") int id,
      @Body() Map<String, dynamic> createLeadCampaignRequestBody);

  /// service for Campaign Edit Lead
  @POST("/campaigns/{campaignId}/{leadId}/update-campaign-lead")
  Future<FeatStatusModel> editCampaignLead(
      @Path("campaignId") int campaignId,
      @Path("leadId") int leadId,
      @Body() Map<String, dynamic> editLeadCampaignRequestBody);

  /// service for Campaign Delete Lead
  @GET("/campaigns/{campaignId}/{leadId}/delete-campaign-lead")
  Future<FeatStatusModel> deleteCampaignLead(
      @Path("campaignId") int campaignId, @Path("leadId") int leadId);

  // =================== Tasks ===================

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

  // =================== Meetings ===================

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

  /// service for Meeting Create Note
  @POST("/meetings/{id}/create-note")
  Future<FeatStatusModel> createMeetingNote(@Path("id") int id,
      @Body() CreateAndEditNoteRequestBody createMeetingNoteRequestBody);

  /// service for Meeting Delete Note
  @GET("/meetings/{id}/{idNote}/delete-note")
  Future<FeatStatusModel> deleteMeetingNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for Meeting Edit Note
  @POST("/meetings/{id}/{idNote}/update-note")
  Future<FeatStatusModel> editMeetingNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() CreateAndEditNoteRequestBody editNoteRequestBody);

  /// Service for Meeting Delete Attachment
  @GET("/meetings/{id}/{idAttachment}/delete-file")
  Future<FeatStatusModel> deleteMeetingAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  // =================== Calls ===================

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

  /// service for Call Create Note
  @POST("/calls/{id}/create-note")
  Future<FeatStatusModel> createCallNote(@Path("id") int id,
      @Body() CreateAndEditNoteRequestBody createCallNoteRequestBody);

  /// service for Call Delete Note
  @GET("/calls/{id}/{idNote}/delete-note")
  Future<FeatStatusModel> deleteCallNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for Call Edit Note
  @POST("/calls/{id}/{idNote}/update-note")
  Future<FeatStatusModel> editCallNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() CreateAndEditNoteRequestBody editNoteRequestBody);

  /// service for Call Delete Attachment
  @GET("/calls/{id}/{idAttachment}/delete-file")
  Future<FeatStatusModel> deleteCallAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  /// service for Call Mark as Complete
  @POST("/calls/{id}/update")
  Future<FeatStatusModel> markCallAsComplete(
    @Path("id") int id,
  );

  // =================== Deals ===================

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

  /// service for Deal Create Note
  @POST("/deals/{id}/create-note")
  Future<FeatStatusModel> createDealNote(@Path("id") int id,
      @Body() CreateAndEditNoteRequestBody createDealNoteRequestBody);

  /// service for Deal Delete Note
  @GET("/deals/{id}/{idNote}/delete-note")
  Future<FeatStatusModel> deleteDealNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for Deal Edit Note
  @POST("/deals/{id}/{idNote}/update-note")
  Future<FeatStatusModel> editDealNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() CreateAndEditNoteRequestBody editNoteRequestBody);

  /// service for Deal Delete Attachment
  @GET("/deals/{id}/{idAttachment}/delete-file")
  Future<FeatStatusModel> deleteDealAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  /// service for Deal Close
  @GET("/deals/{id}/close-deal")
  Future<FeatStatusModel> closeDeal(@Path("id") int id);

  /// service for Edit Deal
  @POST("/deals/{id}/update")
  Future<FeatStatusModel> editDeal(
      @Path("id") int id, @Body() CreateDealRequestBody editDealRequestBody);

  // =================== Brokers ===================

  /// service for Brokers
  @GET(ApiConstants.brokers)
  Future<BrokersModel> getBrokers();

  /// service for create Broker
  @POST(ApiConstants.createBroker)
  Future<CreateBrokersModel> createBroker(
      @Body() CreateBrokerRequestBody createBrokerRequestBody);

  /// service for Broker View
  @GET("/brokers/{id}/view")
  Future<BrokerViewModel> getBrokerView(@Path("id") int id);

  /// service for Broker Create Note
  @POST("/brokers/{id}/create-note")
  Future<FeatStatusModel> createBrokerNote(@Path("id") int id,
      @Body() CreateAndEditNoteRequestBody createBrokerNoteRequestBody);

  /// service for Broker Delete Note
  @GET("/brokers/{id}/{idNote}/delete-note")
  Future<FeatStatusModel> deleteBrokerNote(
      @Path("id") int id, @Path("idNote") int idNote);

  /// service for Broker Edit Note
  @POST("/brokers/{id}/{idNote}/update-note")
  Future<FeatStatusModel> editBrokerNote(
      @Path("id") int id,
      @Path("idNote") int idNote,
      @Body() CreateAndEditNoteRequestBody editNoteRequestBody);

  /// service for Broker Delete Attachment
  @GET("/brokers/{id}/{idAttachment}/delete-file")
  Future<FeatStatusModel> deleteBrokerAttachment(
      @Path("id") int id, @Path("idAttachment") int idAttachment);

  // =================== Projects ===================

  /// service for projects
  @GET(ApiConstants.projects)
  Future<ProjectsModel> getProjects();

  /// service for create project
  @POST(ApiConstants.createProject)
  Future<CreateProjectModel> createProject(
      @Body() CreateProjectRequestBody createProjectRequestBody);

  // =================== Payment Plans ===================

  /// service for payment plans
  @GET(ApiConstants.paymentPlans)
  Future<PaymentPlansModel> getPaymentPlans();

  /// service for create payment plans
  @POST(ApiConstants.createPaymentPlans)
  Future<CreatePaymentPlansModel> createPaymentPlans(
      @Body() CreatePaymentPlansRequestBody createPaymentPlansRequestBody);

  // =================== Reports ===================

  /// service for Projects Reports
  @GET("/projectsreports/{reportName}/view")
  Future<HttpResponse<String>> getProjectReportRaw(
      @Path("reportName") String reportName);

  /// service for Deals Reports
  @GET("/dealsreports/{reportName}/view")
  Future<HttpResponse<String>> getDealReportRaw(
      @Path("reportName") String reportName);

  // =================== Profile ===================

  @GET(ApiConstants.company)
  Future<CompanyModel> getCompany();

  @POST(ApiConstants.updateCompany)
  Future<FeatStatusModel> updateCompany(
      @Body() UpdateCompanyRequestBody updateCompanyRequestBody);

  @GET(ApiConstants.subscription)
  Future<SubscriptionModel> getSubscription();

  @GET("/user/{id}/view-profile")
  Future<GeneralInfoModel> getUserProfile(@Path("id") int id);

  @POST("/userinfo/update")
  Future<FeatStatusModel> updateUserInfo(
      @Body() UpdateGeneralInfoReqBody updateGeneralInfoRequestBody);

  @GET(ApiConstants.recycleBin)
  Future<RecycleBinModel> getRecycleBin();

  @POST("/{recycleName}/{id}/restore")
  Future<FeatStatusModel> restoreRecycleBin(
      @Path("recycleName") String recycleName, @Path("id") int id);
}
