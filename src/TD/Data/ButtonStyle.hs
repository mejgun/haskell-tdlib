module TD.Data.ButtonStyle
  (ButtonStyle(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes style of a button
data ButtonStyle
  = ButtonStyleDefault -- ^ The button has default style
  | ButtonStylePrimary -- ^ The button has dark blue color
  | ButtonStyleDanger -- ^ The button has red color
  | ButtonStyleSuccess -- ^ The button has green color
  | ButtonStyleLink -- ^ The button must be shown as a link. The style is allowed only for callback buttons in inlineButton
  deriving (Eq, Show)

instance I.ShortShow ButtonStyle where
  shortShow ButtonStyleDefault
      = "ButtonStyleDefault"
  shortShow ButtonStylePrimary
      = "ButtonStylePrimary"
  shortShow ButtonStyleDanger
      = "ButtonStyleDanger"
  shortShow ButtonStyleSuccess
      = "ButtonStyleSuccess"
  shortShow ButtonStyleLink
      = "ButtonStyleLink"

instance AT.FromJSON ButtonStyle where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "buttonStyleDefault" -> pure ButtonStyleDefault
      "buttonStylePrimary" -> pure ButtonStylePrimary
      "buttonStyleDanger"  -> pure ButtonStyleDanger
      "buttonStyleSuccess" -> pure ButtonStyleSuccess
      "buttonStyleLink"    -> pure ButtonStyleLink
      _                    -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON ButtonStyle where
  toJSON ButtonStyleDefault
      = A.object
        [ "@type" A..= AT.String "buttonStyleDefault"
        ]
  toJSON ButtonStylePrimary
      = A.object
        [ "@type" A..= AT.String "buttonStylePrimary"
        ]
  toJSON ButtonStyleDanger
      = A.object
        [ "@type" A..= AT.String "buttonStyleDanger"
        ]
  toJSON ButtonStyleSuccess
      = A.object
        [ "@type" A..= AT.String "buttonStyleSuccess"
        ]
  toJSON ButtonStyleLink
      = A.object
        [ "@type" A..= AT.String "buttonStyleLink"
        ]

