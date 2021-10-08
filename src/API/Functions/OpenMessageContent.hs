-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OpenMessageContent where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Informs TDLib that the message content has been opened (e.g., the user has opened a photo, video, document, location or venue, or has listened to an audio file or voice note message). An updateMessageContentOpened update will be generated if something has changed 
-- 
-- __chat_id__ Chat identifier of the message
-- 
-- __message_id__ Identifier of the message with the opened content
data OpenMessageContent = 

 OpenMessageContent { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show OpenMessageContent where
 show OpenMessageContent { message_id=message_id, chat_id=chat_id } =
  "OpenMessageContent" ++ cc [p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON OpenMessageContent where
 toJSON OpenMessageContent { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "openMessageContent", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON OpenMessageContent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "openMessageContent" -> parseOpenMessageContent v
   _ -> mempty
  where
   parseOpenMessageContent :: A.Value -> T.Parser OpenMessageContent
   parseOpenMessageContent = A.withObject "OpenMessageContent" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ OpenMessageContent { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
