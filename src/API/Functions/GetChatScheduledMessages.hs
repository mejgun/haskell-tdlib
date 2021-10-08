-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatScheduledMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns all scheduled messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id) 
-- 
-- __chat_id__ Chat identifier
data GetChatScheduledMessages = 

 GetChatScheduledMessages { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatScheduledMessages where
 show GetChatScheduledMessages { chat_id=chat_id } =
  "GetChatScheduledMessages" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatScheduledMessages where
 toJSON GetChatScheduledMessages { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatScheduledMessages", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatScheduledMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatScheduledMessages" -> parseGetChatScheduledMessages v
   _ -> mempty
  where
   parseGetChatScheduledMessages :: A.Value -> T.Parser GetChatScheduledMessages
   parseGetChatScheduledMessages = A.withObject "GetChatScheduledMessages" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatScheduledMessages { chat_id = chat_id }
 parseJSON _ = mempty
