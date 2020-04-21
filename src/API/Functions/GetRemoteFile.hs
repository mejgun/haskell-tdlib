-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRemoteFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType

data GetRemoteFile = 
 GetRemoteFile { file_type :: FileType.FileType, remote_file_id :: String }  deriving (Show)

instance T.ToJSON GetRemoteFile where
 toJSON (GetRemoteFile { file_type = file_type, remote_file_id = remote_file_id }) =
  A.object [ "@type" A..= T.String "getRemoteFile", "file_type" A..= file_type, "remote_file_id" A..= remote_file_id ]

instance T.FromJSON GetRemoteFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRemoteFile" -> parseGetRemoteFile v
   _ -> mempty
  where
   parseGetRemoteFile :: A.Value -> T.Parser GetRemoteFile
   parseGetRemoteFile = A.withObject "GetRemoteFile" $ \o -> do
    file_type <- o A..: "file_type"
    remote_file_id <- o A..: "remote_file_id"
    return $ GetRemoteFile { file_type = file_type, remote_file_id = remote_file_id }