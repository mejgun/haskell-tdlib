-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data FilePart = 
 FilePart { _data :: String }  -- deriving (Show)

instance T.ToJSON FilePart where
 toJSON (FilePart { _data = _data }) =
  A.object [ "@type" A..= T.String "filePart", "data" A..= _data ]
-- filePart FilePart  { _data :: String } 

