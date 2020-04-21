-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatMember = 
 GetChatMember { user_id :: Int, chat_id :: Int }  deriving (Show)

instance T.ToJSON GetChatMember where
 toJSON (GetChatMember { user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMember", "user_id" A..= user_id, "chat_id" A..= chat_id ]



instance T.FromJSON GetChatMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatMember" -> parseGetChatMember v

   _ -> mempty ""
  where
   parseGetChatMember :: A.Value -> T.Parser GetChatMember
   parseGetChatMember = A.withObject "GetChatMember" $ \o -> do
    user_id <- o A..: "user_id"
    chat_id <- o A..: "chat_id"
    return $ GetChatMember { user_id = user_id, chat_id = chat_id }