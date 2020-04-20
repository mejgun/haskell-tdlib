-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetFile = 
 GetFile { file_id :: Int }  -- deriving (Show)

instance T.ToJSON GetFile where
 toJSON (GetFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "getFile", "file_id" A..= file_id ]
-- getFile GetFile  { file_id :: Int } 

