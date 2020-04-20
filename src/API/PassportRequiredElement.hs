-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportRequiredElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportSuitableElement as PassportSuitableElement

--main = putStrLn "ok"

data PassportRequiredElement = 
 PassportRequiredElement { suitable_elements :: [PassportSuitableElement.PassportSuitableElement] }  -- deriving (Show)

instance T.ToJSON PassportRequiredElement where
 toJSON (PassportRequiredElement { suitable_elements = suitable_elements }) =
  A.object [ "@type" A..= T.String "passportRequiredElement", "suitable_elements" A..= suitable_elements ]
-- passportRequiredElement PassportRequiredElement  { suitable_elements :: [PassportSuitableElement.PassportSuitableElement] } 

