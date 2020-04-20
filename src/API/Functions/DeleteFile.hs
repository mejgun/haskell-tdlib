-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteFile = 
 DeleteFile { file_id :: Int }  -- deriving (Show)

instance T.ToJSON DeleteFile where
 toJSON (DeleteFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "deleteFile", "file_id" A..= file_id ]
-- deleteFile DeleteFile  { file_id :: Int } 

