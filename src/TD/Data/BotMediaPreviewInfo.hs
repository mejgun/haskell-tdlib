module TD.Data.BotMediaPreviewInfo
  (BotMediaPreviewInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotMediaPreview as BotMediaPreview
import qualified Data.Text as T

data BotMediaPreviewInfo
  = BotMediaPreviewInfo -- ^ Contains a list of media previews of a bot for the given language and the list of languages for which the bot has dedicated previews
    { previews       :: Maybe [BotMediaPreview.BotMediaPreview] -- ^ List of media previews
    , language_codes :: Maybe [T.Text]                          -- ^ List of language codes for which the bot has dedicated previews
    }
  deriving (Eq, Show)

instance I.ShortShow BotMediaPreviewInfo where
  shortShow BotMediaPreviewInfo
    { previews       = previews_
    , language_codes = language_codes_
    }
      = "BotMediaPreviewInfo"
        ++ I.cc
        [ "previews"       `I.p` previews_
        , "language_codes" `I.p` language_codes_
        ]

instance AT.FromJSON BotMediaPreviewInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botMediaPreviewInfo" -> parseBotMediaPreviewInfo v
      _                     -> mempty
    
    where
      parseBotMediaPreviewInfo :: A.Value -> AT.Parser BotMediaPreviewInfo
      parseBotMediaPreviewInfo = A.withObject "BotMediaPreviewInfo" $ \o -> do
        previews_       <- o A..:?  "previews"
        language_codes_ <- o A..:?  "language_codes"
        pure $ BotMediaPreviewInfo
          { previews       = previews_
          , language_codes = language_codes_
          }
  parseJSON _ = mempty

