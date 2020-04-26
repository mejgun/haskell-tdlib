-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveTopChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TopChatCategory as TopChatCategory

-- |
-- 
-- Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled 
-- 
-- __category__ Category of frequently used chats
-- 
-- __chat_id__ Chat identifier
data RemoveTopChat = 
 RemoveTopChat { chat_id :: Maybe Int, category :: Maybe TopChatCategory.TopChatCategory }  deriving (Show, Eq)

instance T.ToJSON RemoveTopChat where
 toJSON (RemoveTopChat { chat_id = chat_id, category = category }) =
  A.object [ "@type" A..= T.String "removeTopChat", "chat_id" A..= chat_id, "category" A..= category ]

instance T.FromJSON RemoveTopChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeTopChat" -> parseRemoveTopChat v
   _ -> mempty
  where
   parseRemoveTopChat :: A.Value -> T.Parser RemoveTopChat
   parseRemoveTopChat = A.withObject "RemoveTopChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    category <- o A..:? "category"
    return $ RemoveTopChat { chat_id = chat_id, category = category }