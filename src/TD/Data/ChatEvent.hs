{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatEvent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatEventAction as ChatEventAction
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

data ChatEvent = -- | Represents a chat event @id Chat event identifier @date Point in time (Unix timestamp) when the event happened @member_id Identifier of the user or chat who performed the action @action The action
  ChatEvent
  { -- |
    action :: Maybe ChatEventAction.ChatEventAction,
    -- |
    member_id :: Maybe MessageSender.MessageSender,
    -- |
    date :: Maybe Int,
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatEvent where
  show
    ChatEvent
      { action = action,
        member_id = member_id,
        date = date,
        _id = _id
      } =
      "ChatEvent"
        ++ U.cc
          [ U.p "action" action,
            U.p "member_id" member_id,
            U.p "date" date,
            U.p "_id" _id
          ]

instance T.FromJSON ChatEvent where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatEvent" -> parseChatEvent v
      _ -> mempty
    where
      parseChatEvent :: A.Value -> T.Parser ChatEvent
      parseChatEvent = A.withObject "ChatEvent" $ \o -> do
        action_ <- o A..:? "action"
        member_id_ <- o A..:? "member_id"
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatEvent {action = action_, member_id = member_id_, date = date_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ChatEvent where
  toJSON
    ChatEvent
      { action = action,
        member_id = member_id,
        date = date,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "chatEvent",
          "action" A..= action,
          "member_id" A..= member_id,
          "date" A..= date,
          "id" A..= _id
        ]
