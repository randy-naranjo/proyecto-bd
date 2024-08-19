CREATE DATABASE TLOG
GO
USE TLOG
GO

CREATE TABLE [dbo].[TransationLog]
(
    [idTransaction] [int] IDENTITY(1,1) NOT NULL,
    [processType] [char](1) NOT NULL,
    [srvName] [varchar](30) NOT NULL,
    [DBName] [varchar](20) NOT NULL,
    [table] [varchar](100) NOT NULL,
    [oldRecord] [varchar](max) NOT NULL,
    [newRecord] [varchar](max) NOT NULL,
    [userName] [varchar](20) NOT NULL,
    [appName] [varchar](200) NOT NULL,
    [PCName] [varchar](30) NOT NULL,
    [tstamp] [datetime] NOT NULL,
    CONSTRAINT [pk_idTransaction] PRIMARY KEY CLUSTERED 
(
	[idTransaction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]