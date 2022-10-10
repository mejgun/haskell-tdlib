{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AddedReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
data AddedReaction = -- | Represents a reaction applied to a message @type Type of the reaction @sender_id Identifier of the chat member, applied the reaction
  AddedReaction
  { -- |
    sender_id :: Maybe MessageSender.MessageSender,
    -- |
    _type :: Maybe ReactionType.ReactionType
  }
  deriving (Eq)

instance Show AddedReaction where
  show
    AddedReaction
      { sender_id = sender_id_,
        _type = _type_
      } =
      "AddedReaction"
        ++ U.cc
          [ U.p "sender_id" sender_id_,
            U.p "_type" _type_
          ]

instance T.FromJSON AddedReaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "addedReaction" -> parseAddedReaction v
      _ -> mempty
    where
      parseAddedReaction :: A.Value -> T.Parser AddedReaction
      parseAddedReaction = A.withObject "AddedReaction" $ \o -> do
        sender_id_ <- o A..:? "sender_id"
        _type_ <- o A..:? "type"
        return $ AddedReaction {sender_id = sender_id_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON AddedReaction where
  toJSON
    AddedReaction
      { sender_id = sender_id_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "addedReaction",
          "sender_id" A..= sender_id_,
          "type" A..= _type_
        ]
