-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatAvailableReactions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right 
-- 
-- __chat_id__ Identifier of the chat
-- 
-- __available_reactions__ New list of reactions, available in the chat. All reactions must be active
data SetChatAvailableReactions = 

 SetChatAvailableReactions { available_reactions :: Maybe [String], chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatAvailableReactions where
 show SetChatAvailableReactions { available_reactions=available_reactions, chat_id=chat_id } =
  "SetChatAvailableReactions" ++ U.cc [U.p "available_reactions" available_reactions, U.p "chat_id" chat_id ]

instance T.ToJSON SetChatAvailableReactions where
 toJSON SetChatAvailableReactions { available_reactions = available_reactions, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatAvailableReactions", "available_reactions" A..= available_reactions, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatAvailableReactions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatAvailableReactions" -> parseSetChatAvailableReactions v
   _ -> mempty
  where
   parseSetChatAvailableReactions :: A.Value -> T.Parser SetChatAvailableReactions
   parseSetChatAvailableReactions = A.withObject "SetChatAvailableReactions" $ \o -> do
    available_reactions <- o A..:? "available_reactions"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatAvailableReactions { available_reactions = available_reactions, chat_id = chat_id }
 parseJSON _ = mempty
