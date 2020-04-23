-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPollVoters where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPollVoters = 
 GetPollVoters { limit :: Maybe Int, offset :: Maybe Int, option_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetPollVoters where
 toJSON (GetPollVoters { limit = limit, offset = offset, option_id = option_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPollVoters", "limit" A..= limit, "offset" A..= offset, "option_id" A..= option_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetPollVoters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPollVoters" -> parseGetPollVoters v
   _ -> mempty
  where
   parseGetPollVoters :: A.Value -> T.Parser GetPollVoters
   parseGetPollVoters = A.withObject "GetPollVoters" $ \o -> do
    limit <- optional $ o A..: "limit"
    offset <- optional $ o A..: "offset"
    option_id <- optional $ o A..: "option_id"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetPollVoters { limit = limit, offset = offset, option_id = option_id, message_id = message_id, chat_id = chat_id }