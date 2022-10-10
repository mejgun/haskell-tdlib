{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
data MessageReaction = -- | Contains information about a reaction to a message
  MessageReaction
  { -- | Identifiers of at most 3 recent message senders, added the reaction; available in private, basic group and supergroup chats
    recent_sender_ids :: Maybe [MessageSender.MessageSender],
    -- | True, if the reaction is chosen by the current user
    is_chosen :: Maybe Bool,
    -- | Number of times the reaction was added
    total_count :: Maybe Int,
    -- | Type of the reaction
    _type :: Maybe ReactionType.ReactionType
  }
  deriving (Eq)

instance Show MessageReaction where
  show
    MessageReaction
      { recent_sender_ids = recent_sender_ids_,
        is_chosen = is_chosen_,
        total_count = total_count_,
        _type = _type_
      } =
      "MessageReaction"
        ++ U.cc
          [ U.p "recent_sender_ids" recent_sender_ids_,
            U.p "is_chosen" is_chosen_,
            U.p "total_count" total_count_,
            U.p "_type" _type_
          ]

instance T.FromJSON MessageReaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageReaction" -> parseMessageReaction v
      _ -> mempty
    where
      parseMessageReaction :: A.Value -> T.Parser MessageReaction
      parseMessageReaction = A.withObject "MessageReaction" $ \o -> do
        recent_sender_ids_ <- o A..:? "recent_sender_ids"
        is_chosen_ <- o A..:? "is_chosen"
        total_count_ <- o A..:? "total_count"
        _type_ <- o A..:? "type"
        return $ MessageReaction {recent_sender_ids = recent_sender_ids_, is_chosen = is_chosen_, total_count = total_count_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON MessageReaction where
  toJSON
    MessageReaction
      { recent_sender_ids = recent_sender_ids_,
        is_chosen = is_chosen_,
        total_count = total_count_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "messageReaction",
          "recent_sender_ids" A..= recent_sender_ids_,
          "is_chosen" A..= is_chosen_,
          "total_count" A..= total_count_,
          "type" A..= _type_
        ]
