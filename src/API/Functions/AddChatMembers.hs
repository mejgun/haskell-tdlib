-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AddChatMembers = 
 AddChatMembers { user_ids :: [Int], chat_id :: Int }  deriving (Show)

instance T.ToJSON AddChatMembers where
 toJSON (AddChatMembers { user_ids = user_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "addChatMembers", "user_ids" A..= user_ids, "chat_id" A..= chat_id ]



instance T.FromJSON AddChatMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addChatMembers" -> parseAddChatMembers v

   _ -> mempty ""
  where
   parseAddChatMembers :: A.Value -> T.Parser AddChatMembers
   parseAddChatMembers = A.withObject "AddChatMembers" $ \o -> do
    user_ids <- o A..: "user_ids"
    chat_id <- o A..: "chat_id"
    return $ AddChatMembers { user_ids = user_ids, chat_id = chat_id }