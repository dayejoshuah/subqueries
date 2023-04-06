CREATE VIEW   vwGLTrans
 --This views contains all information needed to create our financial statement 
 AS
SELECT 
    --FactGLTran
    gl.FactGLTranID,
    gl.GLTranAmount,
    gl.JournalID,
    gl.GLTranDescription,
    gl.GLTranDate,

    --GL accounts 
    acc.AlternateKey as 'GLAccNum',
    acc.GLAcctName, 
    acc.Statement,
    acc.Category,
    acc.Subcategory,

    --stores
    sto.AlternateKey as 'StoreNum',
    sto.StoreName,
    sto.ManagerID,
    sto.PreviousManagerID,
    sto.ContactTel,
    sto.AddressLine1,
    sto.AddressLine2,
    sto.ZipCode,

    --Region
    reg.AlternateKey as 'RegionNum',
    reg.RegionName,
    reg.SalesRegionName,

    --Last Refresh Date
    CONVERT(DATETIME, GETDATE()  AT TIME ZONE 'UTC' AT TIME ZONE 'Central Standard Time') AS LastRefreshTime

FROM FactGLTran as GL
    INNER join dimGLAcct as acc on gl.GLAcctID = acc.GLAcctID  
    INNER JOIN dimStore as sto on gl.StoreID = sto.StoreID
    INNER JOIN dimRegion as reg on sto.RegionID = reg.RegionID
GO

NOTEPAD++