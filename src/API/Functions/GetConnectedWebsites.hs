-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetConnectedWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetConnectedWebsites = 
 GetConnectedWebsites -- deriving (Show)

instance T.ToJSON GetConnectedWebsites where
 toJSON (GetConnectedWebsites {  }) =
  A.object [ "@type" A..= T.String "getConnectedWebsites" ]
-- getConnectedWebsites GetConnectedWebsites 

