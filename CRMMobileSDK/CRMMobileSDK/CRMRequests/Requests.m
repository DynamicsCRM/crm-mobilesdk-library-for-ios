//  Requests.m

#import "Requests.h"


@implementation CreateRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (NSString *)requestName {
    return @"Create";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"a";
}

@end


@implementation UpdateRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (NSString *)requestName {
    return @"Update";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"a";
}

@end


@implementation DeleteRequest

- (EntityReference *)target {
    return (EntityReference *)self.parameters[@"Target"];
}

- (void)setTarget:(EntityReference *)target {
    self.parameters[@"Target"] = target;
}

- (NSString *)requestName {
    return @"Delete";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"a";
}

@end


@implementation RetrieveRequest

- (EntityReference *)target {
    return (EntityReference *)self.parameters[@"Target"];
}

- (void)setTarget:(EntityReference *)target {
    self.parameters[@"Target"] = target;
}

- (ColumnSet *)columnSet {
    return (ColumnSet *)self.parameters[@"ColumnSet"];
}

- (void)setColumnSet:(ColumnSet *)columnSet {
    self.parameters[@"ColumnSet"] = columnSet;
}

- (RelationshipQueryCollection *)relatedEntitiesQuery {
    return (RelationshipQueryCollection *)self.parameters[@"RelatedEntitiesQuery"];
}

- (void)setRelatedEntitiesQuery:(RelationshipQueryCollection *)relatedEntitiesQuery {
    self.parameters[@"RelatedEntitiesQuery"] = relatedEntitiesQuery;
}

- (NSString *)requestName {
    return @"Retrieve";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"a";
}

@end


@implementation RetrieveMultipleRequest

- (QueryBase *)query {
    return (QueryBase *)self.parameters[@"Query"];
}

- (void)setQuery:(QueryBase *)query {
    self.parameters[@"Query"] = query;
}

- (NSString *)requestName {
    return @"RetrieveMultiple";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"a";
}

@end


@implementation AddItemCampaignRequest

- (NSUUID *)campaignId {
    return (NSUUID *)self.parameters[@"CampaignId"];
}

- (void)setCampaignId:(NSUUID *)campaignId {
    self.parameters[@"CampaignId"] = campaignId;
}

- (NSUUID *)entityId {
    return (NSUUID *)self.parameters[@"EntityId"];
}

- (void)setEntityId:(NSUUID *)entityId {
    self.parameters[@"EntityId"] = entityId;
}

- (NSString *)entityName {
    return (NSString *)self.parameters[@"EntityName"];
}

- (void)setEntityName:(NSString *)entityName {
    self.parameters[@"EntityName"] = entityName;
}

