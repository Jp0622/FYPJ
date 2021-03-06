
GO
CREATE TABLE [dbo].[AssetItem](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[catId] [int] NULL,
	[modelId] [int] NULL,
	[itemDescription] [nvarchar](max) NULL,
	[price] [money] NULL,
	[serialNumber] [nvarchar](max) NULL,
	[assetNumber] [nvarchar](max) NULL,
	[locationId] [int] NULL,
	[reservedFor] [int] NULL,
	[assignedTo] [int] NULL,
	[loanable] [int] NULL,
	[remarks] [nvarchar](max) NULL,
	[itemStatus] [int] NULL,
	[itemReceivedDate] [date] NULL,
	[itemDecommissionDate] [date] NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[lastUpdatedDateTime] [datetime] NOT NULL,
	[loanRequestID] [int] NULL,
	[loanStatus] [int] NULL,
	[loanProcessDate] [datetime] NULL,
	[loanProcessBy] [int] NULL,
	[parentId] [int] NULL,
	[lastAuditDate] [date] NULL,
	[lastAuditedBy] [int] NULL,
	[lastAuditStatus] [int] NULL,
	[smgindex] [nvarchar](max) NULL,
	[itemLoanDueDate] [date] NULL,
	[itemLoanStartDate] [date] NULL,
	[rfid] [nvarchar](max) NULL,
	[nfc] [nvarchar](max) NULL,
	[isConsumed] [bit] NOT NULL,
	[macAddress] [varchar](max) NULL,
 CONSTRAINT [PK_AssetItem] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetLoanExtensionRequest]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetLoanExtensionRequest](
	[loanRequestExtensionId] [int] IDENTITY(1,1) NOT NULL,
	[assetItemId] [int] NOT NULL,
	[requestStaffId] [int] NOT NULL,
	[newItemDueDate] [date] NOT NULL,
	[submissionDateTime] [datetime] NOT NULL,
	[processedBy] [int] NULL,
	[processedDatetime] [datetime] NULL,
	[status] [int] NOT NULL,
	[loanExtensionApprovalStatus] [int] NOT NULL,
	[justification] [text] NULL,
	[respondMessage] [text] NULL,
 CONSTRAINT [PK_AssetLoanExtensionRequest] PRIMARY KEY CLUSTERED 
(
	[loanRequestExtensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[auditId] [int] IDENTITY(1,1) NOT NULL,
	[performedBy] [int] NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[activitySummary] [text] NOT NULL,
	[performedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditTrail] PRIMARY KEY CLUSTERED 
(
	[auditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brandId] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](255) NOT NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[lastUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[catId] [int] IDENTITY(1,1) NOT NULL,
	[catName] [nvarchar](255) NOT NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[lastUpdatedDateTime] [datetime] NULL,
	[requireDDApproval] [bit] NULL,
	[isConsumable] [bit] NOT NULL,
 CONSTRAINT [PK_ItemCategory] PRIMARY KEY CLUSTERED 
(
	[catId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryRoleAccess]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryRoleAccess](
	[CategoryID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryRoleAccess] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[companyId] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [nvarchar](128) NOT NULL,
	[companyAddress] [nvarchar](255) NULL,
	[postalCode] [nvarchar](50) NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[lastUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailNotificationList]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailNotificationList](
	[notificationListID] [int] IDENTITY(1,1) NOT NULL,
	[staffID] [int] NOT NULL,
	[emailNotificationTypeID] [int] NOT NULL,
 CONSTRAINT [PK_NotificationList] PRIMARY KEY CLUSTERED 
(
	[notificationListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailNotificationType]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailNotificationType](
	[emailNotificationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmailiNotificationType] PRIMARY KEY CLUSTERED 
(
	[emailNotificationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemLoanHistory]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemLoanHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemId] [int] NOT NULL,
	[requesterStaffId] [int] NOT NULL,
	[loanRequestId] [int] NULL,
	[transactionType] [int] NOT NULL,
	[processDateTime] [datetime] NOT NULL,
	[processedBy] [int] NOT NULL,
 CONSTRAINT [PK_ItemLoanHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequest]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequest](
	[loanRequestId] [int] IDENTITY(1,1) NOT NULL,
	[catId] [int] NOT NULL,
	[modelId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[purpose] [nvarchar](max) NULL,
	[requestStaffId] [int] NOT NULL,
	[dateRequest] [datetime2](7) NOT NULL,
	[requestFromDate] [date] NULL,
	[requestToDate] [date] NULL,
	[status] [int] NOT NULL,
	[respondMessage] [nvarchar](max) NULL,
	[processedBy] [int] NULL,
	[processedDateTime] [datetime2](7) NULL,
	[forStudent] [int] NOT NULL,
	[studentList] [nvarchar](1024) NULL,
	[approvalStatus] [int] NULL,
 CONSTRAINT [PK_LoanRequest] PRIMARY KEY CLUSTERED 
(
	[loanRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequestApprovalStatus]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequestApprovalStatus](
	[LoanStatusID] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_LoanRequestApprovalStatus] PRIMARY KEY CLUSTERED 
(
	[LoanStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequestAsset]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequestAsset](
	[LoanRequestID] [int] NOT NULL,
	[AssetID] [int] NOT NULL,
	[LoanStatus] [int] NOT NULL,
	[DateLoanedOut] [datetime2](7) NULL,
	[DateReturned] [datetime2](7) NULL,
	[StudentID] [nvarchar](10) NULL,
 CONSTRAINT [PK_LoanRequestAsset] PRIMARY KEY CLUSTERED 
(
	[LoanRequestID] ASC,
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequestAssetStatus]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequestAssetStatus](
	[LoanRequestAssetStatusID] [int] NOT NULL,
	[LoanRequestAssetStatusDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoanRequestAssetStatus] PRIMARY KEY CLUSTERED 
(
	[LoanRequestAssetStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequestAssetStudent]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequestAssetStudent](
	[LoanRequestID] [int] NOT NULL,
	[AssetID] [int] NOT NULL,
	[StudentID] [nvarchar](10) NOT NULL,
	[DateAssigned] [datetime2](7) NOT NULL,
	[DateReturned] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
	[ReminderDate] [datetime2](7) NULL,
	[Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoanRequestAssetStudent] PRIMARY KEY CLUSTERED 
(
	[LoanRequestID] ASC,
	[AssetID] ASC,
	[StudentID] ASC,
	[DateAssigned] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequestDetail]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequestDetail](
	[LoanRequestID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoanRequestDetail] PRIMARY KEY CLUSTERED 
(
	[LoanRequestID] ASC,
	[CategoryID] ASC,
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequestExtension]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequestExtension](
	[LoanRequestExtensionID] [int] IDENTITY(1,1) NOT NULL,
	[LoanRequestID] [int] NOT NULL,
	[NewDateRequested] [date] NOT NULL,
	[Justification] [nvarchar](max) NULL,
	[LoanRequestExtensionApprovalStatus] [int] NOT NULL,
	[RespondMessage] [nvarchar](max) NULL,
	[CreatedDate] [date] NOT NULL,
	[DateClosed] [datetime2](7) NULL,
 CONSTRAINT [PK_LoanRequestExtension] PRIMARY KEY CLUSTERED 
(
	[LoanRequestExtensionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanRequestStatus]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanRequestStatus](
	[LoanRequestStatusID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LoanRequestStatus] PRIMARY KEY CLUSTERED 
(
	[LoanRequestStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[locationId] [int] IDENTITY(1,1) NOT NULL,
	[locationName] [nvarchar](128) NOT NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[lastUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[modelId] [int] IDENTITY(1,1) NOT NULL,
	[brandId] [int] NOT NULL,
	[modelName] [nvarchar](255) NOT NULL,
	[modelDescription] [nvarchar](512) NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[lastUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[modelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PO]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO](
	[POId] [int] IDENTITY(1,1) NOT NULL,
	[PONumber] [nvarchar](128) NOT NULL,
	[PODescription] [nvarchar](max) NULL,
	[PODate] [date] NULL,
	[supplierId] [int] NOT NULL,
	[remarks] [nvarchar](max) NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[lastUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PO] PRIMARY KEY CLUSTERED 
(
	[POId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POItems]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POItems](
	[poId] [int] NOT NULL,
	[assetItemId] [int] NOT NULL,
 CONSTRAINT [PK_POItems] PRIMARY KEY CLUSTERED 
(
	[poId] ASC,
	[assetItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SettingsName] [nvarchar](50) NOT NULL,
	[value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SettingsName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[staffId] [int] IDENTITY(1,1) NOT NULL,
	[loginName] [nvarchar](128) NOT NULL,
	[staffName] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NULL,
	[roleId] [int] NOT NULL,
	[lastLogin] [datetime2](7) NULL,
	[disabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[staffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[AdminNo] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[AdminNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentStatus]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentStatus](
	[StudentStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentStatuses] PRIMARY KEY CLUSTERED 
(
	[StudentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplierId] [int] IDENTITY(1,1) NOT NULL,
	[companyId] [int] NOT NULL,
	[salesPerson] [nvarchar](128) NOT NULL,
	[telephone1] [nvarchar](50) NULL,
	[telephone2] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[email] [nvarchar](128) NULL,
	[designation] [nvarchar](128) NULL,
	[itemSupplied] [nvarchar](255) NULL,
	[remarks] [nvarchar](255) NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[lastUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[supplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUsers]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUsers](
	[UserID] [nvarchar](50) NOT NULL,
	[Password] [varbinary](max) NOT NULL,
	[Salt] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_SystemUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccessMatrix]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccessMatrix](
	[userAccessMatrixID] [int] IDENTITY(1,1) NOT NULL,
	[userRole] [int] NOT NULL,
	[userFunctionID] [int] NOT NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NULL,
 CONSTRAINT [PK_UserAccessMatrix] PRIMARY KEY CLUSTERED 
(
	[userAccessMatrixID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFunctions]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFunctions](
	[userFunctionID] [int] IDENTITY(1,1) NOT NULL,
	[pageName] [varchar](500) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserFunctions] PRIMARY KEY CLUSTERED 
(
	[userFunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[roleId] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Z210]    Script Date: 30/5/2022 3:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Z210](
	[Asset] [nvarchar](255) NULL,
	[Serial] [nvarchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetItem] ADD  CONSTRAINT [DF_AssetItem_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[AssetItem] ADD  CONSTRAINT [DF_AssetItem_itemStatus]  DEFAULT ((1)) FOR [itemStatus]
GO
ALTER TABLE [dbo].[AssetItem] ADD  CONSTRAINT [DF_AssetItem_loanStatus]  DEFAULT ((0)) FOR [loanStatus]
GO
ALTER TABLE [dbo].[AssetItem] ADD  CONSTRAINT [DF_AssetItem_isConsumed]  DEFAULT ((0)) FOR [isConsumed]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isConsumable]  DEFAULT ((0)) FOR [isConsumable]
GO
ALTER TABLE [dbo].[CategoryRoleAccess] ADD  CONSTRAINT [DF_CategoryRoleAccess_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[EmailNotificationList] ADD  CONSTRAINT [DF_NotificationList_notificationTypeID]  DEFAULT ((2)) FOR [emailNotificationTypeID]
GO
ALTER TABLE [dbo].[LoanRequest] ADD  CONSTRAINT [DF_LoanRequest_forStudent]  DEFAULT ((0)) FOR [forStudent]
GO
ALTER TABLE [dbo].[LoanRequestAsset] ADD  CONSTRAINT [DF_LoanRequestAsset_LoanStatus]  DEFAULT ((1)) FOR [LoanStatus]
GO
ALTER TABLE [dbo].[LoanRequestAssetStudent] ADD  CONSTRAINT [DF_LoanRequestAssetStudent_DateAssigned]  DEFAULT (getdate()) FOR [DateAssigned]
GO
ALTER TABLE [dbo].[LoanRequestAssetStudent] ADD  CONSTRAINT [DF_LoanRequestAssetStudent_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[LoanRequestDetail] ADD  CONSTRAINT [DF_LoanRequestDetail_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[LoanRequestExtension] ADD  CONSTRAINT [DF_LoanRequestExtension_LoanRequestExtensionApprovalStatus]  DEFAULT ((0)) FOR [LoanRequestExtensionApprovalStatus]
GO
ALTER TABLE [dbo].[LoanRequestExtension] ADD  CONSTRAINT [DF_LoanRequestExtension_RequestCreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[UserAccessMatrix] ADD  CONSTRAINT [DF_UserAccessMatrix_validFrom]  DEFAULT (getdate()) FOR [validFrom]
GO
ALTER TABLE [dbo].[AssetItem]  WITH CHECK ADD  CONSTRAINT [FK_AssetItem_AssetItem] FOREIGN KEY([parentId])
REFERENCES [dbo].[AssetItem] ([itemId])
GO
ALTER TABLE [dbo].[AssetItem] CHECK CONSTRAINT [FK_AssetItem_AssetItem]
GO
ALTER TABLE [dbo].[AssetItem]  WITH NOCHECK ADD  CONSTRAINT [FK_AssetItem_Category] FOREIGN KEY([catId])
REFERENCES [dbo].[Category] ([catId])
GO
ALTER TABLE [dbo].[AssetItem] NOCHECK CONSTRAINT [FK_AssetItem_Category]
GO
ALTER TABLE [dbo].[AssetItem]  WITH NOCHECK ADD  CONSTRAINT [FK_AssetItem_LoanRequestID] FOREIGN KEY([loanRequestID])
REFERENCES [dbo].[LoanRequest] ([loanRequestId])
GO
ALTER TABLE [dbo].[AssetItem] NOCHECK CONSTRAINT [FK_AssetItem_LoanRequestID]
GO
ALTER TABLE [dbo].[AssetItem]  WITH NOCHECK ADD  CONSTRAINT [FK_AssetItem_Location] FOREIGN KEY([locationId])
REFERENCES [dbo].[Location] ([locationId])
GO
ALTER TABLE [dbo].[AssetItem] NOCHECK CONSTRAINT [FK_AssetItem_Location]
GO
ALTER TABLE [dbo].[AssetItem]  WITH NOCHECK ADD  CONSTRAINT [FK_AssetItem_Model] FOREIGN KEY([modelId])
REFERENCES [dbo].[Models] ([modelId])
GO
ALTER TABLE [dbo].[AssetItem] NOCHECK CONSTRAINT [FK_AssetItem_Model]
GO
ALTER TABLE [dbo].[AssetItem]  WITH NOCHECK ADD  CONSTRAINT [FK_AssetItem_ReservedFor] FOREIGN KEY([reservedFor])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[AssetItem] NOCHECK CONSTRAINT [FK_AssetItem_ReservedFor]
GO
ALTER TABLE [dbo].[AssetItem]  WITH NOCHECK ADD  CONSTRAINT [FK_AssetItem_Staff_AssignedTo] FOREIGN KEY([assignedTo])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[AssetItem] NOCHECK CONSTRAINT [FK_AssetItem_Staff_AssignedTo]
GO
ALTER TABLE [dbo].[AssetItem]  WITH CHECK ADD  CONSTRAINT [FK_AssetItem_Staff_LastUpdatedBy] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[AssetItem] CHECK CONSTRAINT [FK_AssetItem_Staff_LastUpdatedBy]
GO
ALTER TABLE [dbo].[AssetLoanExtensionRequest]  WITH CHECK ADD  CONSTRAINT [FK_AssetLoanExtensionRequest_AssetItem] FOREIGN KEY([assetItemId])
REFERENCES [dbo].[AssetItem] ([itemId])
GO
ALTER TABLE [dbo].[AssetLoanExtensionRequest] CHECK CONSTRAINT [FK_AssetLoanExtensionRequest_AssetItem]
GO
ALTER TABLE [dbo].[AssetLoanExtensionRequest]  WITH CHECK ADD  CONSTRAINT [FK_AssetLoanExtensionRequest_Staff_ProcessedBy] FOREIGN KEY([processedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[AssetLoanExtensionRequest] CHECK CONSTRAINT [FK_AssetLoanExtensionRequest_Staff_ProcessedBy]
GO
ALTER TABLE [dbo].[AssetLoanExtensionRequest]  WITH CHECK ADD  CONSTRAINT [FK_AssetLoanExtensionRequest_Staff_RequestStaffId] FOREIGN KEY([requestStaffId])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[AssetLoanExtensionRequest] CHECK CONSTRAINT [FK_AssetLoanExtensionRequest_Staff_RequestStaffId]
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD  CONSTRAINT [FK_Brands_UpdatedBy_Staff] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[Brands] CHECK CONSTRAINT [FK_Brands_UpdatedBy_Staff]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Staff] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Staff]
GO
ALTER TABLE [dbo].[CategoryRoleAccess]  WITH CHECK ADD  CONSTRAINT [FK_CategoryRoleAccess_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([catId])
GO
ALTER TABLE [dbo].[CategoryRoleAccess] CHECK CONSTRAINT [FK_CategoryRoleAccess_Category]
GO
ALTER TABLE [dbo].[CategoryRoleAccess]  WITH CHECK ADD  CONSTRAINT [FK_CategoryRoleAccess_UserRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRoles] ([roleId])
GO
ALTER TABLE [dbo].[CategoryRoleAccess] CHECK CONSTRAINT [FK_CategoryRoleAccess_UserRoles]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Staff] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Staff]
GO
ALTER TABLE [dbo].[EmailNotificationList]  WITH CHECK ADD  CONSTRAINT [FK_NotificationList_EmailiNotificationType] FOREIGN KEY([emailNotificationTypeID])
REFERENCES [dbo].[EmailNotificationType] ([emailNotificationTypeID])
GO
ALTER TABLE [dbo].[EmailNotificationList] CHECK CONSTRAINT [FK_NotificationList_EmailiNotificationType]
GO
ALTER TABLE [dbo].[EmailNotificationList]  WITH CHECK ADD  CONSTRAINT [FK_NotificationList_Staff] FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[EmailNotificationList] CHECK CONSTRAINT [FK_NotificationList_Staff]
GO
ALTER TABLE [dbo].[LoanRequest]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanRequest_approveStaffId] FOREIGN KEY([processedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[LoanRequest] NOCHECK CONSTRAINT [FK_LoanRequest_approveStaffId]
GO
ALTER TABLE [dbo].[LoanRequest]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequest_Category] FOREIGN KEY([catId])
REFERENCES [dbo].[Category] ([catId])
GO
ALTER TABLE [dbo].[LoanRequest] CHECK CONSTRAINT [FK_LoanRequest_Category]
GO
ALTER TABLE [dbo].[LoanRequest]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequest_LoanRequestApprovalStatus] FOREIGN KEY([approvalStatus])
REFERENCES [dbo].[LoanRequestApprovalStatus] ([LoanStatusID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LoanRequest] CHECK CONSTRAINT [FK_LoanRequest_LoanRequestApprovalStatus]
GO
ALTER TABLE [dbo].[LoanRequest]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequest_LoanRequestStatus] FOREIGN KEY([status])
REFERENCES [dbo].[LoanRequestStatus] ([LoanRequestStatusID])
GO
ALTER TABLE [dbo].[LoanRequest] CHECK CONSTRAINT [FK_LoanRequest_LoanRequestStatus]
GO
ALTER TABLE [dbo].[LoanRequest]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequest_Model] FOREIGN KEY([modelId])
REFERENCES [dbo].[Models] ([modelId])
GO
ALTER TABLE [dbo].[LoanRequest] CHECK CONSTRAINT [FK_LoanRequest_Model]
GO
ALTER TABLE [dbo].[LoanRequest]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequest_RequestStaff] FOREIGN KEY([requestStaffId])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[LoanRequest] CHECK CONSTRAINT [FK_LoanRequest_RequestStaff]
GO
ALTER TABLE [dbo].[LoanRequestAsset]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestAsset_AssetItem] FOREIGN KEY([AssetID])
REFERENCES [dbo].[AssetItem] ([itemId])
GO
ALTER TABLE [dbo].[LoanRequestAsset] CHECK CONSTRAINT [FK_LoanRequestAsset_AssetItem]
GO
ALTER TABLE [dbo].[LoanRequestAsset]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestAsset_LoanRequest] FOREIGN KEY([LoanRequestID])
REFERENCES [dbo].[LoanRequest] ([loanRequestId])
GO
ALTER TABLE [dbo].[LoanRequestAsset] CHECK CONSTRAINT [FK_LoanRequestAsset_LoanRequest]
GO
ALTER TABLE [dbo].[LoanRequestAsset]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestAsset_LoanRequestAssetStatus] FOREIGN KEY([LoanStatus])
REFERENCES [dbo].[LoanRequestAssetStatus] ([LoanRequestAssetStatusID])
GO
ALTER TABLE [dbo].[LoanRequestAsset] CHECK CONSTRAINT [FK_LoanRequestAsset_LoanRequestAssetStatus]
GO
ALTER TABLE [dbo].[LoanRequestAssetStudent]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestAssetStudent_LoanRequestAsset] FOREIGN KEY([LoanRequestID], [AssetID])
REFERENCES [dbo].[LoanRequestAsset] ([LoanRequestID], [AssetID])
GO
ALTER TABLE [dbo].[LoanRequestAssetStudent] CHECK CONSTRAINT [FK_LoanRequestAssetStudent_LoanRequestAsset]
GO
ALTER TABLE [dbo].[LoanRequestAssetStudent]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestAssetStudent_Staff] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[LoanRequestAssetStudent] CHECK CONSTRAINT [FK_LoanRequestAssetStudent_Staff]
GO
ALTER TABLE [dbo].[LoanRequestAssetStudent]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestAssetStudent_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([AdminNo])
GO
ALTER TABLE [dbo].[LoanRequestAssetStudent] CHECK CONSTRAINT [FK_LoanRequestAssetStudent_Student]
GO
ALTER TABLE [dbo].[LoanRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestDetail_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([catId])
GO
ALTER TABLE [dbo].[LoanRequestDetail] CHECK CONSTRAINT [FK_LoanRequestDetail_Category]
GO
ALTER TABLE [dbo].[LoanRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestDetail_LoanRequest] FOREIGN KEY([LoanRequestID])
REFERENCES [dbo].[LoanRequest] ([loanRequestId])
GO
ALTER TABLE [dbo].[LoanRequestDetail] CHECK CONSTRAINT [FK_LoanRequestDetail_LoanRequest]
GO
ALTER TABLE [dbo].[LoanRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestDetail_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([modelId])
GO
ALTER TABLE [dbo].[LoanRequestDetail] CHECK CONSTRAINT [FK_LoanRequestDetail_Models]
GO
ALTER TABLE [dbo].[LoanRequestExtension]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestExtension_LoanRequest] FOREIGN KEY([LoanRequestID])
REFERENCES [dbo].[LoanRequest] ([loanRequestId])
GO
ALTER TABLE [dbo].[LoanRequestExtension] CHECK CONSTRAINT [FK_LoanRequestExtension_LoanRequest]
GO
ALTER TABLE [dbo].[LoanRequestExtension]  WITH CHECK ADD  CONSTRAINT [FK_LoanRequestExtension_LoanRequestApprovalStatus] FOREIGN KEY([LoanRequestExtensionApprovalStatus])
REFERENCES [dbo].[LoanRequestStatus] ([LoanRequestStatusID])
GO
ALTER TABLE [dbo].[LoanRequestExtension] CHECK CONSTRAINT [FK_LoanRequestExtension_LoanRequestApprovalStatus]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Staff] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Staff]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Brand] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([brandId])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Brand]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Staff] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Staff]
GO
ALTER TABLE [dbo].[PO]  WITH CHECK ADD  CONSTRAINT [FK_PO_Staff] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[PO] CHECK CONSTRAINT [FK_PO_Staff]
GO
ALTER TABLE [dbo].[PO]  WITH CHECK ADD  CONSTRAINT [FK_PO_Suppliers] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Suppliers] ([supplierId])
GO
ALTER TABLE [dbo].[PO] CHECK CONSTRAINT [FK_PO_Suppliers]
GO
ALTER TABLE [dbo].[POItems]  WITH CHECK ADD  CONSTRAINT [FK_POItems_AssetItem] FOREIGN KEY([assetItemId])
REFERENCES [dbo].[AssetItem] ([itemId])
GO
ALTER TABLE [dbo].[POItems] CHECK CONSTRAINT [FK_POItems_AssetItem]
GO
ALTER TABLE [dbo].[POItems]  WITH CHECK ADD  CONSTRAINT [FK_POItems_PO] FOREIGN KEY([poId])
REFERENCES [dbo].[PO] ([POId])
GO
ALTER TABLE [dbo].[POItems] CHECK CONSTRAINT [FK_POItems_PO]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[UserRoles] ([roleId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Role]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Students_StudentStatuses] FOREIGN KEY([Status])
REFERENCES [dbo].[StudentStatus] ([StudentStatusID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Students_StudentStatuses]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[Company] ([companyId])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_Company]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Staff] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[Staff] ([staffId])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_Staff]
GO
ALTER TABLE [dbo].[UserAccessMatrix]  WITH CHECK ADD  CONSTRAINT [FK_UserAccessMatrix_UserFunctions] FOREIGN KEY([userFunctionID])
REFERENCES [dbo].[UserFunctions] ([userFunctionID])
GO
ALTER TABLE [dbo].[UserAccessMatrix] CHECK CONSTRAINT [FK_UserAccessMatrix_UserFunctions]
GO
ALTER TABLE [dbo].[UserAccessMatrix]  WITH CHECK ADD  CONSTRAINT [FK_UserAccessMatrix_UserRoles] FOREIGN KEY([userRole])
REFERENCES [dbo].[UserRoles] ([roleId])
GO
ALTER TABLE [dbo].[UserAccessMatrix] CHECK CONSTRAINT [FK_UserAccessMatrix_UserRoles]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: not loanable; 1: loanable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetItem', @level2type=N'COLUMN',@level2name=N'loanable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Live 2: Decommissioned' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetItem', @level2type=N'COLUMN',@level2name=N'itemStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'when loanRequestID=0, it means the item is issues(reserved/assigned) to a staff without a loan request' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetItem', @level2type=N'COLUMN',@level2name=N'loanRequestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: not loaned; 1: reserved; 2: assigned; ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetItem', @level2type=N'COLUMN',@level2name=N'loanStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1: fail; 0: not set; 1: pass' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetItem', @level2type=N'COLUMN',@level2name=N'lastAuditStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Asset Item reserved for user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetItem', @level2type=N'CONSTRAINT',@level2name=N'FK_AssetItem_ReservedFor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-3 - rejected by AD/DD;
-2 - rejected by TSO Mgr;  
-1 - rejected by TSO;  
0 - new request; 
1- pending approval by TSO Mgr after routed by TSO; 
2 - approved by TSO Mgr; 
3 - pending approval by AD/DDr after routed by TSO Mgr; 
4 - approved by AD/DD;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetLoanExtensionRequest', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: new, 1: approved, -1: rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetLoanExtensionRequest', @level2type=N'COLUMN',@level2name=N'loanExtensionApprovalStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Asset Item to be extended' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssetLoanExtensionRequest', @level2type=N'CONSTRAINT',@level2name=N'FK_AssetLoanExtensionRequest_AssetItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: assignment, 2: return' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemLoanHistory', @level2type=N'COLUMN',@level2name=N'transactionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-3 - rejected by AD/DD;
-2 - rejected by TSO Mgr;  
-1 - rejected by TSO;  
0 - new request; 
1- pending approval by TSO Mgr after routed by TSO; 
2 - approved by TSO Mgr; 
3 - pending approval by AD/DDr after routed by TSO Mgr; 
4 - approved by AD/DD;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanRequest', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1 - rejected (status field must be either -1,-2 or -3)
0 - new and not processed (status field must be 0 also)
1 - pending (status field can be 1, 2 or 3: pending by TSO Mgr or ADDD, or already approved by TSO Mgr)
2 - approved (status field must be 2 or 4 depends on whether category requires ADDD approval)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanRequest', @level2type=N'COLUMN',@level2name=N'approvalStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual Date when the Requester received the item physically.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanRequestAsset', @level2type=N'COLUMN',@level2name=N'DateLoanedOut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date when the item is returned to the store physically.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanRequestAsset', @level2type=N'COLUMN',@level2name=N'DateReturned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Use this field to store the Student Admin Number if the item is assigned to him/her.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanRequestAsset', @level2type=N'COLUMN',@level2name=N'StudentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date when this Loan Request is finally Approved or Rejected.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanRequestExtension', @level2type=N'COLUMN',@level2name=N'DateClosed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: end user; 2: TSO; 3: TSO Manager; 4: Super admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'roleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:normal user; 2:TSO; 3: TSO Manager; 4: Super Admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserRoles', @level2type=N'COLUMN',@level2name=N'roleId'
