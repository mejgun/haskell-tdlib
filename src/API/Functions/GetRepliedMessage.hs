-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRepliedMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a message that is replied by a given message. Also returns the pinned message, the game message, and the invoice message for messages of the types messagePinMessage, messageGameScore, and messagePaymentSuccessful respectively
-- 
-- __chat_id__ Identifier of the chat the message belongs to
-- 
-- __message_id__ Identifier of the message reply to which to get
data GetRepliedMessage = 

 GetRepliedMessage { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetRepliedMessage where
 show GetRepliedMessage { message_id=message_id, chat_id=chat_id } =
  "GetRepliedMessage" ++ cc [p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetRepliedMessage where
 toJSON GetRepliedMessage { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getRepliedMessage", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetRepliedMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRepliedMessage" -> parseGetRepliedMessage v
   _ -> mempty
  where
   parseGetRepliedMessage :: A.Value -> T.Parser GetRepliedMessage
   parseGetRepliedMessage = A.withObject "GetRepliedMessage" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetRepliedMessage { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
