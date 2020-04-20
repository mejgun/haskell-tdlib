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



instance T.FromJSON SearchChatsNearby where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatsNearby" -> parseSearchChatsNearby v
  where
   parseSearchChatsNearby :: A.Value -> T.Parser SearchChatsNearby
   parseSearchChatsNearby = A.withObject "SearchChatsNearby" $ \o -> do
    location <- o A..: "location"
    return $ SearchChatsNearby { location = location }