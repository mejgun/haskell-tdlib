module TD.Data.GiftBackground
  (GiftBackground(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GiftBackground
  = GiftBackground -- ^ Describes background of a gift
    { center_color :: Maybe Int -- ^ Center color in RGB format
    , edge_color   :: Maybe Int -- ^ Edge color in RGB format
    , text_color   :: Maybe Int -- ^ Text color in RGB format
    }
  deriving (Eq, Show)

instance I.ShortShow GiftBackground where
  shortShow GiftBackground
    { center_color = center_color_
    , edge_color   = edge_color_
    , text_color   = text_color_
    }
      = "GiftBackground"
        ++ I.cc
        [ "center_color" `I.p` center_color_
        , "edge_color"   `I.p` edge_color_
        , "text_color"   `I.p` text_color_
        ]

instance AT.FromJSON GiftBackground where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftBackground" -> parseGiftBackground v
      _                -> mempty
    
    where
      parseGiftBackground :: A.Value -> AT.Parser GiftBackground
      parseGiftBackground = A.withObject "GiftBackground" $ \o -> do
        center_color_ <- o A..:?  "center_color"
        edge_color_   <- o A..:?  "edge_color"
        text_color_   <- o A..:?  "text_color"
        pure $ GiftBackground
          { center_color = center_color_
          , edge_color   = edge_color_
          , text_color   = text_color_
          }
  parseJSON _ = mempty

