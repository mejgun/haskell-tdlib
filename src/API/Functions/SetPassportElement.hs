-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputPassportElement as InputPassportElement

--main = putStrLn "ok"

data SetPassportElement = 
 SetPassportElement { password :: String, element :: InputPassportElement.InputPassportElement }  -- deriving (Show)

instance T.ToJSON SetPassportElement where
 toJSON (SetPassportElement { password = password, element = element }) =
  A.object [ "@type" A..= T.String "setPassportElement", "password" A..= password, "element" A..= element ]
-- setPassportElement SetPassportElement  { password :: String, element :: InputPassportElement.InputPassportElement } 

