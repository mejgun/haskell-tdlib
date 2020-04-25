-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DownloadFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DownloadFile = 
 DownloadFile { synchronous :: Maybe Bool, limit :: Maybe Int, offset :: Maybe Int, priority :: Maybe Int, file_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DownloadFile where
 toJSON (DownloadFile { synchronous = synchronous, limit = limit, offset = offset, priority = priority, file_id = file_id }) =
  A.object [ "@type" A..= T.String "downloadFile", "synchronous" A..= synchronous, "limit" A..= limit, "offset" A..= offset, "priority" A..= priority, "file_id" A..= file_id ]

instance T.FromJSON DownloadFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "downloadFile" -> parseDownloadFile v
   _ -> mempty
  where
   parseDownloadFile :: A.Value -> T.Parser DownloadFile
   parseDownloadFile = A.withObject "DownloadFile" $ \o -> do
    synchronous <- o A..:? "synchronous"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    priority <- mconcat [ o A..:? "priority", readMaybe <$> (o A..: "priority" :: T.Parser String)] :: T.Parser (Maybe Int)
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DownloadFile { synchronous = synchronous, limit = limit, offset = offset, priority = priority, file_id = file_id }