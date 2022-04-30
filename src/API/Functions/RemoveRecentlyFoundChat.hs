-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveRecentlyFoundChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Removes a chat from the list of recently found chats 
-- 
-- __chat_id__ Identifier of the chat to be removed
data RemoveRecentlyFoundChat = 

 RemoveRecentlyFoundChat { chat_id :: Maybe Int }  deriving (Eq)

instance Show RemoveRecentlyFoundChat where
 show RemoveRecentlyFoundChat { chat_id=chat_id } =
  "RemoveRecentlyFoundChat" ++ U.cc [U.p "chat_id" chat_id ]

instance T.ToJSON RemoveRecentlyFoundChat where
 toJSON RemoveRecentlyFoundChat { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "removeRecentlyFoundChat", "chat_id" A..= chat_id ]

instance T.FromJSON RemoveRecentlyFoundChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeRecentlyFoundChat" -> parseRemoveRecentlyFoundChat v
   _ -> mempty
  where
   parseRemoveRecentlyFoundChat :: A.Value -> T.Parser RemoveRecentlyFoundChat
   parseRemoveRecentlyFoundChat = A.withObject "RemoveRecentlyFoundChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveRecentlyFoundChat { chat_id = chat_id }
 parseJSON _ = mempty
