-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DownloadFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates
-- 
-- __file_id__ Identifier of the file to download
-- 
-- __priority__ Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
-- 
-- __offset__ The starting position from which the file needs to be downloaded
-- 
-- __limit__ Number of bytes which need to be downloaded starting from the "offset" position before the download will automatically be canceled; use 0 to download without a limit
-- 
-- __synchronous__ Pass true to return response only after the file download has succeeded, has failed, has been canceled, or a new downloadFile request with different offset/limit parameters was sent; pass false to return file state immediately, just after the download has been started
data DownloadFile = 

 DownloadFile { synchronous :: Maybe Bool, limit :: Maybe Int, offset :: Maybe Int, priority :: Maybe Int, file_id :: Maybe Int }  deriving (Eq)

instance Show DownloadFile where
 show DownloadFile { synchronous=synchronous, limit=limit, offset=offset, priority=priority, file_id=file_id } =
  "DownloadFile" ++ cc [p "synchronous" synchronous, p "limit" limit, p "offset" offset, p "priority" priority, p "file_id" file_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DownloadFile where
 toJSON DownloadFile { synchronous = synchronous, limit = limit, offset = offset, priority = priority, file_id = file_id } =
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
 parseJSON _ = mempty
