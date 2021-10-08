-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatListsToAddChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns chat lists to which the chat can be added. This is an offline request 
-- 
-- __chat_id__ Chat identifier
data GetChatListsToAddChat = 

 GetChatListsToAddChat { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatListsToAddChat where
 show GetChatListsToAddChat { chat_id=chat_id } =
  "GetChatListsToAddChat" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatListsToAddChat where
 toJSON GetChatListsToAddChat { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatListsToAddChat", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatListsToAddChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatListsToAddChat" -> parseGetChatListsToAddChat v
   _ -> mempty
  where
   parseGetChatListsToAddChat :: A.Value -> T.Parser GetChatListsToAddChat
   parseGetChatListsToAddChat = A.withObject "GetChatListsToAddChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatListsToAddChat { chat_id = chat_id }
 parseJSON _ = mempty
