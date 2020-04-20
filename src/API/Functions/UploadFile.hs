-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UploadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FileType as FileType
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data UploadFile = 
 UploadFile { priority :: Int, file_type :: FileType.FileType, file :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON UploadFile where
 toJSON (UploadFile { priority = priority, file_type = file_type, file = file }) =
  A.object [ "@type" A..= T.String "uploadFile", "priority" A..= priority, "file_type" A..= file_type, "file" A..= file ]
-- uploadFile UploadFile  { priority :: Int, file_type :: FileType.FileType, file :: InputFile.InputFile } 

