{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.UnreadReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified Utils as U

data UnreadReaction = -- | Contains information about an unread reaction to a message
  UnreadReaction
  { -- | True, if the reaction was added with a big animation
    is_big :: Maybe Bool,
    -- | Identifier of the sender, added the reaction
    sender_id :: Maybe MessageSender.MessageSender,
    -- | Text representation of the reaction
    reaction :: Maybe String
  }
  deriving (Eq)

instance Show UnreadReaction where
  show
    UnreadReaction
      { is_big = is_big,
        sender_id = sender_id,
        reaction = reaction
      } =
      "UnreadReaction"
        ++ U.cc
          [ U.p "is_big" is_big,
            U.p "sender_id" sender_id,
            U.p "reaction" reaction
          ]

instance T.FromJSON UnreadReaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "unreadReaction" -> parseUnreadReaction v
      _ -> fail ""
    where
      parseUnreadReaction :: A.Value -> T.Parser UnreadReaction
      parseUnreadReaction = A.withObject "UnreadReaction" $ \o -> do
        is_big_ <- o A..:? "is_big"
        sender_id_ <- o A..:? "sender_id"
        reaction_ <- o A..:? "reaction"
        return $ UnreadReaction {is_big = is_big_, sender_id = sender_id_, reaction = reaction_}
  parseJSON _ = fail ""

instance T.ToJSON UnreadReaction where
  toJSON
    UnreadReaction
      { is_big = is_big,
        sender_id = sender_id,
        reaction = reaction
      } =
      A.object
        [ "@type" A..= T.String "unreadReaction",
          "is_big" A..= is_big,
          "sender_id" A..= sender_id,
          "reaction" A..= reaction
        ]
