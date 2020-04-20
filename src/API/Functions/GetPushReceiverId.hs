-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPushReceiverId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPushReceiverId = 
 GetPushReceiverId { payload :: String }  -- deriving (Show)

instance T.ToJSON GetPushReceiverId where
 toJSON (GetPushReceiverId { payload = payload }) =
  A.object [ "@type" A..= T.String "getPushReceiverId", "payload" A..= payload ]
-- getPushReceiverId GetPushReceiverId  { payload :: String } 

