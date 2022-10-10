{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.UnreadReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
data UnreadReaction = -- | Contains information about an unread reaction to a message
  UnreadReaction
  { -- | True, if the reaction was added with a big animation
    is_big :: Maybe Bool,
    -- | Identifier of the sender, added the reaction
    sender_id :: Maybe MessageSender.MessageSender,
    -- | Type of the reaction
    _type :: Maybe ReactionType.ReactionType
  }
  deriving (Eq)

instance Show UnreadReaction where
  show
    UnreadReaction
      { is_big = is_big_,
        sender_id = sender_id_,
        _type = _type_
      } =
      "UnreadReaction"
        ++ U.cc
          [ U.p "is_big" is_big_,
            U.p "sender_id" sender_id_,
            U.p "_type" _type_
          ]

instance T.FromJSON UnreadReaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "unreadReaction" -> parseUnreadReaction v
      _ -> mempty
    where
      parseUnreadReaction :: A.Value -> T.Parser UnreadReaction
      parseUnreadReaction = A.withObject "UnreadReaction" $ \o -> do
        is_big_ <- o A..:? "is_big"
        sender_id_ <- o A..:? "sender_id"
        _type_ <- o A..:? "type"
        return $ UnreadReaction {is_big = is_big_, sender_id = sender_id_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON UnreadReaction where
  toJSON
    UnreadReaction
      { is_big = is_big_,
        sender_id = sender_id_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "unreadReaction",
          "is_big" A..= is_big_,
          "sender_id" A..= sender_id_,
          "type" A..= _type_
        ]
