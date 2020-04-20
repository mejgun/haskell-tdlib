-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGameHighScores where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetGameHighScores = 
 GetGameHighScores { user_id :: Int, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetGameHighScores where
 toJSON (GetGameHighScores { user_id = user_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getGameHighScores", "user_id" A..= user_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getGameHighScores GetGameHighScores  { user_id :: Int, message_id :: Int, chat_id :: Int } 



instance T.FromJSON GetGameHighScores where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGameHighScores" -> parseGetGameHighScores v
  where
   parseGetGameHighScores :: A.Value -> T.Parser GetGameHighScores
   parseGetGameHighScores = A.withObject "GetGameHighScores" $ \o -> do
    user_id <- o A..: "user_id"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ GetGameHighScores { user_id = user_id, message_id = message_id, chat_id = chat_id }