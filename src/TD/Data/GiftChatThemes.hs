module TD.Data.GiftChatThemes
  (GiftChatThemes(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiftChatTheme as GiftChatTheme
import qualified Data.Text as T

data GiftChatThemes
  = GiftChatThemes -- ^ Contains a list of chat themes based on upgraded gifts
    { themes      :: Maybe [GiftChatTheme.GiftChatTheme] -- ^ A list of chat themes
    , next_offset :: Maybe T.Text                        -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow GiftChatThemes where
  shortShow GiftChatThemes
    { themes      = themes_
    , next_offset = next_offset_
    }
      = "GiftChatThemes"
        ++ I.cc
        [ "themes"      `I.p` themes_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON GiftChatThemes where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftChatThemes" -> parseGiftChatThemes v
      _                -> mempty
    
    where
      parseGiftChatThemes :: A.Value -> AT.Parser GiftChatThemes
      parseGiftChatThemes = A.withObject "GiftChatThemes" $ \o -> do
        themes_      <- o A..:?  "themes"
        next_offset_ <- o A..:?  "next_offset"
        pure $ GiftChatThemes
          { themes      = themes_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

