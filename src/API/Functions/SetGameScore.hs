-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetGameScore where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetGameScore = 
 SetGameScore { force :: Maybe Bool, score :: Maybe Int, user_id :: Maybe Int, edit_message :: Maybe Bool, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetGameScore where
 toJSON (SetGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setGameScore", "force" A..= force, "score" A..= score, "user_id" A..= user_id, "edit_message" A..= edit_message, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetGameScore where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setGameScore" -> parseSetGameScore v
   _ -> mempty
  where
   parseSetGameScore :: A.Value -> T.Parser SetGameScore
   parseSetGameScore = A.withObject "SetGameScore" $ \o -> do
    force <- o A..:? "force"
    score <- mconcat [ o A..:? "score", readMaybe <$> (o A..: "score" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    edit_message <- o A..:? "edit_message"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, message_id = message_id, chat_id = chat_id }