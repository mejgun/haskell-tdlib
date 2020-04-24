-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddChatMember where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AddChatMember = 
 AddChatMember { forward_limit :: Maybe Int, user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AddChatMember where
 toJSON (AddChatMember { forward_limit = forward_limit, user_id = user_id, chat_id = chat_id }) =
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
    forward_limit <- optional $ o A..: "forward_limit"
    user_id <- optional $ o A..: "user_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ AddChatMember { forward_limit = forward_limit, user_id = user_id, chat_id = chat_id }