-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageViewers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes and voice notes only users, opened content of the message, are returned. The method can be called if message.can_get_viewers == true 
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_id__ Identifier of the message
data GetMessageViewers = 

 GetMessageViewers { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessageViewers where
 show GetMessageViewers { message_id=message_id, chat_id=chat_id } =
  "GetMessageViewers" ++ cc [p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMessageViewers where
 toJSON GetMessageViewers { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessageViewers", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageViewers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageViewers" -> parseGetMessageViewers v
   _ -> mempty
  where
   parseGetMessageViewers :: A.Value -> T.Parser GetMessageViewers
   parseGetMessageViewers = A.withObject "GetMessageViewers" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageViewers { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
