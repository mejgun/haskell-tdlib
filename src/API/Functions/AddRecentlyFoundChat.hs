-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddRecentlyFoundChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first 
-- 
-- __chat_id__ Identifier of the chat to add
data AddRecentlyFoundChat = 

 AddRecentlyFoundChat { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AddRecentlyFoundChat where
 toJSON (AddRecentlyFoundChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "addRecentlyFoundChat", "chat_id" A..= chat_id ]

instance T.FromJSON AddRecentlyFoundChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addRecentlyFoundChat" -> parseAddRecentlyFoundChat v
   _ -> mempty
  where
   parseAddRecentlyFoundChat :: A.Value -> T.Parser AddRecentlyFoundChat
   parseAddRecentlyFoundChat = A.withObject "AddRecentlyFoundChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AddRecentlyFoundChat { chat_id = chat_id }