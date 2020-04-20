-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AddChatMember = 
 AddChatMember { forward_limit :: Int, user_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON AddChatMember where
 toJSON (AddChatMember { forward_limit = forward_limit, user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "addChatMember", "forward_limit" A..= forward_limit, "user_id" A..= user_id, "chat_id" A..= chat_id ]
-- addChatMember AddChatMember  { forward_limit :: Int, user_id :: Int, chat_id :: Int } 



instance T.FromJSON AddChatMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addChatMember" -> parseAddChatMember v
  where
   parseAddChatMember :: A.Value -> T.Parser AddChatMember
   parseAddChatMember = A.withObject "AddChatMember" $ \o -> do
    forward_limit <- o A..: "forward_limit"
    user_id <- o A..: "user_id"
    chat_id <- o A..: "chat_id"
    return $ AddChatMember { forward_limit = forward_limit, user_id = user_id, chat_id = chat_id }