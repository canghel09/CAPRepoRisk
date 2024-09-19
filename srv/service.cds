using { riskmanagement as my } from '../db/schema.cds';

@path : '/service/riskmanagementService'
service riskmanagementService
{
    annotate Mitigations with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    annotate Risks with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    entity Risks as
        projection on my.Risks;

    entity Mitigations as
        projection on my.Mitigations;
}

annotate riskmanagementService with @requires :
[
    'any',
    'RiskViewer',
    'RiskManager'
];
