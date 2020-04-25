-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPollVoters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPollVoters = 
 GetPollVoters { limit :: Maybe Int, offset :: Maybe Int, option_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    option_id <- mconcat [ o A..:? "option_id", readMaybe <$> (o A..: "option_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetPollVoters { limit = limit, offset = offset, option_id = option_id, message_id = message_id, chat_id = chat_id }