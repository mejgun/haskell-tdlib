-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetWebPageInstantView where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetWebPageInstantView = 
 GetWebPageInstantView { force_full :: Bool, url :: String }  -- deriving (Show)

instance T.ToJSON GetWebPageInstantView where
 toJSON (GetWebPageInstantView { force_full = force_full, url = url }) =
  A.object [ "@type" A..= T.String "getWebPageInstantView", "force_full" A..= force_full, "url" A..= url ]
-- getWebPageInstantView GetWebPageInstantView  { force_full :: Bool, url :: String } 

