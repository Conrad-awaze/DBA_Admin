RESTORE DATABASE [AuditDatabase]
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

            FROM DISK = N'FullBackup'

        WITH
            MOVE 'TR4_Audit_log' to 'AuditLOGDirectory\TR4_AuditSuffix log.ldf',
            MOVE 'TR4_Audit' TO N'AuditDataDirectory\TR4_AuditSuffix.mdf',
            move 'Audit_2015' to 'AuditDataDirectory\TR4_AuditSuffix 2015.ndf',
            --move 'Audit_2016' to 'AuditDataDirectory\TR4_AuditSuffix 2016.ndf',
            --move 'Audit_2017' to 'AuditDataDirectory\TR4_AuditSuffix 2017.ndf',
            --move 'Audit_2018' to 'AuditDataDirectory\TR4_AuditSuffix 2018.ndf',
            --move 'Audit_2019' to 'AuditDataDirectory\TR4_AuditSuffix 2019.ndf',
            --move 'Audit_2020' to 'AuditDataDirectory\TR4_AuditSuffix 2020.ndf',
            --move 'Audit_2021' to 'AuditDataDirectory\TR4_AuditSuffix 2021.ndf',
            move 'Audit_2022' to 'AuditDataDirectory\TR4_AuditSuffix 2022.ndf',
            move 'Audit_2023' to 'AuditDataDirectory\TR4_AuditSuffix 2023.ndf',
            move 'Audit_2024' to 'AuditDataDirectory\TR4_AuditSuffix 2024.ndf',
            move 'Audit_2025' to 'AuditDataDirectory\TR4_AuditSuffix 2025.ndf',
            move 'Audit_2026' to 'AuditDataDirectory\TR4_AuditSuffix 2026.ndf',
            move 'Audit_2027' to 'AuditDataDirectory\TR4_AuditSuffix 2027.ndf',
            move 'Audit_2028' to 'AuditDataDirectory\TR4_AuditSuffix 2028.ndf',
            move 'Audit_2029' to 'AuditDataDirectory\TR4_AuditSuffix 2029.ndf',
            move 'Audit_2030' to 'AuditDataDirectory\TR4_AuditSuffix 2030.ndf',
        
        PARTIAL, REPLACE, NORECOVERY, stats = 5