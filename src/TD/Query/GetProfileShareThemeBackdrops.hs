module TD.Query.GetProfileShareThemeBackdrops
  (GetProfileShareThemeBackdrops(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of backdrops, which can be used as a background of a theme of the screen for sharing a link to a user or a chat. Returns 'TD.Data.ProfileShareThemeBackdrops.ProfileShareThemeBackdrops'
data GetProfileShareThemeBackdrops
  = GetProfileShareThemeBackdrops
  deriving (Eq, Show)

instance I.ShortShow GetProfileShareThemeBackdrops where
  shortShow
    GetProfileShareThemeBackdrops
        = "GetProfileShareThemeBackdrops"

instance AT.ToJSON GetProfileShareThemeBackdrops where
  toJSON
    GetProfileShareThemeBackdrops
        = A.object
          [ "@type" A..= AT.String "getProfileShareThemeBackdrops"
          ]

