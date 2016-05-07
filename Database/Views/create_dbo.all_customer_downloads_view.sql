USE [s16guest42]
GO

/****** Object:  View [dbo].[all_customer_downloads_view]    Script Date: 5/7/2016 12:24:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[all_customer_downloads_view]
AS
SELECT        dbo.software.software_name, dbo.version.major_version, dbo.version.minor_version, dbo.platform.platform_type, dbo.release.major_release, dbo.release.minor_release, dbo.release.release_type, 
                         dbo.customer.customer_id, dbo.customer.first_name, dbo.customer.middle_name, dbo.customer.last_name, dbo.customer.email_address, dbo.download.date_downloaded
FROM            dbo.customer INNER JOIN
                         dbo.download ON dbo.customer.customer_id = dbo.download.customer_id INNER JOIN
                         dbo.release ON dbo.download.release_id = dbo.release.release_id INNER JOIN
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
         Begin Table = "customer"
            Begin Extent = 
               Top = 105
               Left = 1042
               Bottom = 235
               Right = 1212
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "download"
            Begin Extent = 
               Top = 10
               Left = 823
               Bottom = 123
               Right = 1006
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "platform"
            Begin Extent = 
               Top = 6
               Left = 439
               Bottom = 102
               Right = 609
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "release"
            Begin Extent = 
               Top = 111
               Left = 614
               Bottom = 241
               Right = 784
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "software"
            Begin Extent = 
               Top = 140
               Left = 24
               Bottom = 253
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "version"
            Begin Extent = 
               Top = 121
               Left = 238
               Bottom = 251
               Right = 408
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
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_customer_downloads_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_customer_downloads_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_customer_downloads_view'
GO

