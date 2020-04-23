-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DownloadFile where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DownloadFile = 
 DownloadFile { synchronous :: Maybe Bool, limit :: Maybe Int, offset :: Maybe Int, priority :: Maybe Int, file_id :: Maybe Int }  deriving (Show)

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
    synchronous <- optional $ o A..: "synchronous"
    limit <- optional $ o A..: "limit"
    offset <- optional $ o A..: "offset"
    priority <- optional $ o A..: "priority"
    file_id <- optional $ o A..: "file_id"
    return $ DownloadFile { synchronous = synchronous, limit = limit, offset = offset, priority = priority, file_id = file_id }