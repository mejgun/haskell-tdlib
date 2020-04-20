-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetGameScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetGameScore = 
 SetGameScore { force :: Bool, score :: Int, user_id :: Int, edit_message :: Bool, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetGameScore where
 toJSON (SetGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setGameScore", "force" A..= force, "score" A..= score, "user_id" A..= user_id, "edit_message" A..= edit_message, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- setGameScore SetGameScore  { force :: Bool, score :: Int, user_id :: Int, edit_message :: Bool, message_id :: Int, chat_id :: Int } 



instance T.FromJSON SetGameScore where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setGameScore" -> parseSetGameScore v
  where
   parseSetGameScore :: A.Value -> T.Parser SetGameScore
   parseSetGameScore = A.withObject "SetGameScore" $ \o -> do
    force <- o A..: "force"
    score <- o A..: "score"
    user_id <- o A..: "user_id"
    edit_message <- o A..: "edit_message"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ SetGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, message_id = message_id, chat_id = chat_id }