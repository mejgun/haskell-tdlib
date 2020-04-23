-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPollAnswer where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetPollAnswer = 
 SetPollAnswer { option_ids :: Maybe [Int], message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON SetPollAnswer where
 toJSON (SetPollAnswer { option_ids = option_ids, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setPollAnswer", "option_ids" A..= option_ids, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetPollAnswer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setPollAnswer" -> parseSetPollAnswer v
   _ -> mempty
  where
   parseSetPollAnswer :: A.Value -> T.Parser SetPollAnswer
   parseSetPollAnswer = A.withObject "SetPollAnswer" $ \o -> do
    option_ids <- optional $ o A..: "option_ids"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ SetPollAnswer { option_ids = option_ids, message_id = message_id, chat_id = chat_id }