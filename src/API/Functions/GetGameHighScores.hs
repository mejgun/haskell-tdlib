-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGameHighScores where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetGameHighScores = 
 GetGameHighScores { user_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetGameHighScores where
 toJSON (GetGameHighScores { user_id = user_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getGameHighScores", "user_id" A..= user_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetGameHighScores where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGameHighScores" -> parseGetGameHighScores v
   _ -> mempty
  where
   parseGetGameHighScores :: A.Value -> T.Parser GetGameHighScores
   parseGetGameHighScores = A.withObject "GetGameHighScores" $ \o -> do
    user_id <- optional $ o A..: "user_id"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetGameHighScores { user_id = user_id, message_id = message_id, chat_id = chat_id }