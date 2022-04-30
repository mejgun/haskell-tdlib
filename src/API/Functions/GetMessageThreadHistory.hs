-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageThreadHistory where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns messages in a message thread of a message. Can be used only if message.can_get_message_thread == true. Message thread of a channel message is in the channel's linked supergroup.
-- 
-- -The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_id__ Message identifier, which thread history needs to be returned
-- 
-- __from_message_id__ Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
-- 
-- __offset__ Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
-- 
-- __limit__ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
data GetMessageThreadHistory = 

 GetMessageThreadHistory { limit :: Maybe Int, offset :: Maybe Int, from_message_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessageThreadHistory where
 show GetMessageThreadHistory { limit=limit, offset=offset, from_message_id=from_message_id, message_id=message_id, chat_id=chat_id } =
  "GetMessageThreadHistory" ++ U.cc [U.p "limit" limit, U.p "offset" offset, U.p "from_message_id" from_message_id, U.p "message_id" message_id, U.p "chat_id" chat_id ]

instance T.ToJSON GetMessageThreadHistory where
 toJSON GetMessageThreadHistory { limit = limit, offset = offset, from_message_id = from_message_id, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessageThreadHistory", "limit" A..= limit, "offset" A..= offset, "from_message_id" A..= from_message_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageThreadHistory where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageThreadHistory" -> parseGetMessageThreadHistory v
   _ -> mempty
  where
   parseGetMessageThreadHistory :: A.Value -> T.Parser GetMessageThreadHistory
   parseGetMessageThreadHistory = A.withObject "GetMessageThreadHistory" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageThreadHistory { limit = limit, offset = offset, from_message_id = from_message_id, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
