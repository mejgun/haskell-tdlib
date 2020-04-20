-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DatedFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

--main = putStrLn "ok"

data DatedFile = 
 DatedFile { date :: Int, file :: File.File }  -- deriving (Show)

instance T.ToJSON DatedFile where
 toJSON (DatedFile { date = date, file = file }) =
  A.object [ "@type" A..= T.String "datedFile", "date" A..= date, "file" A..= file ]
-- datedFile DatedFile  { date :: Int, file :: File.File } 

