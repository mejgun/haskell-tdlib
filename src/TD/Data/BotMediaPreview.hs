module TD.Data.BotMediaPreview
  (BotMediaPreview(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryContent as StoryContent

data BotMediaPreview
  = BotMediaPreview -- ^ Describes media previews of a bot
    { date    :: Maybe Int                       -- ^ Point in time (Unix timestamp) when the preview was added or changed last time
    , content :: Maybe StoryContent.StoryContent -- ^ Content of the preview
    }
  deriving (Eq, Show)

instance I.ShortShow BotMediaPreview where
  shortShow BotMediaPreview
    { date    = date_
    , content = content_
    }
      = "BotMediaPreview"
        ++ I.cc
        [ "date"    `I.p` date_
        , "content" `I.p` content_
        ]

instance AT.FromJSON BotMediaPreview where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botMediaPreview" -> parseBotMediaPreview v
      _                 -> mempty
    
    where
      parseBotMediaPreview :: A.Value -> AT.Parser BotMediaPreview
      parseBotMediaPreview = A.withObject "BotMediaPreview" $ \o -> do
        date_    <- o A..:?  "date"
        content_ <- o A..:?  "content"
        pure $ BotMediaPreview
          { date    = date_
          , content = content_
          }
  parseJSON _ = mempty

