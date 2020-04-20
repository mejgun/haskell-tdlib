-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPollAnswer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetPollAnswer = 
 SetPollAnswer { option_ids :: [Int], message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetPollAnswer where
 toJSON (SetPollAnswer { option_ids = option_ids, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setPollAnswer", "option_ids" A..= option_ids, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- setPollAnswer SetPollAnswer  { option_ids :: [Int], message_id :: Int, chat_id :: Int } 



instance T.FromJSON SetPollAnswer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setPollAnswer" -> parseSetPollAnswer v
  where
   parseSetPollAnswer :: A.Value -> T.Parser SetPollAnswer
   parseSetPollAnswer = A.withObject "SetPollAnswer" $ \o -> do
    option_ids <- o A..: "option_ids"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ SetPollAnswer { option_ids = option_ids, message_id = message_id, chat_id = chat_id }