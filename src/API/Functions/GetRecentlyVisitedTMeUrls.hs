-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentlyVisitedTMeUrls where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetRecentlyVisitedTMeUrls = 
 GetRecentlyVisitedTMeUrls { referrer :: String }  -- deriving (Show)

instance T.ToJSON GetRecentlyVisitedTMeUrls where
 toJSON (GetRecentlyVisitedTMeUrls { referrer = referrer }) =
  A.object [ "@type" A..= T.String "getRecentlyVisitedTMeUrls", "referrer" A..= referrer ]
-- getRecentlyVisitedTMeUrls GetRecentlyVisitedTMeUrls  { referrer :: String } 

