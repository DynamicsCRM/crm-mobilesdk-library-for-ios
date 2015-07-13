//  Requests.h

#import <Foundation/Foundation.h>
#import "OrganizationRequest.h"
#import "Entity.h"
#import "EntityCollection.h"
#import "OptionSetValue.h"
#import "RelationshipQueryCollection.h"
#import "QueryBase.h"
#import "CRMBoolean.h"
#import "CRMInteger.h"
#import "ColumnSet.h"


@interface CreateRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;

@end


@interface UpdateRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;

@end


@interface DeleteRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *target;

@end


@interface RetrieveRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *target;
@property (nonatomic, strong) ColumnSet *columnSet;
@property (nonatomic, strong) RelationshipQueryCollection *relatedEntitiesQuery;

@end


@interface RetrieveMultipleRequest : OrganizationRequest

@property (nonatomic, strong) QueryBase *query;

@end


@interface AddItemCampaignRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *campaignId;
@property (nonatomic, strong) NSUUID *entityId;
@property (nonatomic, strong) NSString *entityName;

@end


@interface AddListMembersListRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *listId;
@property (nonatomic, strong) NSArray *memberIds;

@end


@interface AddMemberListRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *listId;
@property (nonatomic, strong) NSUUID *entityId;

@end


@interface AddPrincipalToQueueRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *queueId;
@property (nonatomic, strong) Entity *principal;

@end


@interface AddProductToKitRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *kitId;
@property (nonatomic, strong) NSUUID *productId;

@end


@interface AddRecurrenceRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;
@property (nonatomic, strong) NSUUID *appointmentId;

@end


@interface AddToQueueRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *target;
@property (nonatomic, strong) NSUUID *sourceQueueId;
@property (nonatomic, strong) NSUUID *destinationQueueId;
@property (nonatomic, strong) Entity *queueItemProperties;

@end


@interface AssignRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *target;
@property (nonatomic, strong) EntityReference *assignee;

@end


@interface AssociateEntitiesRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *moniker1;
@property (nonatomic, strong) EntityReference *moniker2;
@property (nonatomic, strong) NSString *relationshipName;

@end


@interface BackgroundSendEmailRequest : OrganizationRequest

@property (nonatomic, strong) QueryBase *query;

@end


@interface BookRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;
@property (nonatomic, strong) CRMBoolean *returnNotifications;

@end


@interface CancelContractRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *contractId;
@property (nonatomic, strong) NSDate *cancelDate;
@property (nonatomic, strong) OptionSetValue *status;

@end


@interface CancelSalesOrderRequest : OrganizationRequest

@property (nonatomic, strong) Entity *orderClose;
@property (nonatomic, strong) OptionSetValue *status;

@end


@interface CheckIncomingEmailRequest : OrganizationRequest

@property (nonatomic, strong) NSString *messageId;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *to;
@property (nonatomic, strong) NSString *cc;
@property (nonatomic, strong) NSString *bcc;
@property (nonatomic, strong) Entity *extraProperties;

@end


@interface CheckPromoteEmailRequest : OrganizationRequest

@property (nonatomic, strong) NSString *messageId;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) CRMInteger *directionCode;

@end


@interface CloneContractRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *contractId;
@property (nonatomic, strong) CRMBoolean *includeCanceledLines;

@end


@interface CloseIncidentRequest : OrganizationRequest

@property (nonatomic, strong) Entity *incidentResolution;
@property (nonatomic, strong) OptionSetValue *status;

@end


@interface CloseQuoteRequest : OrganizationRequest

@property (nonatomic, strong) Entity *quoteClose;
@property (nonatomic, strong) OptionSetValue *status;

@end


@interface CopyDynamicListToStaticRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *listId;

@end


@interface CreateExceptionRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;
@property (nonatomic, strong) NSDate *originalStartDate;
@property (nonatomic, strong) CRMBoolean *isDeleted;

@end


@interface CreateInstanceRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;
@property (nonatomic, strong) CRMInteger *count;

@end


@interface DeleteOpenInstancesRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;
@property (nonatomic, strong) NSDate *seriesEndDate;
@property (nonatomic, strong) CRMInteger *stateOfPastInstances;

@end


@interface DeliverIncomingEmailRequest : OrganizationRequest

