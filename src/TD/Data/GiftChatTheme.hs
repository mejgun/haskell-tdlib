module TD.Data.GiftChatTheme
  (GiftChatTheme(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGift as UpgradedGift
import qualified TD.Data.ThemeSettings as ThemeSettings

data GiftChatTheme
  = GiftChatTheme -- ^ Describes a chat theme based on an upgraded gift
    { gift           :: Maybe UpgradedGift.UpgradedGift   -- ^ The gift
    , light_settings :: Maybe ThemeSettings.ThemeSettings -- ^ Theme settings for a light chat theme
    , dark_settings  :: Maybe ThemeSettings.ThemeSettings -- ^ Theme settings for a dark chat theme
    }
  deriving (Eq, Show)

instance I.ShortShow GiftChatTheme where
  shortShow GiftChatTheme
    { gift           = gift_
    , light_settings = light_settings_
    , dark_settings  = dark_settings_
    }
      = "GiftChatTheme"
        ++ I.cc
        [ "gift"           `I.p` gift_
        , "light_settings" `I.p` light_settings_
        , "dark_settings"  `I.p` dark_settings_
        ]

instance AT.FromJSON GiftChatTheme where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftChatTheme" -> parseGiftChatTheme v
      _               -> mempty
    
    where
      parseGiftChatTheme :: A.Value -> AT.Parser GiftChatTheme
      parseGiftChatTheme = A.withObject "GiftChatTheme" $ \o -> do
        gift_           <- o A..:?  "gift"
        light_settings_ <- o A..:?  "light_settings"
        dark_settings_  <- o A..:?  "dark_settings"
        pure $ GiftChatTheme
          { gift           = gift_
          , light_settings = light_settings_
          , dark_settings  = dark_settings_
          }
  parseJSON _ = mempty

