{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.MessageReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified Utils as U

data MessageReaction = -- | Contains information about a reaction to a message
  MessageReaction
  { -- | Identifiers of at most 3 recent message senders, added the reaction; available in private, basic group and supergroup chats
    recent_sender_ids :: Maybe [MessageSender.MessageSender],
    -- | True, if the reaction is chosen by the current user
    is_chosen :: Maybe Bool,
    -- | Number of times the reaction was added
    total_count :: Maybe Int,
    -- | Text representation of the reaction
    reaction :: Maybe String
  }
  deriving (Eq)

instance Show MessageReaction where
  show
    MessageReaction
      { recent_sender_ids = recent_sender_ids,
        is_chosen = is_chosen,
        total_count = total_count,
        reaction = reaction
      } =
      "MessageReaction"
        ++ U.cc
          [ U.p "recent_sender_ids" recent_sender_ids,
            U.p "is_chosen" is_chosen,
            U.p "total_count" total_count,
            U.p "reaction" reaction
          ]

instance T.FromJSON MessageReaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageReaction" -> parseMessageReaction v
      _ -> fail ""
    where
      parseMessageReaction :: A.Value -> T.Parser MessageReaction
      parseMessageReaction = A.withObject "MessageReaction" $ \o -> do
        recent_sender_ids_ <- o A..:? "recent_sender_ids"
        is_chosen_ <- o A..:? "is_chosen"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        reaction_ <- o A..:? "reaction"
        return $ MessageReaction {recent_sender_ids = recent_sender_ids_, is_chosen = is_chosen_, total_count = total_count_, reaction = reaction_}
  parseJSON _ = fail ""

instance T.ToJSON MessageReaction where
  toJSON
    MessageReaction
      { recent_sender_ids = recent_sender_ids,
        is_chosen = is_chosen,
        total_count = total_count,
        reaction = reaction
      } =
      A.object
        [ "@type" A..= T.String "messageReaction",
          "recent_sender_ids" A..= recent_sender_ids,
          "is_chosen" A..= is_chosen,
          "total_count" A..= total_count,
          "reaction" A..= reaction
        ]
