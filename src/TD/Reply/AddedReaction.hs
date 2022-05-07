{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.AddedReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified Utils as U

data AddedReaction = -- | Represents a reaction applied to a message @reaction Text representation of the reaction @sender_id Identifier of the chat member, applied the reaction
  AddedReaction
  { -- |
    sender_id :: Maybe MessageSender.MessageSender,
    -- |
    reaction :: Maybe String
  }
  deriving (Eq)

instance Show AddedReaction where
  show
    AddedReaction
      { sender_id = sender_id,
        reaction = reaction
      } =
      "AddedReaction"
        ++ U.cc
          [ U.p "sender_id" sender_id,
            U.p "reaction" reaction
          ]

instance T.FromJSON AddedReaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "addedReaction" -> parseAddedReaction v
      _ -> fail ""
    where
      parseAddedReaction :: A.Value -> T.Parser AddedReaction
      parseAddedReaction = A.withObject "AddedReaction" $ \o -> do
        sender_id_ <- o A..:? "sender_id"
        reaction_ <- o A..:? "reaction"
        return $ AddedReaction {sender_id = sender_id_, reaction = reaction_}
  parseJSON _ = fail ""

instance T.ToJSON AddedReaction where
  toJSON
    AddedReaction
      { sender_id = sender_id,
        reaction = reaction
      } =
      A.object
        [ "@type" A..= T.String "addedReaction",
          "sender_id" A..= sender_id,
          "reaction" A..= reaction
        ]