@property (nonatomic, strong) NSString *messageId;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *to;
@property (nonatomic, strong) NSString *cc;
@property (nonatomic, strong) NSString *bcc;
@property (nonatomic, strong) NSDate *receivedOn;
@property (nonatomic, strong) NSString *submittedBy;
@property (nonatomic, strong) NSString *importance;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) EntityCollection *attachments;
@property (nonatomic, strong) Entity *extraProperties;
@property (nonatomic, strong) CRMBoolean *validateBeforeCreate;

@end


@interface DeliverPromoteEmailRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *emailId;
@property (nonatomic, strong) NSString *messageId;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *to;
@property (nonatomic, strong) NSString *cc;
@property (nonatomic, strong) NSString *bcc;
@property (nonatomic, strong) NSDate *receivedOn;
@property (nonatomic, strong) NSString *submittedBy;
@property (nonatomic, strong) NSString *importance;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) EntityCollection *attachments;
@property (nonatomic, strong) Entity *extraProperties;

@end


@interface DisassociateEntitiesRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *moniker1;
@property (nonatomic, strong) EntityReference *moniker2;
@property (nonatomic, strong) NSString *relationshipName;

@end


@interface LockInvoicePricingRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *invoiceId;

@end


@interface LockSalesOrderPricingRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *salesOrderId;

@end


@interface LoseOpportunityRequest : OrganizationRequest

@property (nonatomic, strong) Entity *opportunityClose;
@property (nonatomic, strong) OptionSetValue *status;

@end


@interface MergeRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *target;
@property (nonatomic, strong) NSUUID *subordinateId;
@property (nonatomic, strong) Entity *updateContent;
@property (nonatomic, strong) CRMBoolean *performParentingChecks;

@end


@interface PickFromQueueRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *queueItemId;
@property (nonatomic, strong) NSUUID *workerId;
@property (nonatomic, strong) CRMBoolean *removeQueueItem;

@end


@interface QualifyLeadRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *leadId;
@property (nonatomic, strong) CRMBoolean *createAccount;
@property (nonatomic, strong) CRMBoolean *createContact;
@property (nonatomic, strong) CRMBoolean *createOpportunity;
@property (nonatomic, strong) EntityReference *opportunityCurrencyId;
@property (nonatomic, strong) EntityReference *opportunityCustomerId;
@property (nonatomic, strong) EntityReference *sourceCampaignId;
@property (nonatomic, strong) OptionSetValue *status;

@end


@interface RecalculateRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *target;

@end


@interface ReleaseToQueueRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *queueItemId;

@end


@interface RemoveFromQueueRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *queueItemId;

@end


@interface RemoveItemCampaignRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *campaignId;
@property (nonatomic, strong) NSUUID *entityId;

@end


@interface RemoveMemberListRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *listId;
@property (nonatomic, strong) NSUUID *entityId;

@end


@interface RemovePrivilegeRoleRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *roleId;
@property (nonatomic, strong) NSUUID *privilegeId;

@end


@interface RemoveRelatedRequest : OrganizationRequest

@property (nonatomic, strong) NSArray *target;

@end


@interface ReplacePrivilegesRoleRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *roleId;
@property (nonatomic, strong) NSArray *privileges;

@end


@interface RescheduleRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;
@property (nonatomic, strong) CRMBoolean *returnNotifications;

@end


@interface RetrieveUserQueuesRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *userId;
@property (nonatomic, strong) CRMBoolean *includePublic;

@end


@interface RouteToRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *target;
@property (nonatomic, strong) NSUUID *queueItemId;

@end


@interface SendEmailRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *emailId;
@property (nonatomic, strong) CRMBoolean *issueSend;
@property (nonatomic, strong) NSString *trackingToken;

@end


@interface SendFaxRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *faxId;
@property (nonatomic, strong) CRMBoolean *issueSend;

@end


@interface SetRelatedRequest : OrganizationRequest

@property (nonatomic, strong) NSArray *target;

@end


@interface SetStateRequest : OrganizationRequest

@property (nonatomic, strong) EntityReference *entityMoniker;
@property (nonatomic, strong) OptionSetValue *state;
@property (nonatomic, strong) OptionSetValue *status;

@end


@interface ValidateRecurrenceRuleRequest : OrganizationRequest

@property (nonatomic, strong) Entity *target;

@end


@interface WinOpportunityRequest : OrganizationRequest

@property (nonatomic, strong) Entity *opportunityClose;
@property (nonatomic, strong) OptionSetValue *status;

@end


@interface WinQuoteRequest : OrganizationRequest

@property (nonatomic, strong) Entity *quoteClose;
@property (nonatomic, strong) OptionSetValue *status;

@end

