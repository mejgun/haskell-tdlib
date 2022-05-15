{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatEvent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatEventAction as ChatEventAction
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
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
      { action = action_,
        member_id = member_id_,
        date = date_,
        _id = _id_
      } =
      "ChatEvent"
        ++ U.cc
          [ U.p "action" action_,
            U.p "member_id" member_id_,
            U.p "date" date_,
            U.p "_id" _id_
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
        date_ <- o A..:? "date"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ ChatEvent {action = action_, member_id = member_id_, date = date_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ChatEvent where
  toJSON
    ChatEvent
      { action = action_,
        member_id = member_id_,
        date = date_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "chatEvent",
          "action" A..= action_,
          "member_id" A..= member_id_,
          "date" A..= date_,
          "id" A..= U.toS _id_
        ]
