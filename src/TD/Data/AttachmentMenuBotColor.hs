module TD.Data.AttachmentMenuBotColor
  (AttachmentMenuBotColor(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AttachmentMenuBotColor
  = AttachmentMenuBotColor -- ^ Describes a color to highlight a bot added to attachment menu
    { light_color :: Maybe Int -- ^ Color in the RGB format for light themes
    , dark_color  :: Maybe Int -- ^ Color in the RGB format for dark themes
    }
  deriving (Eq, Show)

instance I.ShortShow AttachmentMenuBotColor where
  shortShow AttachmentMenuBotColor
    { light_color = light_color_
    , dark_color  = dark_color_
    }
      = "AttachmentMenuBotColor"
        ++ I.cc
        [ "light_color" `I.p` light_color_
        , "dark_color"  `I.p` dark_color_
        ]

instance AT.FromJSON AttachmentMenuBotColor where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "attachmentMenuBotColor" -> parseAttachmentMenuBotColor v
      _                        -> mempty
    
    where
      parseAttachmentMenuBotColor :: A.Value -> AT.Parser AttachmentMenuBotColor
      parseAttachmentMenuBotColor = A.withObject "AttachmentMenuBotColor" $ \o -> do
        light_color_ <- o A..:?  "light_color"
        dark_color_  <- o A..:?  "dark_color"
        pure $ AttachmentMenuBotColor
          { light_color = light_color_
          , dark_color  = dark_color_
          }
  parseJSON _ = mempty

