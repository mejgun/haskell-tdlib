-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RemoteFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoteFile = 
 RemoteFile { uploaded_size :: Int, is_uploading_completed :: Bool, is_uploading_active :: Bool, unique_id :: String, _id :: String }  -- deriving (Show)

instance T.ToJSON RemoteFile where
 toJSON (RemoteFile { uploaded_size = uploaded_size, is_uploading_completed = is_uploading_completed, is_uploading_active = is_uploading_active, unique_id = unique_id, _id = _id }) =
  A.object [ "@type" A..= T.String "remoteFile", "uploaded_size" A..= uploaded_size, "is_uploading_completed" A..= is_uploading_completed, "is_uploading_active" A..= is_uploading_active, "unique_id" A..= unique_id, "id" A..= _id ]
-- remoteFile RemoteFile  { uploaded_size :: Int, is_uploading_completed :: Bool, is_uploading_active :: Bool, unique_id :: String, _id :: String } 

