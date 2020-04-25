-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UploadFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType
import {-# SOURCE #-} qualified API.InputFile as InputFile

data UploadFile = 
 UploadFile { priority :: Maybe Int, file_type :: Maybe FileType.FileType, file :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON UploadFile where
 toJSON (UploadFile { priority = priority, file_type = file_type, file = file }) =
  A.object [ "@type" A..= T.String "uploadFile", "priority" A..= priority, "file_type" A..= file_type, "file" A..= file ]

instance T.FromJSON UploadFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "uploadFile" -> parseUploadFile v
   _ -> mempty
  where
   parseUploadFile :: A.Value -> T.Parser UploadFile
   parseUploadFile = A.withObject "UploadFile" $ \o -> do
    priority <- mconcat [ o A..:? "priority", readMaybe <$> (o A..: "priority" :: T.Parser String)] :: T.Parser (Maybe Int)
    file_type <- o A..:? "file_type"
    file <- o A..:? "file"
    return $ UploadFile { priority = priority, file_type = file_type, file = file }