module TD.Data.GiftSettings
  ( GiftSettings(..)    
  , defaultGiftSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AcceptedGiftTypes as AcceptedGiftTypes

data GiftSettings
  = GiftSettings -- ^ Contains settings for gift receiving for a user
    { show_gift_button    :: Maybe Bool                                -- ^ True, if a button for sending a gift to the user or by the user must always be shown in the input field
    , accepted_gift_types :: Maybe AcceptedGiftTypes.AcceptedGiftTypes -- ^ Types of gifts accepted by the user; for Telegram Premium users only
    }
  deriving (Eq, Show)

instance I.ShortShow GiftSettings where
  shortShow GiftSettings
    { show_gift_button    = show_gift_button_
    , accepted_gift_types = accepted_gift_types_
    }
      = "GiftSettings"
        ++ I.cc
        [ "show_gift_button"    `I.p` show_gift_button_
        , "accepted_gift_types" `I.p` accepted_gift_types_
        ]

instance AT.FromJSON GiftSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftSettings" -> parseGiftSettings v
      _              -> mempty
    
    where
      parseGiftSettings :: A.Value -> AT.Parser GiftSettings
      parseGiftSettings = A.withObject "GiftSettings" $ \o -> do
        show_gift_button_    <- o A..:?  "show_gift_button"
        accepted_gift_types_ <- o A..:?  "accepted_gift_types"
        pure $ GiftSettings
          { show_gift_button    = show_gift_button_
          , accepted_gift_types = accepted_gift_types_
          }
  parseJSON _ = mempty

instance AT.ToJSON GiftSettings where
  toJSON GiftSettings
    { show_gift_button    = show_gift_button_
    , accepted_gift_types = accepted_gift_types_
    }
      = A.object
        [ "@type"               A..= AT.String "giftSettings"
        , "show_gift_button"    A..= show_gift_button_
        , "accepted_gift_types" A..= accepted_gift_types_
        ]

defaultGiftSettings :: GiftSettings
defaultGiftSettings =
  GiftSettings
    { show_gift_button    = Nothing
    , accepted_gift_types = Nothing
    }

