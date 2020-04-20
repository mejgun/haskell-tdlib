-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetActiveSessions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetActiveSessions = 
 GetActiveSessions -- deriving (Show)

instance T.ToJSON GetActiveSessions where
 toJSON (GetActiveSessions {  }) =
  A.object [ "@type" A..= T.String "getActiveSessions" ]
-- getActiveSessions GetActiveSessions 

