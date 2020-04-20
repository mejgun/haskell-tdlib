-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TMeUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TMeUrlType as TMeUrlType

--main = putStrLn "ok"

data TMeUrl = 
 TMeUrl { _type :: TMeUrlType.TMeUrlType, url :: String }  -- deriving (Show)

instance T.ToJSON TMeUrl where
 toJSON (TMeUrl { _type = _type, url = url }) =
  A.object [ "@type" A..= T.String "tMeUrl", "type" A..= _type, "url" A..= url ]
-- tMeUrl TMeUrl  { _type :: TMeUrlType.TMeUrlType, url :: String } 

