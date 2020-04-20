-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatsNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

--main = putStrLn "ok"

data SearchChatsNearby = 
 SearchChatsNearby { location :: Location.Location }  -- deriving (Show)

instance T.ToJSON SearchChatsNearby where
 toJSON (SearchChatsNearby { location = location }) =
  A.object [ "@type" A..= T.String "searchChatsNearby", "location" A..= location ]
-- searchChatsNearby SearchChatsNearby  { location :: Location.Location } 

