USE [s16guest42]
GO

/****** Object:  View [dbo].[all_branches_view]    Script Date: 5/7/2016 12:21:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[all_branches_view]
AS
SELECT        dbo.software.software_name, dbo.version.major_version, dbo.version.minor_version, dbo.platform.platform_type, dbo.release.major_release, dbo.release.minor_release, dbo.branch.source_link, 
                         dbo.branch.commit_changes, dbo.branch.pull_requested, dbo.employee.employee_id, dbo.employee.first_name, dbo.employee.middle_name, dbo.employee.last_name
FROM            dbo.branch INNER JOIN
                         dbo.employee ON dbo.branch.employee_id = dbo.employee.employee_id INNER JOIN
                         dbo.release ON dbo.branch.release_id = dbo.release.release_id INNER JOIN
                         dbo.title ON dbo.employee.title_id = dbo.title.title_id INNER JOIN
                         dbo.version ON dbo.release.version_id = dbo.version.version_id INNER JOIN
                         dbo.software ON dbo.version.software_id = dbo.software.software_id INNER JOIN
                         dbo.platform ON dbo.version.platform_id = dbo.platform.platform_id INNER JOIN
                         dbo.development_release ON dbo.branch.release_id = dbo.development_release.release_id AND dbo.release.release_id = dbo.development_release.release_id

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -384
      End
      Begin Tables = 
         Begin Table = "platform"
            Begin Extent = 
               Top = 5
               Left = 478
               Bottom = 101
               Right = 648
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "release"
            Begin Extent = 
               Top = 113
               Left = 629
               Bottom = 243
               Right = 799
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "software"
            Begin Extent = 
               Top = 137
               Left = 32
               Bottom = 250
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "title"
            Begin Extent = 
               Top = 6
               Left = 1481
               Bottom = 119
               Right = 1654
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "version"
            Begin Extent = 
               Top = 120
               Left = 280
               Bottom = 250
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "employee"
            Begin Extent = 
               Top = 111
               Left = 1282
               Bottom = 241
               Right = 1452
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "development_release"
            Begin Extent = 
               Top = 0
               Left = 821
               Bottom = 130
               Right = 1067
            End
          ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_branches_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "branch"
            Begin Extent = 
               Top = 113
               Left = 1092
               Bottom = 243
               Right = 1272
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_branches_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_branches_view'
GO

