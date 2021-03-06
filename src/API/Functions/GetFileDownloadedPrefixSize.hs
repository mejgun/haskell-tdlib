-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFileDownloadedPrefixSize where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns file downloaded prefix size from a given offset 
-- 
-- __file_id__ Identifier of the file
-- 
-- __offset__ Offset from which downloaded prefix size should be calculated
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
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetFileDownloadedPrefixSize { offset = offset, file_id = file_id }