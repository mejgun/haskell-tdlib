-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadFilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ReadFilePart = 
 ReadFilePart { count :: Int, offset :: Int, file_id :: Int }  -- deriving (Show)

instance T.ToJSON ReadFilePart where
 toJSON (ReadFilePart { count = count, offset = offset, file_id = file_id }) =
  A.object [ "@type" A..= T.String "readFilePart", "count" A..= count, "offset" A..= offset, "file_id" A..= file_id ]
-- readFilePart ReadFilePart  { count :: Int, offset :: Int, file_id :: Int } 

