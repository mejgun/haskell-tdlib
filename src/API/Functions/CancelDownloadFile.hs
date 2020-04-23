-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CancelDownloadFile where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CancelDownloadFile = 
 CancelDownloadFile { only_if_pending :: Maybe Bool, file_id :: Maybe Int }  deriving (Show)

instance T.ToJSON CancelDownloadFile where
 toJSON (CancelDownloadFile { only_if_pending = only_if_pending, file_id = file_id }) =
  A.object [ "@type" A..= T.String "cancelDownloadFile", "only_if_pending" A..= only_if_pending, "file_id" A..= file_id ]

instance T.FromJSON CancelDownloadFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "cancelDownloadFile" -> parseCancelDownloadFile v
   _ -> mempty
  where
   parseCancelDownloadFile :: A.Value -> T.Parser CancelDownloadFile
   parseCancelDownloadFile = A.withObject "CancelDownloadFile" $ \o -> do
    only_if_pending <- optional $ o A..: "only_if_pending"
    file_id <- optional $ o A..: "file_id"
    return $ CancelDownloadFile { only_if_pending = only_if_pending, file_id = file_id }