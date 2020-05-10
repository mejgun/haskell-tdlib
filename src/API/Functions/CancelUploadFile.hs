-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CancelUploadFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Stops the uploading of a file. Supported only for files uploaded by using uploadFile. For other files the behavior is undefined 
-- 
-- __file_id__ Identifier of the file to stop uploading
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
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CancelUploadFile { file_id = file_id }