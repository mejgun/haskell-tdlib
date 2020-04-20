-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

--main = putStrLn "ok"

data SetLocation = 
 SetLocation { location :: Location.Location }  -- deriving (Show)

instance T.ToJSON SetLocation where
 toJSON (SetLocation { location = location }) =
  A.object [ "@type" A..= T.String "setLocation", "location" A..= location ]
-- setLocation SetLocation  { location :: Location.Location } 

