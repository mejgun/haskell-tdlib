-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CancelDownloadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CancelDownloadFile = 
 CancelDownloadFile { only_if_pending :: Bool, file_id :: Int }  -- deriving (Show)

instance T.ToJSON CancelDownloadFile where
 toJSON (CancelDownloadFile { only_if_pending = only_if_pending, file_id = file_id }) =
  A.object [ "@type" A..= T.String "cancelDownloadFile", "only_if_pending" A..= only_if_pending, "file_id" A..= file_id ]
-- cancelDownloadFile CancelDownloadFile  { only_if_pending :: Bool, file_id :: Int } 

