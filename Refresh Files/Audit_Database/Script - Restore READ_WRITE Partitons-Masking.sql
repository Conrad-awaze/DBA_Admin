RESTORE DATABASE [TR4_Audit]
    FILEGROUP = 'PRIMARY', 
    FILEGROUP = 'Audit_2015', 
    --FILEGROUP = 'Audit_2016', 
    --FILEGROUP = 'Audit_2017', 
    --FILEGROUP = 'Audit_2018', 
    --FILEGROUP = 'Audit_2019', 
    --FILEGROUP = 'Audit_2020', 
    --FILEGROUP = 'Audit_2021', 
    FILEGROUP = 'Audit_2022', 
    FILEGROUP = 'Audit_2023', 
    FILEGROUP = 'Audit_2024', 
    FILEGROUP = 'Audit_2025', 
    FILEGROUP = 'Audit_2026', 
    FILEGROUP = 'Audit_2027', 
    FILEGROUP = 'Audit_2028', 
    FILEGROUP = 'Audit_2029', 
    FILEGROUP = 'Audit_2030'

    FROM DISK = N'\\backups_fsx_TRAV\SQL_Backups_Traveller\TRAVELLERSQLCL\TR4_Audit\FULL_PARTIAL\TR4_Audit_FULL_PARTIAL_20221111_210002.bak'

WITH

    MOVE 'TR4_Audit_log' to 'H:\SQLTLogs\TR4_Audit_Masking log.ldf',
    MOVE 'TR4_Audit' TO N'G:\SQLData\TR4_Audit_Masking.mdf',
    move 'Audit_2015' to 'G:\SQLData\TR4_Audit_Masking 2015.ndf',
    --move 'Audit_2016' to 'G:\SQLData\TR4_Audit_Masking 2016.ndf',
    --move 'Audit_2017' to 'G:\SQLData\TR4_Audit_Masking 2017.ndf',
    --move 'Audit_2018' to 'G:\SQLData\TR4_Audit_Masking 2018.ndf',
    --move 'Audit_2019' to 'G:\SQLData\TR4_Audit_Masking 2019.ndf',
    --move 'Audit_2020' to 'G:\SQLData\TR4_Audit_Masking 2020.ndf',
    --move 'Audit_2021' to 'G:\SQLData\TR4_Audit_Masking 2021.ndf',
    move 'Audit_2022' to 'G:\SQLData\TR4_Audit_Masking 2022.ndf',
    move 'Audit_2023' to 'G:\SQLData\TR4_Audit_Masking 2023.ndf',
    move 'Audit_2024' to 'G:\SQLData\TR4_Audit_Masking 2024.ndf',
    move 'Audit_2025' to 'G:\SQLData\TR4_Audit_Masking 2025.ndf',
    move 'Audit_2026' to 'G:\SQLData\TR4_Audit_Masking 2026.ndf',
    move 'Audit_2027' to 'G:\SQLData\TR4_Audit_Masking 2027.ndf',
    move 'Audit_2028' to 'G:\SQLData\TR4_Audit_Masking 2028.ndf',
    move 'Audit_2029' to 'G:\SQLData\TR4_Audit_Masking 2029.ndf',
    move 'Audit_2030' to 'G:\SQLData\TR4_Audit_Masking 2030.ndf',

PARTIAL, REPLACE, NORECOVERY, stats = 5
