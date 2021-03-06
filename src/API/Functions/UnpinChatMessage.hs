-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UnpinChatMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Removes the pinned message from a chat; requires can_pin_messages rights in the group or channel 
-- 
-- __chat_id__ Identifier of the chat
data UnpinChatMessage = 

 UnpinChatMessage { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON UnpinChatMessage where
 toJSON (UnpinChatMessage { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "unpinChatMessage", "chat_id" A..= chat_id ]

instance T.FromJSON UnpinChatMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "unpinChatMessage" -> parseUnpinChatMessage v
   _ -> mempty
  where
   parseUnpinChatMessage :: A.Value -> T.Parser UnpinChatMessage
   parseUnpinChatMessage = A.withObject "UnpinChatMessage" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UnpinChatMessage { chat_id = chat_id }