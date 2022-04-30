-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClickAnimatedEmojiMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Informs TDLib that a message with an animated emoji was clicked by the user. Returns a big animated sticker to be played or a 404 error if usual animation needs to be played 
-- 
-- __chat_id__ Chat identifier of the message
-- 
-- __message_id__ Identifier of the clicked message
data ClickAnimatedEmojiMessage = 

 ClickAnimatedEmojiMessage { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show ClickAnimatedEmojiMessage where
 show ClickAnimatedEmojiMessage { message_id=message_id, chat_id=chat_id } =
  "ClickAnimatedEmojiMessage" ++ U.cc [U.p "message_id" message_id, U.p "chat_id" chat_id ]

instance T.ToJSON ClickAnimatedEmojiMessage where
 toJSON ClickAnimatedEmojiMessage { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "clickAnimatedEmojiMessage", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON ClickAnimatedEmojiMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clickAnimatedEmojiMessage" -> parseClickAnimatedEmojiMessage v
   _ -> mempty
  where
   parseClickAnimatedEmojiMessage :: A.Value -> T.Parser ClickAnimatedEmojiMessage
   parseClickAnimatedEmojiMessage = A.withObject "ClickAnimatedEmojiMessage" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ClickAnimatedEmojiMessage { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
