-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDescription where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info rights 
-- 
-- __chat_id__ Identifier of the chat
-- 
-- __param_description__ New chat description; 0-255 characters
data SetChatDescription = 

 SetChatDescription { description :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatDescription where
 toJSON (SetChatDescription { description = description, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatDescription", "description" A..= description, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatDescription where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatDescription" -> parseSetChatDescription v
   _ -> mempty
  where
   parseSetChatDescription :: A.Value -> T.Parser SetChatDescription
   parseSetChatDescription = A.withObject "SetChatDescription" $ \o -> do
    description <- o A..:? "description"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatDescription { description = description, chat_id = chat_id }