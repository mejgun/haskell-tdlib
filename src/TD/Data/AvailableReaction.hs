module TD.Data.AvailableReaction
  (AvailableReaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

data AvailableReaction
  = AvailableReaction -- ^ Represents an available reaction
    { _type         :: Maybe ReactionType.ReactionType -- ^ Type of the reaction
    , needs_premium :: Maybe Bool                      -- ^ True, if Telegram Premium is needed to send the reaction
    }
  deriving (Eq, Show)

instance I.ShortShow AvailableReaction where
  shortShow AvailableReaction
    { _type         = _type_
    , needs_premium = needs_premium_
    }
      = "AvailableReaction"
        ++ I.cc
        [ "_type"         `I.p` _type_
        , "needs_premium" `I.p` needs_premium_
        ]

instance AT.FromJSON AvailableReaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "availableReaction" -> parseAvailableReaction v
      _                   -> mempty
    
    where
      parseAvailableReaction :: A.Value -> AT.Parser AvailableReaction
      parseAvailableReaction = A.withObject "AvailableReaction" $ \o -> do
        _type_         <- o A..:?  "type"
        needs_premium_ <- o A..:?  "needs_premium"
        pure $ AvailableReaction
          { _type         = _type_
          , needs_premium = needs_premium_
          }
  parseJSON _ = mempty

