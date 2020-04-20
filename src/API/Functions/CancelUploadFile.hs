-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CancelUploadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CancelUploadFile = 
 CancelUploadFile { file_id :: Int }  -- deriving (Show)

instance T.ToJSON CancelUploadFile where
 toJSON (CancelUploadFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "cancelUploadFile", "file_id" A..= file_id ]
-- cancelUploadFile CancelUploadFile  { file_id :: Int } 

