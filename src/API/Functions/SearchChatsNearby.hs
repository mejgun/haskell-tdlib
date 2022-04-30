-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatsNearby where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.Location as Location

-- |
-- 
-- Returns a list of users and location-based supergroups nearby. The list of users nearby will be updated for 60 seconds after the request by the updates updateUsersNearby. The request must be sent again every 25 seconds with adjusted location to not miss new chats 
-- 
-- __location__ Current user location
data SearchChatsNearby = 

 SearchChatsNearby { location :: Maybe Location.Location }  deriving (Eq)

instance Show SearchChatsNearby where
 show SearchChatsNearby { location=location } =
  "SearchChatsNearby" ++ U.cc [U.p "location" location ]

instance T.ToJSON SearchChatsNearby where
 toJSON SearchChatsNearby { location = location } =
  A.object [ "@type" A..= T.String "searchChatsNearby", "location" A..= location ]

instance T.FromJSON SearchChatsNearby where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatsNearby" -> parseSearchChatsNearby v
   _ -> mempty
  where
   parseSearchChatsNearby :: A.Value -> T.Parser SearchChatsNearby
   parseSearchChatsNearby = A.withObject "SearchChatsNearby" $ \o -> do
    location <- o A..:? "location"
    return $ SearchChatsNearby { location = location }
 parseJSON _ = mempty
