-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBackgroundUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType

--main = putStrLn "ok"

data GetBackgroundUrl = 
 GetBackgroundUrl { _type :: BackgroundType.BackgroundType, name :: String }  -- deriving (Show)

instance T.ToJSON GetBackgroundUrl where
 toJSON (GetBackgroundUrl { _type = _type, name = name }) =
  A.object [ "@type" A..= T.String "getBackgroundUrl", "type" A..= _type, "name" A..= name ]
-- getBackgroundUrl GetBackgroundUrl  { _type :: BackgroundType.BackgroundType, name :: String } 

