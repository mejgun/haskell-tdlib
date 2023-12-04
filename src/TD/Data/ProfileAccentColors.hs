module TD.Data.ProfileAccentColors
  (ProfileAccentColors(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ProfileAccentColors
  = ProfileAccentColors -- ^ Contains information about supported accent colors for user profile photo background in RGB format
    { palette_colors    :: Maybe [Int] -- ^ The list of 1-2 colors in RGB format, describing the colors, as expected to be shown in the color palette settings
    , background_colors :: Maybe [Int] -- ^ The list of 1-2 colors in RGB format, describing the colors, as expected to be used for the profile photo background
    , story_colors      :: Maybe [Int] -- ^ The list of 2 colors in RGB format, describing the colors of the gradient to be used for the unread active story indicator around profile photo
    }
  deriving (Eq, Show)

instance I.ShortShow ProfileAccentColors where
  shortShow ProfileAccentColors
    { palette_colors    = palette_colors_
    , background_colors = background_colors_
    , story_colors      = story_colors_
    }
      = "ProfileAccentColors"
        ++ I.cc
        [ "palette_colors"    `I.p` palette_colors_
        , "background_colors" `I.p` background_colors_
        , "story_colors"      `I.p` story_colors_
        ]

instance AT.FromJSON ProfileAccentColors where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "profileAccentColors" -> parseProfileAccentColors v
      _                     -> mempty
    
    where
      parseProfileAccentColors :: A.Value -> AT.Parser ProfileAccentColors
      parseProfileAccentColors = A.withObject "ProfileAccentColors" $ \o -> do
        palette_colors_    <- o A..:?  "palette_colors"
        background_colors_ <- o A..:?  "background_colors"
        story_colors_      <- o A..:?  "story_colors"
        pure $ ProfileAccentColors
          { palette_colors    = palette_colors_
          , background_colors = background_colors_
          , story_colors      = story_colors_
          }
  parseJSON _ = mempty

