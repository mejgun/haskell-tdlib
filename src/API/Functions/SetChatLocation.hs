-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatLocation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

data SetChatLocation = 
 SetChatLocation { location :: Maybe ChatLocation.ChatLocation, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    location <- o A..:? "location"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatLocation { location = location, chat_id = chat_id }