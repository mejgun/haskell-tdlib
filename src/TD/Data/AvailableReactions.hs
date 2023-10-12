module TD.Data.AvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.AvailableReaction as AvailableReaction

data AvailableReactions
  = AvailableReactions -- ^ Represents a list of reactions that can be added to a message
    { top_reactions      :: Maybe [AvailableReaction.AvailableReaction] -- ^ List of reactions to be shown at the top
    , recent_reactions   :: Maybe [AvailableReaction.AvailableReaction] -- ^ List of recently used reactions
    , popular_reactions  :: Maybe [AvailableReaction.AvailableReaction] -- ^ List of popular reactions
    , allow_custom_emoji :: Maybe Bool                                  -- ^ True, if custom emoji reactions could be added by Telegram Premium subscribers
    }
  deriving (Eq)

instance Show AvailableReactions where
  show AvailableReactions
    { top_reactions      = top_reactions_
    , recent_reactions   = recent_reactions_
    , popular_reactions  = popular_reactions_
    , allow_custom_emoji = allow_custom_emoji_
    }
      = "AvailableReactions"
        ++ I.cc
        [ "top_reactions"      `I.p` top_reactions_
        , "recent_reactions"   `I.p` recent_reactions_
        , "popular_reactions"  `I.p` popular_reactions_
        , "allow_custom_emoji" `I.p` allow_custom_emoji_
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
        top_reactions_      <- o A..:?  "top_reactions"
        recent_reactions_   <- o A..:?  "recent_reactions"
        popular_reactions_  <- o A..:?  "popular_reactions"
        allow_custom_emoji_ <- o A..:?  "allow_custom_emoji"
        pure $ AvailableReactions
          { top_reactions      = top_reactions_
          , recent_reactions   = recent_reactions_
          , popular_reactions  = popular_reactions_
          , allow_custom_emoji = allow_custom_emoji_
          }

instance AT.ToJSON AvailableReactions where
  toJSON AvailableReactions
    { top_reactions      = top_reactions_
    , recent_reactions   = recent_reactions_
    , popular_reactions  = popular_reactions_
    , allow_custom_emoji = allow_custom_emoji_
    }
      = A.object
        [ "@type"              A..= AT.String "availableReactions"
        , "top_reactions"      A..= top_reactions_
        , "recent_reactions"   A..= recent_reactions_
        , "popular_reactions"  A..= popular_reactions_
        , "allow_custom_emoji" A..= allow_custom_emoji_
        ]
