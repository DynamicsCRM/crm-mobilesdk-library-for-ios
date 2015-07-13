//  Responses.h

#import <Foundation/Foundation.h>
#import "OrganizationResponse.h"
#import "Entity.h"
#import "EntityCollection.h"
#import "EntityReferenceCollection.h"
#import "ValidationResult.h"
#import "CRMBoolean.h"
#import "CRMInteger.h"


@interface CreateResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *id;

@end


@interface UpdateResponse : OrganizationResponse


@end


@interface DeleteResponse : OrganizationResponse


@end


@interface RetrieveResponse : OrganizationResponse

@property (nonatomic, strong) Entity *entity;

@end


@interface RetrieveMultipleResponse : OrganizationResponse

@property (nonatomic, strong) EntityCollection *entityCollection;

@end


@interface AddItemCampaignResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *campaignItemId;

@end


@interface AddListMembersListResponse : OrganizationResponse


@end


@interface AddMemberListResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *id;

@end


@interface AddPrincipalToQueueResponse : OrganizationResponse


@end


@interface AddProductToKitResponse : OrganizationResponse


@end


@interface AddRecurrenceResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *id;

@end


@interface AddToQueueResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *queueItemId;

@end


@interface AssignResponse : OrganizationResponse


@end


@interface AssociateEntitiesResponse : OrganizationResponse


@end


@interface BackgroundSendEmailResponse : OrganizationResponse

@property (nonatomic, strong) EntityCollection *entityCollection;
@property (nonatomic, strong) NSArray *hasAttachments;

@end


@interface BookResponse : OrganizationResponse

@property (nonatomic, strong) ValidationResult *validationResult;
@property (nonatomic, strong) NSObject *notifications;

@end


@interface CancelContractResponse : OrganizationResponse


@end


@interface CancelSalesOrderResponse : OrganizationResponse


@end


@interface CheckIncomingEmailResponse : OrganizationResponse

@property (nonatomic, strong) CRMBoolean *shouldDeliver;
@property (nonatomic, strong) CRMInteger *reasonCode;

@end


@interface CheckPromoteEmailResponse : OrganizationResponse

@property (nonatomic, strong) CRMBoolean *shouldPromote;
@property (nonatomic, strong) CRMInteger *reasonCode;

@end


@interface CloneContractResponse : OrganizationResponse

@property (nonatomic, strong) Entity *entity;

@end


@interface CloseIncidentResponse : OrganizationResponse


@end


@interface CloseQuoteResponse : OrganizationResponse


@end


@interface CopyDynamicListToStaticResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *staticListId;

@end


@interface CreateExceptionResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *id;

@end


@interface CreateInstanceResponse : OrganizationResponse

@property (nonatomic, strong) CRMBoolean *seriesCanBeExpanded;

@end


@interface DeleteOpenInstancesResponse : OrganizationResponse


@end


@interface DeliverIncomingEmailResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *emailId;

@end


@interface DeliverPromoteEmailResponse : OrganizationResponse

@property (nonatomic, strong) NSUUID *emailId;

@end


@interface DisassociateEntitiesResponse : OrganizationResponse


@end


@interface LockInvoicePricingResponse : OrganizationResponse


@end


@interface LockSalesOrderPricingResponse : OrganizationResponse


@end


@interface LoseOpportunityResponse : OrganizationResponse


@end


@interface MergeResponse : OrganizationResponse


@end


@interface PickFromQueueResponse : OrganizationResponse


@end


@interface QualifyLeadResponse : OrganizationResponse

@property (nonatomic, strong) EntityReferenceCollection *createdEntities;

@end


@interface RecalculateResponse : OrganizationResponse


@end


@interface ReleaseToQueueResponse : OrganizationResponse


@end


@interface RemoveFromQueueResponse : OrganizationResponse


@end


@interface RemoveItemCampaignResponse : OrganizationResponse


@end


@interface RemoveMemberListResponse : OrganizationResponse


@end


@interface RemovePrivilegeRoleResponse : OrganizationResponse


@end


@interface RemoveRelatedResponse : OrganizationResponse


@end


@interface ReplacePrivilegesRoleResponse : OrganizationResponse


@end


@interface RescheduleResponse : OrganizationResponse

@property (nonatomic, strong) ValidationResult *validationResult;
@property (nonatomic, strong) NSObject *notifications;

@end


@interface RetrieveUserQueuesResponse : OrganizationResponse

@property (nonatomic, strong) EntityCollection *entityCollection;

@end


@interface RouteToResponse : OrganizationResponse


@end


@interface SendEmailResponse : OrganizationResponse

@property (nonatomic, strong) NSString *subject;

@end


@interface SendFaxResponse : OrganizationResponse


@end


@interface SetRelatedResponse : OrganizationResponse


@end


@interface SetStateResponse : OrganizationResponse


@end


@interface ValidateRecurrenceRuleResponse : OrganizationResponse

@property (nonatomic, strong) NSString *description;

@end


@interface WinOpportunityResponse : OrganizationResponse


@end


@interface WinQuoteResponse : OrganizationResponse


@end

