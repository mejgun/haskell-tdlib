-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFileDownloadedPrefixSize where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetFileDownloadedPrefixSize = 
 GetFileDownloadedPrefixSize { offset :: Int, file_id :: Int }  -- deriving (Show)

instance T.ToJSON GetFileDownloadedPrefixSize where
 toJSON (GetFileDownloadedPrefixSize { offset = offset, file_id = file_id }) =
  A.object [ "@type" A..= T.String "getFileDownloadedPrefixSize", "offset" A..= offset, "file_id" A..= file_id ]
-- getFileDownloadedPrefixSize GetFileDownloadedPrefixSize  { offset :: Int, file_id :: Int } 



instance T.FromJSON GetFileDownloadedPrefixSize where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFileDownloadedPrefixSize" -> parseGetFileDownloadedPrefixSize v
  where
   parseGetFileDownloadedPrefixSize :: A.Value -> T.Parser GetFileDownloadedPrefixSize
   parseGetFileDownloadedPrefixSize = A.withObject "GetFileDownloadedPrefixSize" $ \o -> do
    offset <- o A..: "offset"
    file_id <- o A..: "file_id"
    return $ GetFileDownloadedPrefixSize { offset = offset, file_id = file_id }