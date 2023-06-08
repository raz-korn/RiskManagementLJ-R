using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { RiskManagementLJ as my } from '../db/schema';

using RiskManagementLJ from '../db/schema';

@path : 'service/RiskManagementLJ'
service RiskManagementLJService
{
    annotate mitigation with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    annotate risks with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    @odata.draft.enabled
    entity risks as
        projection on my.Risks;

    @odata.draft.enabled
    entity mitigation as
        projection on my.Mitigations;

    entity A_Supplier as projection on BusinessPartnerA2X.A_BusinessPartner
    {
        BusinessPartner,
        BusinessPartnerFullName,
        BusinessPartnerIsBlocked
    };
}

annotate RiskManagementLJService with @requires :
[
    'authenticated-user',
    'RiskViewer'
];
