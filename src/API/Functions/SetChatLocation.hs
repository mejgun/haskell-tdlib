-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatLocation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

-- |
-- 
-- Changes the location of a chat. Available only for some location-based supergroups, use supergroupFullInfo.can_set_location to check whether the method is allowed to use 
-- 
-- __chat_id__ Chat identifier
-- 
-- __location__ New location for the chat; must be valid and not null
data SetChatLocation = 

 SetChatLocation { location :: Maybe ChatLocation.ChatLocation, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatLocation where
 show SetChatLocation { location=location, chat_id=chat_id } =
  "SetChatLocation" ++ U.cc [U.p "location" location, U.p "chat_id" chat_id ]

instance T.ToJSON SetChatLocation where
 toJSON SetChatLocation { location = location, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatLocation", "location" A..= location, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatLocation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatLocation" -> parseSetChatLocation v
   _ -> mempty
  where
   parseSetChatLocation :: A.Value -> T.Parser SetChatLocation
   parseSetChatLocation = A.withObject "SetChatLocation" $ \o -> do
    location <- o A..:? "location"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatLocation { location = location, chat_id = chat_id }
 parseJSON _ = mempty
