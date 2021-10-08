-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRemoteFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.FileType as FileType

-- |
-- 
-- Returns information about a file by its remote ID; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message. Even the request succeeds, the file can be used only if it is still accessible to the user.
-- 
-- -For example, if the file is from a message, then the message must be not deleted and accessible to the user. If the file database is disabled, then the corresponding object with the file must be preloaded by the application
-- 
-- __remote_file_id__ Remote identifier of the file to get
-- 
-- __file_type__ File type; pass null if unknown
data GetRemoteFile = 

 GetRemoteFile { file_type :: Maybe FileType.FileType, remote_file_id :: Maybe String }  deriving (Eq)

instance Show GetRemoteFile where
 show GetRemoteFile { file_type=file_type, remote_file_id=remote_file_id } =
  "GetRemoteFile" ++ cc [p "file_type" file_type, p "remote_file_id" remote_file_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetRemoteFile where
 toJSON GetRemoteFile { file_type = file_type, remote_file_id = remote_file_id } =
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
    file_type <- o A..:? "file_type"
    remote_file_id <- o A..:? "remote_file_id"
    return $ GetRemoteFile { file_type = file_type, remote_file_id = remote_file_id }
 parseJSON _ = mempty
