-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeletePassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

--main = putStrLn "ok"

data DeletePassportElement = 
 DeletePassportElement { _type :: PassportElementType.PassportElementType }  -- deriving (Show)

instance T.ToJSON DeletePassportElement where
 toJSON (DeletePassportElement { _type = _type }) =
  A.object [ "@type" A..= T.String "deletePassportElement", "type" A..= _type ]
-- deletePassportElement DeletePassportElement  { _type :: PassportElementType.PassportElementType } 

