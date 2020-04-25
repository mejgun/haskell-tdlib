-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RemoteFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data RemoteFile = 
 RemoteFile { uploaded_size :: Maybe Int, is_uploading_completed :: Maybe Bool, is_uploading_active :: Maybe Bool, unique_id :: Maybe String, _id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON RemoteFile where
 toJSON (RemoteFile { uploaded_size = uploaded_size, is_uploading_completed = is_uploading_completed, is_uploading_active = is_uploading_active, unique_id = unique_id, _id = _id }) =
  A.object [ "@type" A..= T.String "remoteFile", "uploaded_size" A..= uploaded_size, "is_uploading_completed" A..= is_uploading_completed, "is_uploading_active" A..= is_uploading_active, "unique_id" A..= unique_id, "id" A..= _id ]

instance T.FromJSON RemoteFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "remoteFile" -> parseRemoteFile v
   _ -> mempty
  where
   parseRemoteFile :: A.Value -> T.Parser RemoteFile
   parseRemoteFile = A.withObject "RemoteFile" $ \o -> do
    uploaded_size <- mconcat [ o A..:? "uploaded_size", readMaybe <$> (o A..: "uploaded_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_uploading_completed <- o A..:? "is_uploading_completed"
    is_uploading_active <- o A..:? "is_uploading_active"
    unique_id <- o A..:? "unique_id"
    _id <- o A..:? "id"
    return $ RemoteFile { uploaded_size = uploaded_size, is_uploading_completed = is_uploading_completed, is_uploading_active = is_uploading_active, unique_id = unique_id, _id = _id }