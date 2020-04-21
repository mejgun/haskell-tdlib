-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPollVoters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPollVoters = 
 GetPollVoters { limit :: Int, offset :: Int, option_id :: Int, message_id :: Int, chat_id :: Int }  deriving (Show)

instance T.ToJSON GetPollVoters where
 toJSON (GetPollVoters { limit = limit, offset = offset, option_id = option_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPollVoters", "limit" A..= limit, "offset" A..= offset, "option_id" A..= option_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]



instance T.FromJSON GetPollVoters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPollVoters" -> parseGetPollVoters v

   _ -> mempty ""
  where
   parseGetPollVoters :: A.Value -> T.Parser GetPollVoters
   parseGetPollVoters = A.withObject "GetPollVoters" $ \o -> do
    limit <- o A..: "limit"
    offset <- o A..: "offset"
    option_id <- o A..: "option_id"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ GetPollVoters { limit = limit, offset = offset, option_id = option_id, message_id = message_id, chat_id = chat_id }