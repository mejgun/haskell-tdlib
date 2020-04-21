-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

data SetChatLocation = 
 SetChatLocation { location :: ChatLocation.ChatLocation, chat_id :: Int }  deriving (Show)

instance T.ToJSON SetChatLocation where
 toJSON (SetChatLocation { location = location, chat_id = chat_id }) =
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
    location <- o A..: "location"
    chat_id <- o A..: "chat_id"
    return $ SetChatLocation { location = location, chat_id = chat_id }