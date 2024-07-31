module TD.Data.BotMediaPreviews
  (BotMediaPreviews(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotMediaPreview as BotMediaPreview

data BotMediaPreviews
  = BotMediaPreviews -- ^ Contains a list of media previews of a bot
    { previews :: Maybe [BotMediaPreview.BotMediaPreview] -- ^ List of media previews
    }
  deriving (Eq, Show)

instance I.ShortShow BotMediaPreviews where
  shortShow BotMediaPreviews
    { previews = previews_
    }
      = "BotMediaPreviews"
        ++ I.cc
        [ "previews" `I.p` previews_
        ]

instance AT.FromJSON BotMediaPreviews where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botMediaPreviews" -> parseBotMediaPreviews v
      _                  -> mempty
    
    where
      parseBotMediaPreviews :: A.Value -> AT.Parser BotMediaPreviews
      parseBotMediaPreviews = A.withObject "BotMediaPreviews" $ \o -> do
        previews_ <- o A..:?  "previews"
        pure $ BotMediaPreviews
          { previews = previews_
          }
  parseJSON _ = mempty

