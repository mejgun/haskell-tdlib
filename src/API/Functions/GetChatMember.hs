-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMember where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetChatMember = 
 GetChatMember { user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

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
    user_id <- optional $ o A..: "user_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetChatMember { user_id = user_id, chat_id = chat_id }