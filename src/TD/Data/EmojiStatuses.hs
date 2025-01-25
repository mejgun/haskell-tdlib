module TD.Data.EmojiStatuses
  (EmojiStatuses(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiStatus as EmojiStatus

data EmojiStatuses
  = EmojiStatuses -- ^ Contains a list of emoji statuses
    { emoji_statuses :: Maybe [EmojiStatus.EmojiStatus] -- ^ The list of emoji statuses identifiers
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiStatuses where
  shortShow EmojiStatuses
    { emoji_statuses = emoji_statuses_
    }
      = "EmojiStatuses"
        ++ I.cc
        [ "emoji_statuses" `I.p` emoji_statuses_
        ]

instance AT.FromJSON EmojiStatuses where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiStatuses" -> parseEmojiStatuses v
      _               -> mempty
    
    where
      parseEmojiStatuses :: A.Value -> AT.Parser EmojiStatuses
      parseEmojiStatuses = A.withObject "EmojiStatuses" $ \o -> do
        emoji_statuses_ <- o A..:?  "emoji_statuses"
        pure $ EmojiStatuses
          { emoji_statuses = emoji_statuses_
          }
  parseJSON _ = mempty

