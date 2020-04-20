-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

--main = putStrLn "ok"

data ChatLocation = 
 ChatLocation { address :: String, location :: Location.Location }  -- deriving (Show)

instance T.ToJSON ChatLocation where
 toJSON (ChatLocation { address = address, location = location }) =
  A.object [ "@type" A..= T.String "chatLocation", "address" A..= address, "location" A..= location ]
-- chatLocation ChatLocation  { address :: String, location :: Location.Location } 

