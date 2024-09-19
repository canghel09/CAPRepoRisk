namespace riskmanagement;

entity Risks : managed
{
    key ID : UUID;
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    mitigations : Association to one Mitigations;
}

entity Mitigations : managed
{
    key ID : UUID;
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.mitigations = $self;
}

aspect managed
{
    createdAt : Date;
    createdBy : String(100);
    modifiedAt : Date;
    modifiedBy : String(100);
}
