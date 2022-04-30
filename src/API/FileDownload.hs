-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FileDownload where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.Message as Message

-- |
-- 
-- Describes a file added to file download list
-- 
-- __file_id__ File identifier
-- 
-- __message__ The message with the file
-- 
-- __add_date__ Point in time (Unix timestamp) when the file was added to the download list
-- 
-- __complete_date__ Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
-- 
-- __is_paused__ True, if downloading of the file is paused
data FileDownload = 

 FileDownload { is_paused :: Maybe Bool, complete_date :: Maybe Int, add_date :: Maybe Int, message :: Maybe Message.Message, file_id :: Maybe Int }  deriving (Eq)

instance Show FileDownload where
 show FileDownload { is_paused=is_paused, complete_date=complete_date, add_date=add_date, message=message, file_id=file_id } =
  "FileDownload" ++ U.cc [U.p "is_paused" is_paused, U.p "complete_date" complete_date, U.p "add_date" add_date, U.p "message" message, U.p "file_id" file_id ]

instance T.ToJSON FileDownload where
 toJSON FileDownload { is_paused = is_paused, complete_date = complete_date, add_date = add_date, message = message, file_id = file_id } =
  A.object [ "@type" A..= T.String "fileDownload", "is_paused" A..= is_paused, "complete_date" A..= complete_date, "add_date" A..= add_date, "message" A..= message, "file_id" A..= file_id ]

instance T.FromJSON FileDownload where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "fileDownload" -> parseFileDownload v
   _ -> mempty
  where
   parseFileDownload :: A.Value -> T.Parser FileDownload
   parseFileDownload = A.withObject "FileDownload" $ \o -> do
    is_paused <- o A..:? "is_paused"
    complete_date <- mconcat [ o A..:? "complete_date", readMaybe <$> (o A..: "complete_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    add_date <- mconcat [ o A..:? "add_date", readMaybe <$> (o A..: "add_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    message <- o A..:? "message"
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ FileDownload { is_paused = is_paused, complete_date = complete_date, add_date = add_date, message = message, file_id = file_id }
 parseJSON _ = mempty
