module TD.Data.AddedReaction (AddedReaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified TD.Data.MessageSender as MessageSender

data AddedReaction
  = AddedReaction -- ^ Represents a reaction applied to a message
    { _type     :: Maybe ReactionType.ReactionType   -- ^ Type of the reaction
    , sender_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the chat member, applied the reaction
    , date      :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the reaction was added
    }
  deriving (Eq)

instance Show AddedReaction where
  show AddedReaction
    { _type     = _type_
    , sender_id = sender_id_
    , date      = date_
    }
      = "AddedReaction"
        ++ I.cc
        [ "_type"     `I.p` _type_
        , "sender_id" `I.p` sender_id_
        , "date"      `I.p` date_
        ]

instance AT.FromJSON AddedReaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "addedReaction" -> parseAddedReaction v
      _               -> mempty
    
    where
      parseAddedReaction :: A.Value -> AT.Parser AddedReaction
      parseAddedReaction = A.withObject "AddedReaction" $ \o -> do
        _type_     <- o A..:?  "type"
        sender_id_ <- o A..:?  "sender_id"
        date_      <- o A..:?  "date"
        pure $ AddedReaction
          { _type     = _type_
          , sender_id = sender_id_
          , date      = date_
          }
  parseJSON _ = mempty

instance AT.ToJSON AddedReaction where
  toJSON AddedReaction
    { _type     = _type_
    , sender_id = sender_id_
    , date      = date_
    }
      = A.object
        [ "@type"     A..= AT.String "addedReaction"
        , "type"      A..= _type_
        , "sender_id" A..= sender_id_
        , "date"      A..= date_
        ]
