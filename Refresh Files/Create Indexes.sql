IF NOT EXISTS (select name from sys.indexes where name = 'IX_Cat_Includes')
BEGIN
CREATE INDEX [IX_Cat_Includes] ON [dbo].[thg_CMSBandAssignment] ([Cat]) INCLUDE (
    [CMSBand_Id]
    ,[Link_Id]
    )
    WITH (
            FILLFACTOR = 80
            ,ONLINE = OFF
            ,SORT_IN_TEMPDB = OFF
            ,DATA_COMPRESSION = NONE
            );
END
            
IF NOT EXISTS(select name from sys.indexes where name = 'IX_Hierarchy_Id_Service_Active_Service_WebSell_Includes')
BEGIN
CREATE INDEX [IX_Hierarchy_Id_Service_Active_Service_WebSell_Includes] ON [dbo].[thg_SalesHierarchyUnitCache] (
    [Hierarchy_Id]
    ,[Service_Active]
    ,[Service_WebSell]
    ) INCLUDE (
    [Unit_Id]
    ,[Unit_Start]
    ,[Unit_Finish]
    ,[Unit_BedBank]
    ,[Contract_Id]
    ,[Service_Id]
    ,[Service_LeadTime]
    ,[Supplier_Id]
    ,[Supplier_BookingConfirm]
    ,[OverrideProfileILT]
    ,[Service_RoundingTime]
    ,[LeadTimeOverride]
    )
    WITH (
            FILLFACTOR = 80
            ,ONLINE = OFF
            ,SORT_IN_TEMPDB = OFF
            ,DATA_COMPRESSION = NONE
            );
END
            
IF NOT EXISTS(select name from sys.indexes where name = 'IDXC_QuoteID_SID')
BEGIN
CREATE NONCLUSTERED INDEX [IDXC_QuoteID_SID] ON [dbo].[Booking]
(
    [QuoteID] ASC,
    [SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            
END
            
IF NOT EXISTS(select name from sys.indexes where name = 'IX_Booking_QuoteID')
BEGIN
CREATE NONCLUSTERED INDEX [IX_Booking_QuoteID] ON [dbo].[Booking]
(
    [QuoteID] ASC
)
INCLUDE ( 	[SID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
            
IF NOT EXISTS(select name from sys.indexes where name = 'idx_Hosautopricingoffers_active_incid_service_start_nights')
BEGIN
CREATE NONCLUSTERED INDEX idx_Hosautopricingoffers_active_incid_service_start_nights
ON [dbo].[hosautopricingoffers] ([IsActive])
INCLUDE ([ID],[serviceID],[start],[nights])
END
            
IF NOT EXISTS(select name from sys.indexes where name = 'idx_hos_discountrulegroup_rulegroupid_inc_discountid')
BEGIN	
CREATE NONCLUSTERED INDEX idx_hos_discountrulegroup_rulegroupid_inc_discountid
ON [dbo].[hos_DiscountRuleGroup] ([RuleGroupId])
INCLUDE ([DiscountId])
END
            
IF NOT EXISTS(select name from sys.indexes where name = 'idx_thg_insuranceruleinsuranceprice_type_inc_nights_band_price')
BEGIN
CREATE NONCLUSTERED INDEX idx_thg_insuranceruleinsuranceprice_type_inc_nights_band_price
ON [dbo].[thg_InsuranceRuleInsurancePrice] ([Type])
INCLUDE ([InsuranceRuleInsurance_Id],[NightsFrom],[NightsTo],[BandFrom],[BandTo],[Price])
END
            
IF NOT EXISTS(select name from sys.indexes where name = 'ix_thg_SalesHierarchyUnitCache_Hierarchy_Id_Service_Active_Service_WebSell_includes')
BEGIN
CREATE INDEX [ix_thg_SalesHierarchyUnitCache_Hierarchy_Id_Service_Active_Service_WebSell_includes] ON [dbo].[thg_SalesHierarchyUnitCache] 
    ([Hierarchy_Id], [Service_Active], [Service_WebSell])  
    INCLUDE ([Unit_Id]
        , [Unit_Start]
        , [Unit_Finish]
        , [Unit_BedBank]
        , [Contract_Id]
        , [Service_Id]
        , [Service_LeadTime]
        , [Supplier_Id]
        , [Supplier_BookingConfirm]
        , [ProductGroup_Id]
        , [BookingFeeRule_Id]
        , [DiscountPolicy_Id]
        , [OverrideProfileILT]
        , [Service_RoundingTime]
        , [LeadTimeOverride]) 
    WITH 	(
            FILLFACTOR = 80
            ,ONLINE = OFF
            ,SORT_IN_TEMPDB = OFF
            ,DATA_COMPRESSION = NONE
        );
END
            
IF NOT EXISTS(select name from sys.indexes where name = 'ix_thg_SalesHierarchyUnitCache_Hierarchy_Id_Service_Active_Service_WebSell_includes')
BEGIN
CREATE INDEX [ix_thg_SalesHierarchyUnitCache_Hierarchy_Id_Service_Active_Service_WebSell_includes] ON [dbo].[thg_SalesHierarchyUnitCache] 
    ([Hierarchy_Id], [Service_Active], [Service_WebSell])  
    INCLUDE ([Unit_Id]
        , [Unit_Start]
        , [Unit_Finish]
        , [Unit_BedBank]
        , [Contract_Id]
        , [Service_Id]
        , [Service_LeadTime]
        , [Supplier_BookingConfirm]
        , [OverrideProfileILT]
        , [Service_RoundingTime]
        , [LeadTimeOverride]) 
    WITH 	(
            FILLFACTOR = 80
            ,ONLINE = OFF
            ,SORT_IN_TEMPDB = OFF
            ,DATA_COMPRESSION = NONE
        );
END