- (NSString *)requestName {
    return @"AddItemCampaign";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation AddListMembersListRequest

- (NSUUID *)listId {
    return (NSUUID *)self.parameters[@"ListId"];
}

- (void)setListId:(NSUUID *)listId {
    self.parameters[@"ListId"] = listId;
}

- (NSArray *)memberIds {
    return (NSArray *)self.parameters[@"MemberIds"];
}

- (void)setMemberIds:(NSArray *)memberIds {
    self.parameters[@"MemberIds"] = memberIds;
}

- (NSString *)requestName {
    return @"AddListMembersList";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation AddMemberListRequest

- (NSUUID *)listId {
    return (NSUUID *)self.parameters[@"ListId"];
}

- (void)setListId:(NSUUID *)listId {
    self.parameters[@"ListId"] = listId;
}

- (NSUUID *)entityId {
    return (NSUUID *)self.parameters[@"EntityId"];
}

- (void)setEntityId:(NSUUID *)entityId {
    self.parameters[@"EntityId"] = entityId;
}

- (NSString *)requestName {
    return @"AddMemberList";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation AddPrincipalToQueueRequest

- (NSUUID *)queueId {
    return (NSUUID *)self.parameters[@"QueueId"];
}

- (void)setQueueId:(NSUUID *)queueId {
    self.parameters[@"QueueId"] = queueId;
}

- (Entity *)principal {
    return (Entity *)self.parameters[@"Principal"];
}

- (void)setPrincipal:(Entity *)principal {
    self.parameters[@"Principal"] = principal;
}

- (NSString *)requestName {
    return @"AddPrincipalToQueue";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation AddProductToKitRequest

- (NSUUID *)kitId {
    return (NSUUID *)self.parameters[@"KitId"];
}

- (void)setKitId:(NSUUID *)kitId {
    self.parameters[@"KitId"] = kitId;
}

- (NSUUID *)productId {
    return (NSUUID *)self.parameters[@"ProductId"];
}

- (void)setProductId:(NSUUID *)productId {
    self.parameters[@"ProductId"] = productId;
}

- (NSString *)requestName {
    return @"AddProductToKit";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation AddRecurrenceRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (NSUUID *)appointmentId {
    return (NSUUID *)self.parameters[@"AppointmentId"];
}

- (void)setAppointmentId:(NSUUID *)appointmentId {
    self.parameters[@"AppointmentId"] = appointmentId;
}

- (NSString *)requestName {
    return @"AddRecurrence";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation AddToQueueRequest

- (EntityReference *)target {
    return (EntityReference *)self.parameters[@"Target"];
}

- (void)setTarget:(EntityReference *)target {
    self.parameters[@"Target"] = target;
}

- (NSUUID *)sourceQueueId {
    return (NSUUID *)self.parameters[@"SourceQueueId"];
}

- (void)setSourceQueueId:(NSUUID *)sourceQueueId {
    self.parameters[@"SourceQueueId"] = sourceQueueId;
}

- (NSUUID *)destinationQueueId {
    return (NSUUID *)self.parameters[@"DestinationQueueId"];
}

- (void)setDestinationQueueId:(NSUUID *)destinationQueueId {
    self.parameters[@"DestinationQueueId"] = destinationQueueId;
}

- (Entity *)queueItemProperties {
    return (Entity *)self.parameters[@"QueueItemProperties"];
}

- (void)setQueueItemProperties:(Entity *)queueItemProperties {
    self.parameters[@"QueueItemProperties"] = queueItemProperties;
}

- (NSString *)requestName {
    return @"AddToQueue";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation AssignRequest

- (EntityReference *)target {
    return (EntityReference *)self.parameters[@"Target"];
}

- (void)setTarget:(EntityReference *)target {
    self.parameters[@"Target"] = target;
}

- (EntityReference *)assignee {
    return (EntityReference *)self.parameters[@"Assignee"];
}

- (void)setAssignee:(EntityReference *)assignee {
    self.parameters[@"Assignee"] = assignee;
}

- (NSString *)requestName {
    return @"Assign";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation AssociateEntitiesRequest

- (EntityReference *)moniker1 {
    return (EntityReference *)self.parameters[@"Moniker1"];
}

- (void)setMoniker1:(EntityReference *)moniker1 {
    self.parameters[@"Moniker1"] = moniker1;
}

- (EntityReference *)moniker2 {
    return (EntityReference *)self.parameters[@"Moniker2"];
}

- (void)setMoniker2:(EntityReference *)moniker2 {
    self.parameters[@"Moniker2"] = moniker2;
}

- (NSString *)relationshipName {
    return (NSString *)self.parameters[@"RelationshipName"];
}

- (void)setRelationshipName:(NSString *)relationshipName {
    self.parameters[@"RelationshipName"] = relationshipName;
}

- (NSString *)requestName {
    return @"AssociateEntities";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation BackgroundSendEmailRequest

- (QueryBase *)query {
    return (QueryBase *)self.parameters[@"Query"];
}

- (void)setQuery:(QueryBase *)query {
    self.parameters[@"Query"] = query;
}

- (NSString *)requestName {
    return @"BackgroundSendEmail";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation BookRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (CRMBoolean *)returnNotifications {
    return (CRMBoolean *)self.parameters[@"ReturnNotifications"];
}

- (void)setReturnNotifications:(CRMBoolean *)returnNotifications {
    self.parameters[@"ReturnNotifications"] = returnNotifications;
}

- (NSString *)requestName {
    return @"Book";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CancelContractRequest

- (NSUUID *)contractId {
    return (NSUUID *)self.parameters[@"ContractId"];
}

- (void)setContractId:(NSUUID *)contractId {
    self.parameters[@"ContractId"] = contractId;
}

- (NSDate *)cancelDate {
    return (NSDate *)self.parameters[@"CancelDate"];
}

- (void)setCancelDate:(NSDate *)cancelDate {
    self.parameters[@"CancelDate"] = cancelDate;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"CancelContract";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CancelSalesOrderRequest

- (Entity *)orderClose {
    return (Entity *)self.parameters[@"OrderClose"];
}

- (void)setOrderClose:(Entity *)orderClose {
    self.parameters[@"OrderClose"] = orderClose;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"CancelSalesOrder";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CheckIncomingEmailRequest

- (NSString *)messageId {
    return (NSString *)self.parameters[@"MessageId"];
}

- (void)setMessageId:(NSString *)messageId {
    self.parameters[@"MessageId"] = messageId;
}

- (NSString *)subject {
    return (NSString *)self.parameters[@"Subject"];
}

- (void)setSubject:(NSString *)subject {
    self.parameters[@"Subject"] = subject;
}

- (NSString *)from {
    return (NSString *)self.parameters[@"From"];
}

- (void)setFrom:(NSString *)from {
    self.parameters[@"From"] = from;
}

- (NSString *)to {
    return (NSString *)self.parameters[@"To"];
}

- (void)setTo:(NSString *)to {
    self.parameters[@"To"] = to;
}

- (NSString *)cc {
    return (NSString *)self.parameters[@"Cc"];
}

- (void)setCc:(NSString *)cc {
    self.parameters[@"Cc"] = cc;
}

- (NSString *)bcc {
    return (NSString *)self.parameters[@"Bcc"];
}

- (void)setBcc:(NSString *)bcc {
    self.parameters[@"Bcc"] = bcc;
}

- (Entity *)extraProperties {
    return (Entity *)self.parameters[@"ExtraProperties"];
}

- (void)setExtraProperties:(Entity *)extraProperties {
    self.parameters[@"ExtraProperties"] = extraProperties;
}

- (NSString *)requestName {
    return @"CheckIncomingEmail";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CheckPromoteEmailRequest

- (NSString *)messageId {
    return (NSString *)self.parameters[@"MessageId"];
}

- (void)setMessageId:(NSString *)messageId {
    self.parameters[@"MessageId"] = messageId;
}

- (NSString *)subject {
    return (NSString *)self.parameters[@"Subject"];
}

- (void)setSubject:(NSString *)subject {
    self.parameters[@"Subject"] = subject;
}

- (CRMInteger *)directionCode {
    return (CRMInteger *)self.parameters[@"DirectionCode"];
}

- (void)setDirectionCode:(CRMInteger *)directionCode {
    self.parameters[@"DirectionCode"] = directionCode;
}

- (NSString *)requestName {
    return @"CheckPromoteEmail";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CloneContractRequest

- (NSUUID *)contractId {
    return (NSUUID *)self.parameters[@"ContractId"];
}

- (void)setContractId:(NSUUID *)contractId {
    self.parameters[@"ContractId"] = contractId;
}

- (CRMBoolean *)includeCanceledLines {
    return (CRMBoolean *)self.parameters[@"IncludeCanceledLines"];
}

- (void)setIncludeCanceledLines:(CRMBoolean *)includeCanceledLines {
    self.parameters[@"IncludeCanceledLines"] = includeCanceledLines;
}

- (NSString *)requestName {
    return @"CloneContract";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CloseIncidentRequest

- (Entity *)incidentResolution {
    return (Entity *)self.parameters[@"IncidentResolution"];
}

- (void)setIncidentResolution:(Entity *)incidentResolution {
    self.parameters[@"IncidentResolution"] = incidentResolution;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"CloseIncident";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CloseQuoteRequest

- (Entity *)quoteClose {
    return (Entity *)self.parameters[@"QuoteClose"];
}

- (void)setQuoteClose:(Entity *)quoteClose {
    self.parameters[@"QuoteClose"] = quoteClose;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"CloseQuote";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CopyDynamicListToStaticRequest

- (NSUUID *)listId {
    return (NSUUID *)self.parameters[@"ListId"];
}

- (void)setListId:(NSUUID *)listId {
    self.parameters[@"ListId"] = listId;
}

- (NSString *)requestName {
    return @"CopyDynamicListToStatic";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CreateExceptionRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (NSDate *)originalStartDate {
    return (NSDate *)self.parameters[@"OriginalStartDate"];
}

- (void)setOriginalStartDate:(NSDate *)originalStartDate {
    self.parameters[@"OriginalStartDate"] = originalStartDate;
}

- (CRMBoolean *)isDeleted {
    return (CRMBoolean *)self.parameters[@"IsDeleted"];
}

- (void)setIsDeleted:(CRMBoolean *)isDeleted {
    self.parameters[@"IsDeleted"] = isDeleted;
}

- (NSString *)requestName {
    return @"CreateException";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation CreateInstanceRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (CRMInteger *)count {
    return (CRMInteger *)self.parameters[@"Count"];
}

- (void)setCount:(CRMInteger *)count {
    self.parameters[@"Count"] = count;
}

- (NSString *)requestName {
    return @"CreateInstance";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation DeleteOpenInstancesRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (NSDate *)seriesEndDate {
    return (NSDate *)self.parameters[@"SeriesEndDate"];
}

- (void)setSeriesEndDate:(NSDate *)seriesEndDate {
    self.parameters[@"SeriesEndDate"] = seriesEndDate;
}

- (CRMInteger *)stateOfPastInstances {
    return (CRMInteger *)self.parameters[@"StateOfPastInstances"];
}

- (void)setStateOfPastInstances:(CRMInteger *)stateOfPastInstances {
    self.parameters[@"StateOfPastInstances"] = stateOfPastInstances;
}

- (NSString *)requestName {
    return @"DeleteOpenInstances";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation DeliverIncomingEmailRequest

- (NSString *)messageId {
    return (NSString *)self.parameters[@"MessageId"];
}

- (void)setMessageId:(NSString *)messageId {
    self.parameters[@"MessageId"] = messageId;
}

- (NSString *)subject {
    return (NSString *)self.parameters[@"Subject"];
}

- (void)setSubject:(NSString *)subject {
    self.parameters[@"Subject"] = subject;
}

- (NSString *)from {
    return (NSString *)self.parameters[@"From"];
}

- (void)setFrom:(NSString *)from {
    self.parameters[@"From"] = from;
}

- (NSString *)to {
    return (NSString *)self.parameters[@"To"];
}

- (void)setTo:(NSString *)to {
    self.parameters[@"To"] = to;
}

- (NSString *)cc {
    return (NSString *)self.parameters[@"Cc"];
}

- (void)setCc:(NSString *)cc {
    self.parameters[@"Cc"] = cc;
}

- (NSString *)bcc {
    return (NSString *)self.parameters[@"Bcc"];
}

- (void)setBcc:(NSString *)bcc {
    self.parameters[@"Bcc"] = bcc;
}

- (NSDate *)receivedOn {
    return (NSDate *)self.parameters[@"ReceivedOn"];
}

- (void)setReceivedOn:(NSDate *)receivedOn {
    self.parameters[@"ReceivedOn"] = receivedOn;
}

- (NSString *)submittedBy {
    return (NSString *)self.parameters[@"SubmittedBy"];
}

- (void)setSubmittedBy:(NSString *)submittedBy {
    self.parameters[@"SubmittedBy"] = submittedBy;
}

- (NSString *)importance {
    return (NSString *)self.parameters[@"Importance"];
}

- (void)setImportance:(NSString *)importance {
    self.parameters[@"Importance"] = importance;
}

- (NSString *)body {
    return (NSString *)self.parameters[@"Body"];
}

- (void)setBody:(NSString *)body {
    self.parameters[@"Body"] = body;
}

- (EntityCollection *)attachments {
    return (EntityCollection *)self.parameters[@"Attachments"];
}

- (void)setAttachments:(EntityCollection *)attachments {
    self.parameters[@"Attachments"] = attachments;
}

- (Entity *)extraProperties {
    return (Entity *)self.parameters[@"ExtraProperties"];
}

- (void)setExtraProperties:(Entity *)extraProperties {
    self.parameters[@"ExtraProperties"] = extraProperties;
}

- (CRMBoolean *)validateBeforeCreate {
    return (CRMBoolean *)self.parameters[@"ValidateBeforeCreate"];
}

- (void)setValidateBeforeCreate:(CRMBoolean *)validateBeforeCreate {
    self.parameters[@"ValidateBeforeCreate"] = validateBeforeCreate;
}

- (NSString *)requestName {
    return @"DeliverIncomingEmail";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation DeliverPromoteEmailRequest

- (NSUUID *)emailId {
    return (NSUUID *)self.parameters[@"EmailId"];
}

- (void)setEmailId:(NSUUID *)emailId {
    self.parameters[@"EmailId"] = emailId;
}

- (NSString *)messageId {
    return (NSString *)self.parameters[@"MessageId"];
}

- (void)setMessageId:(NSString *)messageId {
    self.parameters[@"MessageId"] = messageId;
}

- (NSString *)subject {
    return (NSString *)self.parameters[@"Subject"];
}

- (void)setSubject:(NSString *)subject {
    self.parameters[@"Subject"] = subject;
}

- (NSString *)from {
    return (NSString *)self.parameters[@"From"];
}

- (void)setFrom:(NSString *)from {
    self.parameters[@"From"] = from;
}

- (NSString *)to {
    return (NSString *)self.parameters[@"To"];
}

- (void)setTo:(NSString *)to {
    self.parameters[@"To"] = to;
}

- (NSString *)cc {
    return (NSString *)self.parameters[@"Cc"];
}

- (void)setCc:(NSString *)cc {
    self.parameters[@"Cc"] = cc;
}

- (NSString *)bcc {
    return (NSString *)self.parameters[@"Bcc"];
}

- (void)setBcc:(NSString *)bcc {
    self.parameters[@"Bcc"] = bcc;
}

- (NSDate *)receivedOn {
    return (NSDate *)self.parameters[@"ReceivedOn"];
}

- (void)setReceivedOn:(NSDate *)receivedOn {
    self.parameters[@"ReceivedOn"] = receivedOn;
}

- (NSString *)submittedBy {
    return (NSString *)self.parameters[@"SubmittedBy"];
}

- (void)setSubmittedBy:(NSString *)submittedBy {
    self.parameters[@"SubmittedBy"] = submittedBy;
}

- (NSString *)importance {
    return (NSString *)self.parameters[@"Importance"];
}

- (void)setImportance:(NSString *)importance {
    self.parameters[@"Importance"] = importance;
}

- (NSString *)body {
    return (NSString *)self.parameters[@"Body"];
}

- (void)setBody:(NSString *)body {
    self.parameters[@"Body"] = body;
}

- (EntityCollection *)attachments {
    return (EntityCollection *)self.parameters[@"Attachments"];
}

- (void)setAttachments:(EntityCollection *)attachments {
    self.parameters[@"Attachments"] = attachments;
}

- (Entity *)extraProperties {
    return (Entity *)self.parameters[@"ExtraProperties"];
}

- (void)setExtraProperties:(Entity *)extraProperties {
    self.parameters[@"ExtraProperties"] = extraProperties;
}

- (NSString *)requestName {
    return @"DeliverPromoteEmail";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation DisassociateEntitiesRequest

- (EntityReference *)moniker1 {
    return (EntityReference *)self.parameters[@"Moniker1"];
}

- (void)setMoniker1:(EntityReference *)moniker1 {
    self.parameters[@"Moniker1"] = moniker1;
}

- (EntityReference *)moniker2 {
    return (EntityReference *)self.parameters[@"Moniker2"];
}

- (void)setMoniker2:(EntityReference *)moniker2 {
    self.parameters[@"Moniker2"] = moniker2;
}

- (NSString *)relationshipName {
    return (NSString *)self.parameters[@"RelationshipName"];
}

- (void)setRelationshipName:(NSString *)relationshipName {
    self.parameters[@"RelationshipName"] = relationshipName;
}

- (NSString *)requestName {
    return @"DisassociateEntities";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation LockInvoicePricingRequest

- (NSUUID *)invoiceId {
    return (NSUUID *)self.parameters[@"InvoiceId"];
}

- (void)setInvoiceId:(NSUUID *)invoiceId {
    self.parameters[@"InvoiceId"] = invoiceId;
}

- (NSString *)requestName {
    return @"LockInvoicePricing";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation LockSalesOrderPricingRequest

- (NSUUID *)salesOrderId {
    return (NSUUID *)self.parameters[@"SalesOrderId"];
}

- (void)setSalesOrderId:(NSUUID *)salesOrderId {
    self.parameters[@"SalesOrderId"] = salesOrderId;
}

- (NSString *)requestName {
    return @"LockSalesOrderPricing";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation LoseOpportunityRequest

- (Entity *)opportunityClose {
    return (Entity *)self.parameters[@"OpportunityClose"];
}

- (void)setOpportunityClose:(Entity *)opportunityClose {
    self.parameters[@"OpportunityClose"] = opportunityClose;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"LoseOpportunity";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation MergeRequest

- (EntityReference *)target {
    return (EntityReference *)self.parameters[@"Target"];
}

- (void)setTarget:(EntityReference *)target {
    self.parameters[@"Target"] = target;
}

- (NSUUID *)subordinateId {
    return (NSUUID *)self.parameters[@"SubordinateId"];
}

- (void)setSubordinateId:(NSUUID *)subordinateId {
    self.parameters[@"SubordinateId"] = subordinateId;
}

- (Entity *)updateContent {
    return (Entity *)self.parameters[@"UpdateContent"];
}

- (void)setUpdateContent:(Entity *)updateContent {
    self.parameters[@"UpdateContent"] = updateContent;
}

- (CRMBoolean *)performParentingChecks {
    return (CRMBoolean *)self.parameters[@"PerformParentingChecks"];
}

- (void)setPerformParentingChecks:(CRMBoolean *)performParentingChecks {
    self.parameters[@"PerformParentingChecks"] = performParentingChecks;
}

- (NSString *)requestName {
    return @"Merge";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation PickFromQueueRequest

- (NSUUID *)queueItemId {
    return (NSUUID *)self.parameters[@"QueueItemId"];
}

- (void)setQueueItemId:(NSUUID *)queueItemId {
    self.parameters[@"QueueItemId"] = queueItemId;
}

- (NSUUID *)workerId {
    return (NSUUID *)self.parameters[@"WorkerId"];
}

- (void)setWorkerId:(NSUUID *)workerId {
    self.parameters[@"WorkerId"] = workerId;
}

- (CRMBoolean *)removeQueueItem {
    return (CRMBoolean *)self.parameters[@"RemoveQueueItem"];
}

- (void)setRemoveQueueItem:(CRMBoolean *)removeQueueItem {
    self.parameters[@"RemoveQueueItem"] = removeQueueItem;
}

- (NSString *)requestName {
    return @"PickFromQueue";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation QualifyLeadRequest

- (EntityReference *)leadId {
    return (EntityReference *)self.parameters[@"LeadId"];
}

- (void)setLeadId:(EntityReference *)leadId {
    self.parameters[@"LeadId"] = leadId;
}

- (CRMBoolean *)createAccount {
    return (CRMBoolean *)self.parameters[@"CreateAccount"];
}

- (void)setCreateAccount:(CRMBoolean *)createAccount {
    self.parameters[@"CreateAccount"] = createAccount;
}

- (CRMBoolean *)createContact {
    return (CRMBoolean *)self.parameters[@"CreateContact"];
}

- (void)setCreateContact:(CRMBoolean *)createContact {
    self.parameters[@"CreateContact"] = createContact;
}

- (CRMBoolean *)createOpportunity {
    return (CRMBoolean *)self.parameters[@"CreateOpportunity"];
}

- (void)setCreateOpportunity:(CRMBoolean *)createOpportunity {
    self.parameters[@"CreateOpportunity"] = createOpportunity;
}

- (EntityReference *)opportunityCurrencyId {
    return (EntityReference *)self.parameters[@"OpportunityCurrencyId"];
}

- (void)setOpportunityCurrencyId:(EntityReference *)opportunityCurrencyId {
    self.parameters[@"OpportunityCurrencyId"] = opportunityCurrencyId;
}

- (EntityReference *)opportunityCustomerId {
    return (EntityReference *)self.parameters[@"OpportunityCustomerId"];
}

- (void)setOpportunityCustomerId:(EntityReference *)opportunityCustomerId {
    self.parameters[@"OpportunityCustomerId"] = opportunityCustomerId;
}

- (EntityReference *)sourceCampaignId {
    return (EntityReference *)self.parameters[@"SourceCampaignId"];
}

- (void)setSourceCampaignId:(EntityReference *)sourceCampaignId {
    self.parameters[@"SourceCampaignId"] = sourceCampaignId;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"QualifyLead";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RecalculateRequest

- (EntityReference *)target {
    return (EntityReference *)self.parameters[@"Target"];
}

- (void)setTarget:(EntityReference *)target {
    self.parameters[@"Target"] = target;
}

- (NSString *)requestName {
    return @"Recalculate";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation ReleaseToQueueRequest

- (NSUUID *)queueItemId {
    return (NSUUID *)self.parameters[@"QueueItemId"];
}

- (void)setQueueItemId:(NSUUID *)queueItemId {
    self.parameters[@"QueueItemId"] = queueItemId;
}

- (NSString *)requestName {
    return @"ReleaseToQueue";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RemoveFromQueueRequest

- (NSUUID *)queueItemId {
    return (NSUUID *)self.parameters[@"QueueItemId"];
}

- (void)setQueueItemId:(NSUUID *)queueItemId {
    self.parameters[@"QueueItemId"] = queueItemId;
}

- (NSString *)requestName {
    return @"RemoveFromQueue";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RemoveItemCampaignRequest

- (NSUUID *)campaignId {
    return (NSUUID *)self.parameters[@"CampaignId"];
}

- (void)setCampaignId:(NSUUID *)campaignId {
    self.parameters[@"CampaignId"] = campaignId;
}

- (NSUUID *)entityId {
    return (NSUUID *)self.parameters[@"EntityId"];
}

- (void)setEntityId:(NSUUID *)entityId {
    self.parameters[@"EntityId"] = entityId;
}

- (NSString *)requestName {
    return @"RemoveItemCampaign";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RemoveMemberListRequest

- (NSUUID *)listId {
    return (NSUUID *)self.parameters[@"ListId"];
}

- (void)setListId:(NSUUID *)listId {
    self.parameters[@"ListId"] = listId;
}

- (NSUUID *)entityId {
    return (NSUUID *)self.parameters[@"EntityId"];
}

- (void)setEntityId:(NSUUID *)entityId {
    self.parameters[@"EntityId"] = entityId;
}

- (NSString *)requestName {
    return @"RemoveMemberList";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RemovePrivilegeRoleRequest

- (NSUUID *)roleId {
    return (NSUUID *)self.parameters[@"RoleId"];
}

- (void)setRoleId:(NSUUID *)roleId {
    self.parameters[@"RoleId"] = roleId;
}

- (NSUUID *)privilegeId {
    return (NSUUID *)self.parameters[@"PrivilegeId"];
}

- (void)setPrivilegeId:(NSUUID *)privilegeId {
    self.parameters[@"PrivilegeId"] = privilegeId;
}

- (NSString *)requestName {
    return @"RemovePrivilegeRole";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RemoveRelatedRequest

- (NSArray *)target {
    return (NSArray *)self.parameters[@"Target"];
}

- (void)setTarget:(NSArray *)target {
    self.parameters[@"Target"] = target;
}

- (NSString *)requestName {
    return @"RemoveRelated";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation ReplacePrivilegesRoleRequest

- (NSUUID *)roleId {
    return (NSUUID *)self.parameters[@"RoleId"];
}

- (void)setRoleId:(NSUUID *)roleId {
    self.parameters[@"RoleId"] = roleId;
}

- (NSArray *)privileges {
    return (NSArray *)self.parameters[@"Privileges"];
}

- (void)setPrivileges:(NSArray *)privileges {
    self.parameters[@"Privileges"] = privileges;
}

- (NSString *)requestName {
    return @"ReplacePrivilegesRole";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RescheduleRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (CRMBoolean *)returnNotifications {
    return (CRMBoolean *)self.parameters[@"ReturnNotifications"];
}

- (void)setReturnNotifications:(CRMBoolean *)returnNotifications {
    self.parameters[@"ReturnNotifications"] = returnNotifications;
}

- (NSString *)requestName {
    return @"Reschedule";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RetrieveUserQueuesRequest

- (NSUUID *)userId {
    return (NSUUID *)self.parameters[@"UserId"];
}

- (void)setUserId:(NSUUID *)userId {
    self.parameters[@"UserId"] = userId;
}

- (CRMBoolean *)includePublic {
    return (CRMBoolean *)self.parameters[@"IncludePublic"];
}

- (void)setIncludePublic:(CRMBoolean *)includePublic {
    self.parameters[@"IncludePublic"] = includePublic;
}

- (NSString *)requestName {
    return @"RetrieveUserQueues";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation RouteToRequest

- (EntityReference *)target {
    return (EntityReference *)self.parameters[@"Target"];
}

- (void)setTarget:(EntityReference *)target {
    self.parameters[@"Target"] = target;
}

- (NSUUID *)queueItemId {
    return (NSUUID *)self.parameters[@"QueueItemId"];
}

- (void)setQueueItemId:(NSUUID *)queueItemId {
    self.parameters[@"QueueItemId"] = queueItemId;
}

- (NSString *)requestName {
    return @"RouteTo";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation SendEmailRequest

- (NSUUID *)emailId {
    return (NSUUID *)self.parameters[@"EmailId"];
}

- (void)setEmailId:(NSUUID *)emailId {
    self.parameters[@"EmailId"] = emailId;
}

- (CRMBoolean *)issueSend {
    return (CRMBoolean *)self.parameters[@"IssueSend"];
}

- (void)setIssueSend:(CRMBoolean *)issueSend {
    self.parameters[@"IssueSend"] = issueSend;
}

- (NSString *)trackingToken {
    return (NSString *)self.parameters[@"TrackingToken"];
}

- (void)setTrackingToken:(NSString *)trackingToken {
    self.parameters[@"TrackingToken"] = trackingToken;
}

- (NSString *)requestName {
    return @"SendEmail";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation SendFaxRequest

- (NSUUID *)faxId {
    return (NSUUID *)self.parameters[@"FaxId"];
}

- (void)setFaxId:(NSUUID *)faxId {
    self.parameters[@"FaxId"] = faxId;
}

- (CRMBoolean *)issueSend {
    return (CRMBoolean *)self.parameters[@"IssueSend"];
}

- (void)setIssueSend:(CRMBoolean *)issueSend {
    self.parameters[@"IssueSend"] = issueSend;
}

- (NSString *)requestName {
    return @"SendFax";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation SetRelatedRequest

- (NSArray *)target {
    return (NSArray *)self.parameters[@"Target"];
}

- (void)setTarget:(NSArray *)target {
    self.parameters[@"Target"] = target;
}

- (NSString *)requestName {
    return @"SetRelated";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation SetStateRequest

- (EntityReference *)entityMoniker {
    return (EntityReference *)self.parameters[@"EntityMoniker"];
}

- (void)setEntityMoniker:(EntityReference *)entityMoniker {
    self.parameters[@"EntityMoniker"] = entityMoniker;
}

- (OptionSetValue *)state {
    return (OptionSetValue *)self.parameters[@"State"];
}

- (void)setState:(OptionSetValue *)state {
    self.parameters[@"State"] = state;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"SetState";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation ValidateRecurrenceRuleRequest

- (Entity *)target {
    return (Entity *)self.parameters[@"Target"];
}

- (void)setTarget:(Entity *)target {
    self.parameters[@"Target"] = target;
}

- (NSString *)requestName {
    return @"ValidateRecurrenceRule";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation WinOpportunityRequest

- (Entity *)opportunityClose {
    return (Entity *)self.parameters[@"OpportunityClose"];
}

- (void)setOpportunityClose:(Entity *)opportunityClose {
    self.parameters[@"OpportunityClose"] = opportunityClose;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"WinOpportunity";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


@implementation WinQuoteRequest

- (Entity *)quoteClose {
    return (Entity *)self.parameters[@"QuoteClose"];
}

- (void)setQuoteClose:(Entity *)quoteClose {
    self.parameters[@"QuoteClose"] = quoteClose;
}

- (OptionSetValue *)status {
    return (OptionSetValue *)self.parameters[@"Status"];
}

- (void)setStatus:(OptionSetValue *)status {
    self.parameters[@"Status"] = status;
}

- (NSString *)requestName {
    return @"WinQuote";
}

- (void)setRequestName:(NSString *)requestName {
    [NSException raise:@"Cannot modify Request Name"
                format:@"Cannot modify the Request Name of a type derived from OrganizationRequest."];
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end

