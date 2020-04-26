-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewSupergroupChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

-- |
-- 
-- Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat 
-- 
-- __title__ Title of the new chat; 1-128 characters
-- 
-- __is_channel__ True, if a channel chat should be created
-- 
-- __param_description__ Chat description; 0-255 characters
-- 
-- __location__ Chat location if a location-based supergroup is being created
data CreateNewSupergroupChat = 
 CreateNewSupergroupChat { location :: Maybe ChatLocation.ChatLocation, description :: Maybe String, is_channel :: Maybe Bool, title :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CreateNewSupergroupChat where
 toJSON (CreateNewSupergroupChat { location = location, description = description, is_channel = is_channel, title = title }) =
  A.object [ "@type" A..= T.String "createNewSupergroupChat", "location" A..= location, "description" A..= description, "is_channel" A..= is_channel, "title" A..= title ]

instance T.FromJSON CreateNewSupergroupChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewSupergroupChat" -> parseCreateNewSupergroupChat v
   _ -> mempty
  where
   parseCreateNewSupergroupChat :: A.Value -> T.Parser CreateNewSupergroupChat
   parseCreateNewSupergroupChat = A.withObject "CreateNewSupergroupChat" $ \o -> do
    location <- o A..:? "location"
    description <- o A..:? "description"
    is_channel <- o A..:? "is_channel"
    title <- o A..:? "title"
    return $ CreateNewSupergroupChat { location = location, description = description, is_channel = is_channel, title = title }