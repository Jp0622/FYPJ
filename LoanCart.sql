USE [AssetManagementDB02]
GO

/****** Object:  Table [dbo].[LoanCart]    Script Date: 27/5/2021 11:46:52 am ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LoanCart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[catID] [int] NOT NULL,
	[modelID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[purpose] [nvarchar](max) NULL,
	[forStudent] [bit] NOT NULL,
	[studentList] [nvarchar](1024) NULL,
	[requestStaffID] [int] NOT NULL,
 CONSTRAINT [PK_LoanCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[LoanCart]  WITH CHECK ADD  CONSTRAINT [FK_LoanCart_CatID] FOREIGN KEY([catID])
REFERENCES [dbo].[Category] ([catId])
GO

ALTER TABLE [dbo].[LoanCart] CHECK CONSTRAINT [FK_LoanCart_CatID]
GO

ALTER TABLE [dbo].[LoanCart]  WITH CHECK ADD  CONSTRAINT [FK_LoanCart_ModelID] FOREIGN KEY([modelID])
REFERENCES [dbo].[Models] ([modelId])
GO

ALTER TABLE [dbo].[LoanCart] CHECK CONSTRAINT [FK_LoanCart_ModelID]
GO

ALTER TABLE [dbo].[LoanCart]  WITH CHECK ADD  CONSTRAINT [FK_LoanCart_ReqStaffID] FOREIGN KEY([requestStaffID])
REFERENCES [dbo].[Staff] ([staffId])
GO

ALTER TABLE [dbo].[LoanCart] CHECK CONSTRAINT [FK_LoanCart_ReqStaffID]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 is false 1 is true' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanCart', @level2type=N'COLUMN',@level2name=N'forStudent'
GO

