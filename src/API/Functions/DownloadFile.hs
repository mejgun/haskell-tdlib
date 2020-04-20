-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DownloadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DownloadFile = 
 DownloadFile { synchronous :: Bool, limit :: Int, offset :: Int, priority :: Int, file_id :: Int }  -- deriving (Show)

instance T.ToJSON DownloadFile where
 toJSON (DownloadFile { synchronous = synchronous, limit = limit, offset = offset, priority = priority, file_id = file_id }) =
  A.object [ "@type" A..= T.String "downloadFile", "synchronous" A..= synchronous, "limit" A..= limit, "offset" A..= offset, "priority" A..= priority, "file_id" A..= file_id ]
-- downloadFile DownloadFile  { synchronous :: Bool, limit :: Int, offset :: Int, priority :: Int, file_id :: Int } 



instance T.FromJSON DownloadFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "downloadFile" -> parseDownloadFile v
  where
   parseDownloadFile :: A.Value -> T.Parser DownloadFile
   parseDownloadFile = A.withObject "DownloadFile" $ \o -> do
    synchronous <- o A..: "synchronous"
    limit <- o A..: "limit"
    offset <- o A..: "offset"
    priority <- o A..: "priority"
    file_id <- o A..: "file_id"
    return $ DownloadFile { synchronous = synchronous, limit = limit, offset = offset, priority = priority, file_id = file_id }