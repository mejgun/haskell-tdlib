-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UnpinAllChatMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Removes all pinned messages from a chat; requires can_pin_messages rights in the group or can_edit_messages rights in the channel 
-- 
-- __chat_id__ Identifier of the chat
data UnpinAllChatMessages = 

 UnpinAllChatMessages { chat_id :: Maybe Int }  deriving (Eq)

instance Show UnpinAllChatMessages where
 show UnpinAllChatMessages { chat_id=chat_id } =
  "UnpinAllChatMessages" ++ U.cc [U.p "chat_id" chat_id ]

instance T.ToJSON UnpinAllChatMessages where
 toJSON UnpinAllChatMessages { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "unpinAllChatMessages", "chat_id" A..= chat_id ]

instance T.FromJSON UnpinAllChatMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "unpinAllChatMessages" -> parseUnpinAllChatMessages v
   _ -> mempty
  where
   parseUnpinAllChatMessages :: A.Value -> T.Parser UnpinAllChatMessages
   parseUnpinAllChatMessages = A.withObject "UnpinAllChatMessages" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UnpinAllChatMessages { chat_id = chat_id }
 parseJSON _ = mempty
