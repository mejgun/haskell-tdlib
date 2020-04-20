-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElements where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElement as PassportElement

--main = putStrLn "ok"

data PassportElements = 
 PassportElements { elements :: [PassportElement.PassportElement] }  -- deriving (Show)

instance T.ToJSON PassportElements where
 toJSON (PassportElements { elements = elements }) =
  A.object [ "@type" A..= T.String "passportElements", "elements" A..= elements ]
-- passportElements PassportElements  { elements :: [PassportElement.PassportElement] } 

