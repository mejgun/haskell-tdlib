-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a single member of a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __user_id__ User identifier
data GetChatMember = 

 GetChatMember { user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatMember where
 toJSON (GetChatMember { user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMember", "user_id" A..= user_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatMember" -> parseGetChatMember v
   _ -> mempty
  where
   parseGetChatMember :: A.Value -> T.Parser GetChatMember
   parseGetChatMember = A.withObject "GetChatMember" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatMember { user_id = user_id, chat_id = chat_id }