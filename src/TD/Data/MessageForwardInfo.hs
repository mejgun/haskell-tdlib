{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageForwardInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageForwardOrigin as MessageForwardOrigin
import qualified Utils as U

-- |
data MessageForwardInfo = -- | Contains information about a forwarded message
  MessageForwardInfo
  { -- | For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the original message from which the new message was forwarded last time; 0 if unknown
    from_message_id :: Maybe Int,
    -- | For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the chat from which the message was forwarded last time; 0 if unknown
    from_chat_id :: Maybe Int,
    -- | The type of a public service announcement for the forwarded message
    public_service_announcement_type :: Maybe String,
    -- | Point in time (Unix timestamp) when the message was originally sent
    date :: Maybe Int,
    -- | Origin of a forwarded message
    origin :: Maybe MessageForwardOrigin.MessageForwardOrigin
  }
  deriving (Eq)

instance Show MessageForwardInfo where
  show
    MessageForwardInfo
      { from_message_id = from_message_id_,
        from_chat_id = from_chat_id_,
        public_service_announcement_type = public_service_announcement_type_,
        date = date_,
        origin = origin_
      } =
      "MessageForwardInfo"
        ++ U.cc
          [ U.p "from_message_id" from_message_id_,
            U.p "from_chat_id" from_chat_id_,
            U.p "public_service_announcement_type" public_service_announcement_type_,
            U.p "date" date_,
            U.p "origin" origin_
          ]

instance T.FromJSON MessageForwardInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageForwardInfo" -> parseMessageForwardInfo v
      _ -> mempty
    where
      parseMessageForwardInfo :: A.Value -> T.Parser MessageForwardInfo
      parseMessageForwardInfo = A.withObject "MessageForwardInfo" $ \o -> do
        from_message_id_ <- mconcat [o A..:? "from_message_id", U.rm <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        from_chat_id_ <- mconcat [o A..:? "from_chat_id", U.rm <$> (o A..: "from_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        public_service_announcement_type_ <- o A..:? "public_service_announcement_type"
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        origin_ <- o A..:? "origin"
        return $ MessageForwardInfo {from_message_id = from_message_id_, from_chat_id = from_chat_id_, public_service_announcement_type = public_service_announcement_type_, date = date_, origin = origin_}
  parseJSON _ = mempty

instance T.ToJSON MessageForwardInfo where
  toJSON
    MessageForwardInfo
      { from_message_id = from_message_id_,
        from_chat_id = from_chat_id_,
        public_service_announcement_type = public_service_announcement_type_,
        date = date_,
        origin = origin_
      } =
      A.object
        [ "@type" A..= T.String "messageForwardInfo",
          "from_message_id" A..= from_message_id_,
          "from_chat_id" A..= from_chat_id_,
          "public_service_announcement_type" A..= public_service_announcement_type_,
          "date" A..= date_,
          "origin" A..= origin_
        ]
