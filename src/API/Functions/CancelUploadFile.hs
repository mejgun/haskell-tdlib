-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CancelUploadFile where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CancelUploadFile = 
 CancelUploadFile { file_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CancelUploadFile where
 toJSON (CancelUploadFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "cancelUploadFile", "file_id" A..= file_id ]

instance T.FromJSON CancelUploadFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "cancelUploadFile" -> parseCancelUploadFile v
   _ -> mempty
  where
   parseCancelUploadFile :: A.Value -> T.Parser CancelUploadFile
   parseCancelUploadFile = A.withObject "CancelUploadFile" $ \o -> do
    file_id <- optional $ o A..: "file_id"
    return $ CancelUploadFile { file_id = file_id }