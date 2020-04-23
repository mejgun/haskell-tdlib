-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteFile where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DeleteFile = 
 DeleteFile { file_id :: Maybe Int }  deriving (Show)

instance T.ToJSON DeleteFile where
 toJSON (DeleteFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "deleteFile", "file_id" A..= file_id ]

instance T.FromJSON DeleteFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteFile" -> parseDeleteFile v
   _ -> mempty
  where
   parseDeleteFile :: A.Value -> T.Parser DeleteFile
   parseDeleteFile = A.withObject "DeleteFile" $ \o -> do
    file_id <- optional $ o A..: "file_id"
    return $ DeleteFile { file_id = file_id }