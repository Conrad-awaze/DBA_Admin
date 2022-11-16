CREATE view [dbo].[VwGetFundingForDiscountAll] with schemabinding
as       
SELECT 
    f.Id,
    f.Percentage,
    f.DiscountId,
    f.FundeeId,
    fc.CodeId AS 'FundingCategoryCodeId'
                
FROM dbo.hos_Funding f 
JOIN dbo.hos_FundingCategory fc  ON f.FundingCategoryId = fc.Id