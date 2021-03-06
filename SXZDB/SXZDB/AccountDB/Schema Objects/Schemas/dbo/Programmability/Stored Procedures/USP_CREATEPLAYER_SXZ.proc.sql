﻿/****** 对象:  Table [dbo].[TBL_ACCOUNT]    脚本日期: 04/06/2014 16:29:50 ******/
CREATE PROCEDURE [dbo].[USP_CREATEPLAYER_SXZ]
@Name VARCHAR (32), @AccountID INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @PlayerID INT
	SET @PlayerID = 0
	
	IF NOT EXISTS(SELECT 1 FROM TBL_PLAYER WHERE AccountID = @AccountID AND [Delete] = 0)
	--IF NOT EXISTS(SELECT 1 FROM TBL_PLAYER WHERE PlayerName = @Name AND [Delete] = 0)
	BEGIN
		BEGIN TRANSACTION CREATEPLAYER_SXZ	

		INSERT INTO TBL_PLAYER(AccountID,PlayerName) 
			SELECT @AccountID, @Name
		SET @PlayerID = 50000000+@@IDENTITY
		UPDATE TBL_PLAYER SET PlayerID=@PlayerID WHERE ID=@@IDENTITY

		COMMIT TRANSACTION CREATEPLAYER_SXZ
	END

	SELECT @PlayerID
END