USE [master]
GO

/****** Object:  Table [dbo].[credit_card_transactions]    Script Date: 05-12-2025 17:56:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[credit_card_transactions](
	[transaction_id] [float] NULL,
	[city] [nvarchar](255) NULL,
	[transaction_date] [datetime] NULL,
	[card_type] [nvarchar](255) NULL,
	[exp_type] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[amount] [float] NULL
) ON [PRIMARY]
GO
