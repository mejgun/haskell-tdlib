-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageForwardInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageForwardOrigin as MessageForwardOrigin

data MessageForwardInfo = 
 MessageForwardInfo { from_message_id :: Maybe Int, from_chat_id :: Maybe Int, date :: Maybe Int, origin :: Maybe MessageForwardOrigin.MessageForwardOrigin }  deriving (Show, Eq)

instance T.ToJSON MessageForwardInfo where
 toJSON (MessageForwardInfo { from_message_id = from_message_id, from_chat_id = from_chat_id, date = date, origin = origin }) =
  A.object [ "@type" A..= T.String "messageForwardInfo", "from_message_id" A..= from_message_id, "from_chat_id" A..= from_chat_id, "date" A..= date, "origin" A..= origin ]

instance T.FromJSON MessageForwardInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageForwardInfo" -> parseMessageForwardInfo v
   _ -> mempty
  where
   parseMessageForwardInfo :: A.Value -> T.Parser MessageForwardInfo
   parseMessageForwardInfo = A.withObject "MessageForwardInfo" $ \o -> do
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_chat_id <- mconcat [ o A..:? "from_chat_id", readMaybe <$> (o A..: "from_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    origin <- o A..:? "origin"
    return $ MessageForwardInfo { from_message_id = from_message_id, from_chat_id = from_chat_id, date = date, origin = origin }