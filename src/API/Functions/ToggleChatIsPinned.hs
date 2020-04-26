-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatIsPinned where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the pinned state of a chat. You can pin up to GetOption("pinned_chat_count_max")/GetOption("pinned_archived_chat_count_max") non-secret chats and the same number of secret chats in the main/archive chat list 
-- 
-- __chat_id__ Chat identifier
-- 
-- __is_pinned__ New value of is_pinned
data ToggleChatIsPinned = 
 ToggleChatIsPinned { is_pinned :: Maybe Bool, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ToggleChatIsPinned where
 toJSON (ToggleChatIsPinned { is_pinned = is_pinned, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "toggleChatIsPinned", "is_pinned" A..= is_pinned, "chat_id" A..= chat_id ]

instance T.FromJSON ToggleChatIsPinned where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleChatIsPinned" -> parseToggleChatIsPinned v
   _ -> mempty
  where
   parseToggleChatIsPinned :: A.Value -> T.Parser ToggleChatIsPinned
   parseToggleChatIsPinned = A.withObject "ToggleChatIsPinned" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleChatIsPinned { is_pinned = is_pinned, chat_id = chat_id }