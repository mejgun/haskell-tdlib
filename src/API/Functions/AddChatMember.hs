-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddChatMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Adds a new member to a chat. Members can't be added to private or secret chats
-- 
-- __chat_id__ Chat identifier
-- 
-- __user_id__ Identifier of the user
-- 
-- __forward_limit__ The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
data AddChatMember = 

 AddChatMember { forward_limit :: Maybe Int, user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show AddChatMember where
 show AddChatMember { forward_limit=forward_limit, user_id=user_id, chat_id=chat_id } =
  "AddChatMember" ++ U.cc [U.p "forward_limit" forward_limit, U.p "user_id" user_id, U.p "chat_id" chat_id ]

instance T.ToJSON AddChatMember where
 toJSON AddChatMember { forward_limit = forward_limit, user_id = user_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "addChatMember", "forward_limit" A..= forward_limit, "user_id" A..= user_id, "chat_id" A..= chat_id ]

instance T.FromJSON AddChatMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addChatMember" -> parseAddChatMember v
   _ -> mempty
  where
   parseAddChatMember :: A.Value -> T.Parser AddChatMember
   parseAddChatMember = A.withObject "AddChatMember" $ \o -> do
    forward_limit <- mconcat [ o A..:? "forward_limit", readMaybe <$> (o A..: "forward_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AddChatMember { forward_limit = forward_limit, user_id = user_id, chat_id = chat_id }
 parseJSON _ = mempty
