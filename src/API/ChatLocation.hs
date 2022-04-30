-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatLocation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.Location as Location

-- |
-- 
-- Represents a location to which a chat is connected 
-- 
-- __location__ The location
-- 
-- __address__ Location address; 1-64 characters, as defined by the chat owner
data ChatLocation = 

 ChatLocation { address :: Maybe String, location :: Maybe Location.Location }  deriving (Eq)

instance Show ChatLocation where
 show ChatLocation { address=address, location=location } =
  "ChatLocation" ++ U.cc [U.p "address" address, U.p "location" location ]

instance T.ToJSON ChatLocation where
 toJSON ChatLocation { address = address, location = location } =
  A.object [ "@type" A..= T.String "chatLocation", "address" A..= address, "location" A..= location ]

instance T.FromJSON ChatLocation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatLocation" -> parseChatLocation v
   _ -> mempty
  where
   parseChatLocation :: A.Value -> T.Parser ChatLocation
   parseChatLocation = A.withObject "ChatLocation" $ \o -> do
    address <- o A..:? "address"
    location <- o A..:? "location"
    return $ ChatLocation { address = address, location = location }
 parseJSON _ = mempty
