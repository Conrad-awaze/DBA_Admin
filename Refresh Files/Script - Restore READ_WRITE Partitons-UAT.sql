RESTORE DATABASE [TR4_Audit_UAT]
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
            MOVE 'TR4_Audit_log' to 'H:\SQLTLog\TR4_Audit_UAT log.ldf',
            MOVE 'TR4_Audit' TO N'H:\SQLData\TR4_Audit_UAT.mdf',
            move 'Audit_2015' to 'H:\SQLData\TR4_Audit_UAT 2015.ndf',
            --move 'Audit_2016' to 'H:\SQLData\TR4_Audit_UAT 2016.ndf',
            --move 'Audit_2017' to 'H:\SQLData\TR4_Audit_UAT 2017.ndf',
            --move 'Audit_2018' to 'H:\SQLData\TR4_Audit_UAT 2018.ndf',
            --move 'Audit_2019' to 'H:\SQLData\TR4_Audit_UAT 2019.ndf',
            --move 'Audit_2020' to 'H:\SQLData\TR4_Audit_UAT 2020.ndf',
            --move 'Audit_2021' to 'H:\SQLData\TR4_Audit_UAT 2021.ndf',
            move 'Audit_2022' to 'H:\SQLData\TR4_Audit_UAT 2022.ndf',
            move 'Audit_2023' to 'H:\SQLData\TR4_Audit_UAT 2023.ndf',
            move 'Audit_2024' to 'H:\SQLData\TR4_Audit_UAT 2024.ndf',
            move 'Audit_2025' to 'H:\SQLData\TR4_Audit_UAT 2025.ndf',
            move 'Audit_2026' to 'H:\SQLData\TR4_Audit_UAT 2026.ndf',
            move 'Audit_2027' to 'H:\SQLData\TR4_Audit_UAT 2027.ndf',
            move 'Audit_2028' to 'H:\SQLData\TR4_Audit_UAT 2028.ndf',
            move 'Audit_2029' to 'H:\SQLData\TR4_Audit_UAT 2029.ndf',
            move 'Audit_2030' to 'H:\SQLData\TR4_Audit_UAT 2030.ndf',
        
        PARTIAL, REPLACE, NORECOVERY, stats = 5
