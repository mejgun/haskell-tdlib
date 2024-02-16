module TD.Data.AvailableReactions
  (AvailableReactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AvailableReaction as AvailableReaction
import qualified TD.Data.ReactionUnavailabilityReason as ReactionUnavailabilityReason

data AvailableReactions
  = AvailableReactions -- ^ Represents a list of reactions that can be added to a message
    { top_reactions         :: Maybe [AvailableReaction.AvailableReaction]                     -- ^ List of reactions to be shown at the top
    , recent_reactions      :: Maybe [AvailableReaction.AvailableReaction]                     -- ^ List of recently used reactions
    , popular_reactions     :: Maybe [AvailableReaction.AvailableReaction]                     -- ^ List of popular reactions
    , allow_custom_emoji    :: Maybe Bool                                                      -- ^ True, if any custom emoji reaction can be added by Telegram Premium subscribers
    , are_tags              :: Maybe Bool                                                      -- ^ True, if the reactions will be tags and the message can be found by them
    , unavailability_reason :: Maybe ReactionUnavailabilityReason.ReactionUnavailabilityReason -- ^ The reason why the current user can't add reactions to the message, despite some other users can; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow AvailableReactions where
  shortShow AvailableReactions
    { top_reactions         = top_reactions_
    , recent_reactions      = recent_reactions_
    , popular_reactions     = popular_reactions_
    , allow_custom_emoji    = allow_custom_emoji_
    , are_tags              = are_tags_
    , unavailability_reason = unavailability_reason_
    }
      = "AvailableReactions"
        ++ I.cc
        [ "top_reactions"         `I.p` top_reactions_
        , "recent_reactions"      `I.p` recent_reactions_
        , "popular_reactions"     `I.p` popular_reactions_
        , "allow_custom_emoji"    `I.p` allow_custom_emoji_
        , "are_tags"              `I.p` are_tags_
        , "unavailability_reason" `I.p` unavailability_reason_
        ]

instance AT.FromJSON AvailableReactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "availableReactions" -> parseAvailableReactions v
      _                    -> mempty
    
    where
      parseAvailableReactions :: A.Value -> AT.Parser AvailableReactions
      parseAvailableReactions = A.withObject "AvailableReactions" $ \o -> do
        top_reactions_         <- o A..:?  "top_reactions"
        recent_reactions_      <- o A..:?  "recent_reactions"
        popular_reactions_     <- o A..:?  "popular_reactions"
        allow_custom_emoji_    <- o A..:?  "allow_custom_emoji"
        are_tags_              <- o A..:?  "are_tags"
        unavailability_reason_ <- o A..:?  "unavailability_reason"
        pure $ AvailableReactions
          { top_reactions         = top_reactions_
          , recent_reactions      = recent_reactions_
          , popular_reactions     = popular_reactions_
          , allow_custom_emoji    = allow_custom_emoji_
          , are_tags              = are_tags_
          , unavailability_reason = unavailability_reason_
          }
  parseJSON _ = mempty

