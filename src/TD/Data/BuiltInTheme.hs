module TD.Data.BuiltInTheme
  (BuiltInTheme(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a built-in theme of an official app
data BuiltInTheme
  = BuiltInThemeClassic -- ^ Classic light theme
  | BuiltInThemeDay -- ^ Regular light theme
  | BuiltInThemeNight -- ^ Regular dark theme
  | BuiltInThemeTinted -- ^ Tinted dark theme
  | BuiltInThemeArctic -- ^ Arctic light theme
  deriving (Eq, Show)

instance I.ShortShow BuiltInTheme where
  shortShow BuiltInThemeClassic
      = "BuiltInThemeClassic"
  shortShow BuiltInThemeDay
      = "BuiltInThemeDay"
  shortShow BuiltInThemeNight
      = "BuiltInThemeNight"
  shortShow BuiltInThemeTinted
      = "BuiltInThemeTinted"
  shortShow BuiltInThemeArctic
      = "BuiltInThemeArctic"

instance AT.FromJSON BuiltInTheme where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "builtInThemeClassic" -> pure BuiltInThemeClassic
      "builtInThemeDay"     -> pure BuiltInThemeDay
      "builtInThemeNight"   -> pure BuiltInThemeNight
      "builtInThemeTinted"  -> pure BuiltInThemeTinted
      "builtInThemeArctic"  -> pure BuiltInThemeArctic
      _                     -> mempty
    
  parseJSON _ = mempty

