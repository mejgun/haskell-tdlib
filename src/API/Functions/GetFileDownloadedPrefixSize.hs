-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFileDownloadedPrefixSize where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetFileDownloadedPrefixSize = 
 GetFileDownloadedPrefixSize { offset :: Maybe Int, file_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetFileDownloadedPrefixSize where
 toJSON (GetFileDownloadedPrefixSize { offset = offset, file_id = file_id }) =
  A.object [ "@type" A..= T.String "getFileDownloadedPrefixSize", "offset" A..= offset, "file_id" A..= file_id ]

instance T.FromJSON GetFileDownloadedPrefixSize where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFileDownloadedPrefixSize" -> parseGetFileDownloadedPrefixSize v
   _ -> mempty
  where
   parseGetFileDownloadedPrefixSize :: A.Value -> T.Parser GetFileDownloadedPrefixSize
   parseGetFileDownloadedPrefixSize = A.withObject "GetFileDownloadedPrefixSize" $ \o -> do
    offset <- optional $ o A..: "offset"
    file_id <- optional $ o A..: "file_id"
    return $ GetFileDownloadedPrefixSize { offset = offset, file_id = file_id }