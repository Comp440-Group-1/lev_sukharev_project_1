USE [s16guest42]
GO

/****** Object:  View [dbo].[all_company_addresses_view]    Script Date: 5/7/2016 12:22:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[all_company_addresses_view]
AS
SELECT        dbo.company.company_id, dbo.company.company_name, dbo.company.company_description, dbo.address.address_line_1, dbo.address.address_line_2, dbo.address.postal_code, dbo.address.city, 
                         dbo.state_province.state_province_code, dbo.state_province.state_province_name, dbo.country_region.country_region_code, dbo.country_region.country_region_name
FROM            dbo.address INNER JOIN
                         dbo.company_address ON dbo.address.address_id = dbo.company_address.address_id INNER JOIN
                         dbo.company ON dbo.company_address.company_id = dbo.company.company_id INNER JOIN
                         dbo.state_province ON dbo.address.state_province_id = dbo.state_province.state_province_id INNER JOIN
                         dbo.country_region ON dbo.state_province.country_region_code = dbo.country_region.country_region_code

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
         Begin Table = "address"
            Begin Extent = 
               Top = 106
               Left = 463
               Bottom = 236
               Right = 643
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "company"
            Begin Extent = 
               Top = 107
               Left = 27
               Bottom = 237
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "company_address"
            Begin Extent = 
               Top = 11
               Left = 267
               Bottom = 107
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "country_region"
            Begin Extent = 
               Top = 22
               Left = 919
               Bottom = 118
               Right = 1123
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "state_province"
            Begin Extent = 
               Top = 9
               Left = 683
               Bottom = 139
               Right = 883
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
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_company_addresses_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_company_addresses_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'all_company_addresses_view'
GO

