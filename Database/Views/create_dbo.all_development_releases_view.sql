USE [s16guest42]
GO

/****** Object:  View [dbo].[all_development_releases_view]    Script Date: 5/7/2016 12:26:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[all_development_releases_view]
AS
SELECT        dbo.software.software_name, dbo.software.software_description, dbo.version.major_version, dbo.version.minor_version, dbo.platform.platform_type, dbo.version.date_created, dbo.release.major_release, 
                         dbo.release.minor_release, dbo.release.release_type, dbo.development_release.iteration, dbo.development_release.last_completed_iteration_date, dbo.development_release.source_link, 
                         dbo.development_release.customer_release_ready
FROM            dbo.development_release INNER JOIN
                         dbo.release ON dbo.development_release.release_id = dbo.release.release_id INNER JOIN
                         dbo.version ON dbo.release.version_id = dbo.version.version_id INNER JOIN
                         dbo.platform ON dbo.version.platform_id = dbo.platform.platform_id INNER JOIN
                         dbo.software ON dbo.version.software_id = dbo.software.software_id

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
         Left = 0
      End
      Begin Tables = 
         Begin Table = "development_release"
            Begin Extent = 
               Top = 104
               Left = 928
               Bottom = 234
               Right = 1174
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "release"
            Begin Extent = 
               Top = 105
               Left = 710
               Bottom = 235
               Right = 880
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "version"
            Begin Extent = 
               Top = 119
               Left = 297
               Bottom = 249
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "platform"
            Begin Extent = 
               Top = 12
               Left = 499
               Bottom = 108
               Right = 669
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "software"
            Begin Extent = 
               Top = 135
               Left = 40
               Bottom = 248
               Right = 238
            End
            DisplayFlags = 280
            TopColumn = 0
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
         Or = 1755
         Or = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_development_releases_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_development_releases_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_development_releases_view'
GO

