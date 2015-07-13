//  Responses.m

#import "Responses.h"


@implementation CreateResponse

- (NSUUID *)id {
    return (NSUUID *)self.results[@"id"];
}

- (void)setId:(NSUUID *)id {
    self.results[@"id"] = id;
}

- (NSString *)responseName {
    return @"Create";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation UpdateResponse

- (NSString *)responseName {
    return @"Update";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation DeleteResponse

- (NSString *)responseName {
    return @"Delete";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RetrieveResponse

- (Entity *)entity {
    return (Entity *)self.results[@"Entity"];
}

- (void)setEntity:(Entity *)entity {
    self.results[@"Entity"] = entity;
}

- (NSString *)responseName {
    return @"Retrieve";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RetrieveMultipleResponse

- (EntityCollection *)entityCollection {
    return (EntityCollection *)self.results[@"EntityCollection"];
}

- (void)setEntityCollection:(EntityCollection *)entityCollection {
    self.results[@"EntityCollection"] = entityCollection;
}

- (NSString *)responseName {
    return @"RetrieveMultiple";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AddItemCampaignResponse

- (NSUUID *)campaignItemId {
    return (NSUUID *)self.results[@"CampaignItemId"];
}

- (void)setCampaignItemId:(NSUUID *)campaignItemId {
    self.results[@"CampaignItemId"] = campaignItemId;
}

- (NSString *)responseName {
    return @"AddItemCampaign";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AddListMembersListResponse

- (NSString *)responseName {
    return @"AddListMembersList";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AddMemberListResponse

- (NSUUID *)id {
    return (NSUUID *)self.results[@"Id"];
}

- (void)setId:(NSUUID *)id {
    self.results[@"Id"] = id;
}

- (NSString *)responseName {
    return @"AddMemberList";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AddPrincipalToQueueResponse

- (NSString *)responseName {
    return @"AddPrincipalToQueue";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AddProductToKitResponse

- (NSString *)responseName {
    return @"AddProductToKit";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AddRecurrenceResponse

- (NSUUID *)id {
    return (NSUUID *)self.results[@"id"];
}

- (void)setId:(NSUUID *)id {
    self.results[@"id"] = id;
}

- (NSString *)responseName {
    return @"AddRecurrence";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AddToQueueResponse

- (NSUUID *)queueItemId {
    return (NSUUID *)self.results[@"QueueItemId"];
}

- (void)setQueueItemId:(NSUUID *)queueItemId {
    self.results[@"QueueItemId"] = queueItemId;
}

- (NSString *)responseName {
    return @"AddToQueue";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AssignResponse

- (NSString *)responseName {
    return @"Assign";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation AssociateEntitiesResponse

- (NSString *)responseName {
    return @"AssociateEntities";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation BackgroundSendEmailResponse

- (EntityCollection *)entityCollection {
    return (EntityCollection *)self.results[@"EntityCollection"];
}

- (void)setEntityCollection:(EntityCollection *)entityCollection {
    self.results[@"EntityCollection"] = entityCollection;
}

- (NSArray *)hasAttachments {
    return (NSArray *)self.results[@"HasAttachments"];
}

- (void)setHasAttachments:(NSArray *)hasAttachments {
    self.results[@"HasAttachments"] = hasAttachments;
}

- (NSString *)responseName {
    return @"BackgroundSendEmail";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation BookResponse

- (ValidationResult *)validationResult {
    return (ValidationResult *)self.results[@"ValidationResult"];
}

- (void)setValidationResult:(ValidationResult *)validationResult {
    self.results[@"ValidationResult"] = validationResult;
}

- (NSObject *)notifications {
    return (NSObject *)self.results[@"Notifications"];
}

- (void)setNotifications:(NSObject *)notifications {
    self.results[@"Notifications"] = notifications;
}

- (NSString *)responseName {
    return @"Book";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CancelContractResponse

- (NSString *)responseName {
    return @"CancelContract";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CancelSalesOrderResponse

- (NSString *)responseName {
    return @"CancelSalesOrder";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CheckIncomingEmailResponse

- (CRMBoolean *)shouldDeliver {
    return (CRMBoolean *)self.results[@"ShouldDeliver"];
}

- (void)setShouldDeliver:(CRMBoolean *)shouldDeliver {
    self.results[@"ShouldDeliver"] = shouldDeliver;
}

- (CRMInteger *)reasonCode {
    return (CRMInteger *)self.results[@"ReasonCode"];
}

- (void)setReasonCode:(CRMInteger *)reasonCode {
    self.results[@"ReasonCode"] = reasonCode;
}

- (NSString *)responseName {
    return @"CheckIncomingEmail";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CheckPromoteEmailResponse

- (CRMBoolean *)shouldPromote {
    return (CRMBoolean *)self.results[@"ShouldPromote"];
}

- (void)setShouldPromote:(CRMBoolean *)shouldPromote {
    self.results[@"ShouldPromote"] = shouldPromote;
}

- (CRMInteger *)reasonCode {
    return (CRMInteger *)self.results[@"ReasonCode"];
}

- (void)setReasonCode:(CRMInteger *)reasonCode {
    self.results[@"ReasonCode"] = reasonCode;
}

- (NSString *)responseName {
    return @"CheckPromoteEmail";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CloneContractResponse

- (Entity *)entity {
    return (Entity *)self.results[@"Entity"];
}

- (void)setEntity:(Entity *)entity {
    self.results[@"Entity"] = entity;
}

- (NSString *)responseName {
    return @"CloneContract";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CloseIncidentResponse

- (NSString *)responseName {
    return @"CloseIncident";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CloseQuoteResponse

- (NSString *)responseName {
    return @"CloseQuote";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CopyDynamicListToStaticResponse

- (NSUUID *)staticListId {
    return (NSUUID *)self.results[@"StaticListId"];
}

- (void)setStaticListId:(NSUUID *)staticListId {
    self.results[@"StaticListId"] = staticListId;
}

- (NSString *)responseName {
    return @"CopyDynamicListToStatic";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CreateExceptionResponse

- (NSUUID *)id {
    return (NSUUID *)self.results[@"id"];
}

- (void)setId:(NSUUID *)id {
    self.results[@"id"] = id;
}

- (NSString *)responseName {
    return @"CreateException";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation CreateInstanceResponse

- (CRMBoolean *)seriesCanBeExpanded {
    return (CRMBoolean *)self.results[@"SeriesCanBeExpanded"];
}

- (void)setSeriesCanBeExpanded:(CRMBoolean *)seriesCanBeExpanded {
    self.results[@"SeriesCanBeExpanded"] = seriesCanBeExpanded;
}

- (NSString *)responseName {
    return @"CreateInstance";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation DeleteOpenInstancesResponse

- (NSString *)responseName {
    return @"DeleteOpenInstances";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation DeliverIncomingEmailResponse

- (NSUUID *)emailId {
    return (NSUUID *)self.results[@"EmailId"];
}

- (void)setEmailId:(NSUUID *)emailId {
    self.results[@"EmailId"] = emailId;
}

- (NSString *)responseName {
    return @"DeliverIncomingEmail";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation DeliverPromoteEmailResponse

- (NSUUID *)emailId {
    return (NSUUID *)self.results[@"EmailId"];
}

- (void)setEmailId:(NSUUID *)emailId {
    self.results[@"EmailId"] = emailId;
}

- (NSString *)responseName {
    return @"DeliverPromoteEmail";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation DisassociateEntitiesResponse

- (NSString *)responseName {
    return @"DisassociateEntities";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation LockInvoicePricingResponse

- (NSString *)responseName {
    return @"LockInvoicePricing";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation LockSalesOrderPricingResponse

- (NSString *)responseName {
    return @"LockSalesOrderPricing";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation LoseOpportunityResponse

- (NSString *)responseName {
    return @"LoseOpportunity";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation MergeResponse

- (NSString *)responseName {
    return @"Merge";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation PickFromQueueResponse

- (NSString *)responseName {
    return @"PickFromQueue";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation QualifyLeadResponse

- (EntityReferenceCollection *)createdEntities {
    return (EntityReferenceCollection *)self.results[@"CreatedEntities"];
}

- (void)setCreatedEntities:(EntityReferenceCollection *)createdEntities {
    self.results[@"CreatedEntities"] = createdEntities;
}

- (NSString *)responseName {
    return @"QualifyLead";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RecalculateResponse

- (NSString *)responseName {
    return @"Recalculate";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation ReleaseToQueueResponse

- (NSString *)responseName {
    return @"ReleaseToQueue";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RemoveFromQueueResponse

- (NSString *)responseName {
    return @"RemoveFromQueue";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RemoveItemCampaignResponse

- (NSString *)responseName {
    return @"RemoveItemCampaign";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RemoveMemberListResponse

- (NSString *)responseName {
    return @"RemoveMemberList";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RemovePrivilegeRoleResponse

- (NSString *)responseName {
    return @"RemovePrivilegeRole";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RemoveRelatedResponse

- (NSString *)responseName {
    return @"RemoveRelated";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation ReplacePrivilegesRoleResponse

- (NSString *)responseName {
    return @"ReplacePrivilegesRole";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RescheduleResponse

- (ValidationResult *)validationResult {
    return (ValidationResult *)self.results[@"ValidationResult"];
}

- (void)setValidationResult:(ValidationResult *)validationResult {
    self.results[@"ValidationResult"] = validationResult;
}

- (NSObject *)notifications {
    return (NSObject *)self.results[@"Notifications"];
}

- (void)setNotifications:(NSObject *)notifications {
    self.results[@"Notifications"] = notifications;
}

- (NSString *)responseName {
    return @"Reschedule";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RetrieveUserQueuesResponse

- (EntityCollection *)entityCollection {
    return (EntityCollection *)self.results[@"EntityCollection"];
}

- (void)setEntityCollection:(EntityCollection *)entityCollection {
    self.results[@"EntityCollection"] = entityCollection;
}

- (NSString *)responseName {
    return @"RetrieveUserQueues";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation RouteToResponse

- (NSString *)responseName {
    return @"RouteTo";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation SendEmailResponse

- (NSString *)subject {
    return (NSString *)self.results[@"Subject"];
}

- (void)setSubject:(NSString *)subject {
    self.results[@"Subject"] = subject;
}

- (NSString *)responseName {
    return @"SendEmail";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation SendFaxResponse

- (NSString *)responseName {
    return @"SendFax";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation SetRelatedResponse

- (NSString *)responseName {
    return @"SetRelated";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation SetStateResponse

- (NSString *)responseName {
    return @"SetState";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation ValidateRecurrenceRuleResponse

- (NSString *)description {
    return (NSString *)self.results[@"Description"];
}

- (void)setDescription:(NSString *)description {
    self.results[@"Description"] = description;
}

- (NSString *)responseName {
    return @"ValidateRecurrenceRule";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation WinOpportunityResponse

- (NSString *)responseName {
    return @"WinOpportunity";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end


@implementation WinQuoteResponse

- (NSString *)responseName {
    return @"WinQuote";
}

- (void)setResponseName:(NSString *)responseName {
    [NSException raise:@"Cannot modify Response Name"
                format:@"Cannot modify the Response Name of a type derived from OrganizationResponse."];
}

@end

