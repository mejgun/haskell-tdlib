-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DisconnectAllWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DisconnectAllWebsites = 
 DisconnectAllWebsites -- deriving (Show)

instance T.ToJSON DisconnectAllWebsites where
 toJSON (DisconnectAllWebsites {  }) =
  A.object [ "@type" A..= T.String "disconnectAllWebsites" ]
-- disconnectAllWebsites DisconnectAllWebsites 

